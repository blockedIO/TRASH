package ssm.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import ssm.pojo.*;
import ssm.service.CrudService;
import ssm.service.PageService;
import ssm.util.PageUtil;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;

@Controller
@RequestMapping("page")
public class HouseController {

    @Autowired
    private CrudService crudService;
    @Autowired
    private PageService pageService;

    @RequestMapping("getTypeList")
    @ResponseBody
    public List<Type> getTypeList(){
        return crudService.getTypeList();
    }

    @RequestMapping("getDistrictList")
    @ResponseBody
    public List<District> getDistrictList(){
        return crudService.getDistrictList();
    }

    @RequestMapping("getStreetList")
    @ResponseBody
    public List<Street> getStreetList(Integer districtId){
        return crudService.getStreetList(districtId);
    }

    /**
     * @param insertFile 在接收 CommonsMultipartFile 对象时，需要在对象前加 @RequestParam 注解
     */
    @RequestMapping("addHouse")
    public String addHouse(@RequestParam(required = false) CommonsMultipartFile insertFile,
                           HttpSession session,
                           House house) throws Exception {
        User user = (User)session.getAttribute("user");
        Long time = System.currentTimeMillis();
        //填充house的字段
        house.setId(time.toString());
        house.setUserId(user.getId());
        house.setIspass(0);
        house.setIsdel(0);
        if(!insertFile.getOriginalFilename().equals("")) {
            StringBuilder filePath = new StringBuilder("F:\\images\\");
            String fileType = insertFile.getContentType().split("/")[1];
            filePath.append(time).append(".").append(fileType);
            File file = new File(filePath.toString());
            insertFile.transferTo(file);
            house.setPath(time.toString()+"."+fileType);
        }
        return crudService.addHouse(house)?"redirect:getHouseByUser?page=1":"fabu";
    }

    @RequestMapping("getHouseByUser")
    public String getHouseByUser(PageUtil pageUtil, HttpSession session, Model model){
        pageUtil.setRows(5);
        User user = (User) session.getAttribute("user");
        PageInfo<House> pageInfo = pageService.getHouseByUser(user.getId(),pageUtil);
        model.addAttribute("pageInfo",pageInfo);
        return "guanli";
    }

    @RequestMapping("beforeUpdate")
    public String beforeUpdate(String id, Model model){
        House house = crudService.findHouse(id);
        model.addAttribute("house",house);
        return "updateHouse";
    }

    @RequestMapping("updateHouse")
    public String updateHouse(House house,
                              @RequestParam(required = false)CommonsMultipartFile insertFile) throws Exception{
        if(!insertFile.getOriginalFilename().equals("")) {
            //上传新图片
            Long time = System.currentTimeMillis();
            StringBuilder filePath = new StringBuilder("F:\\images\\");
            String fileType = insertFile.getContentType().split("/")[1];
            filePath.append(time).append(".").append(fileType);
            File file = new File(filePath.toString());
            insertFile.transferTo(file);
            //删除原有图片
            if (house.getPath() != null) {
                File oldFile = new File("F:\\images\\" + house.getPath());
                oldFile.delete();
            }
            house.setPath(time.toString()+"."+fileType);
        }
        crudService.modifyHouse(house);
        return "redirect:getHouseByUser?page=1";
    }

    @RequestMapping("deleteHouse")
    public String deleteHouse(String id){
        House house = new House();
        house.setId(id);
        house.setIsdel(1);
        crudService.modifyHouse(house);
        return "redirect:getHouseByUser?page=1";
    }
}