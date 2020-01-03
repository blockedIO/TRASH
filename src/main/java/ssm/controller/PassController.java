package ssm.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ssm.pojo.House;
import ssm.service.CrudService;
import ssm.service.PageService;
import ssm.util.PageUtil;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("admin")
public class PassController {

    @Autowired
    private PageService pageService;
    @Autowired
    private CrudService crudService;

    @RequestMapping("getHouseData")
    public Map<String, Object> getHouseData(PageUtil pageUtil){
        PageInfo<House> pageInfo = pageService.getAllHouse(pageUtil);
        Map<String, Object> map = new HashMap<>(20);
        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());
        return map;
    }

    @RequestMapping("passHouse")
    public Map<String, Object> passHouse(String id, Integer state){
        Map<String, Object> map = new HashMap<>(20);
        House house = new House();
        house.setId(id);
        house.setIspass(state);
        if(crudService.modifyHouse(house)>0){
            map.put("result",1);
        }else{
            map.put("result",-1);
        }
        return map;
    }
}
