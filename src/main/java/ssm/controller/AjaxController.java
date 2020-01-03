package ssm.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ssm.pojo.District;
import ssm.pojo.User;
import ssm.service.CrudService;
import ssm.service.PageService;
import ssm.util.PageUtil;
import ssm.util.UserCondition;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("admin")
public class AjaxController {

    @Autowired
    private PageService pageService;
    @Autowired
    private CrudService crudService;

    @RequestMapping("getDistrictData")
    public Map<String, Object> getDistrictData(PageUtil pageUtil){
        PageInfo<District> pageInfo = pageService.getDistrict(pageUtil);
        Map<String, Object> map = new HashMap<>(20);
        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());
        return map;
    }

    @RequestMapping("addDistrict")
    public Map<String, Object> addDistrict(District district){
        int result = crudService.addDistrict(district);
        Map<String, Object> map = new HashMap<>(20);
        if(result>0) {
            map.put("result", result);
        }else{
            map.put("result",-1);
        }
        return map;
    }

    @RequestMapping("getDistrict")
    public District getDistrict(Integer id){
        return crudService.getDistrict(id);
    }

    @RequestMapping("changeDistrict")
    public Map<String, Object> changeDistrict(District district){
        int result = crudService.changeDistrict(district);
        Map<String, Object> map = new HashMap<>(20);
        if(result>0) {
            map.put("result", result);
        }else{
            map.put("result",-1);
        }
        return map;
    }

    @RequestMapping("deleteManyDistrict")
    public Map<String, Object> deleteManyDistrict(String ids){
        String[] strings = ids.split(",");
        Integer[] integers = new Integer[strings.length];
        for (int i = 0; i < strings.length; i++) {
            integers[i] = Integer.parseInt(strings[i]);
        }
        int result = crudService.deleteManyDistrict(integers);
        Map<String, Object> map = new HashMap<>(20);
        if(result>0) {
            map.put("result", result);
        }else{
            map.put("result",-1);
        }
        return map;
    }

    @RequestMapping("getUserData")
    public Map<String, Object> getUserData(UserCondition condition){
        PageInfo<User> pageInfo = pageService.getUserByCondition(condition);
        Map<String, Object> map = new HashMap<>(20);
        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());
        return map;
    }
}
