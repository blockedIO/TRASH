package ssm.service;

import ssm.pojo.District;
import ssm.pojo.House;
import ssm.pojo.Street;
import ssm.pojo.Type;

import java.util.List;

public interface CrudService {

    //添加区域
    int addDistrict(District district);

    //查询区域
    District getDistrict(Integer id);

    //修改区域
    int changeDistrict(District district);

    //批量删除区域
    int deleteManyDistrict(Integer[] ids);

    //得到房屋类型列表
    List<Type> getTypeList();

    //得到区域列表
    List<District> getDistrictList();

    //根据区域id得到街道列表
    List<Street> getStreetList(Integer districtId);

    //添加房屋信息
    boolean addHouse(House house);

    //根据id查找房屋信息和街道
    House findHouse(String id);

    //修改房屋信息
    int modifyHouse(House house);
}
