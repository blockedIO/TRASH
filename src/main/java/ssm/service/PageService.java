package ssm.service;

import com.github.pagehelper.PageInfo;
import ssm.pojo.District;
import ssm.pojo.House;
import ssm.pojo.User;
import ssm.util.PageUtil;
import ssm.util.UserCondition;

public interface PageService {

    //区域的分页查询
    PageInfo<District> getDistrict(PageUtil pageUtil);

    //用户的分页查询
    PageInfo<User> getUserByCondition(UserCondition condition);

    //用户发布的房屋分页查询
    PageInfo<House> getHouseByUser(Integer uid, PageUtil pageUtil);

    //所有房屋的分页查询
    PageInfo<House> getAllHouse(PageUtil pageUtil);
}
