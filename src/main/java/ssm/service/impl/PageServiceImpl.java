package ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssm.mapper.DistrictMapper;
import ssm.mapper.HouseMapper;
import ssm.mapper.UserMapper;
import ssm.pojo.District;
import ssm.pojo.House;
import ssm.pojo.HouseExample;
import ssm.pojo.User;
import ssm.service.PageService;
import ssm.util.PageUtil;
import ssm.util.UserCondition;

import java.util.List;

@Service
public class PageServiceImpl implements PageService {

    @Autowired
    private DistrictMapper districtMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private HouseMapper houseMapper;

    public PageInfo<District> getDistrict(PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPage(), pageUtil.getRows());
        List<District> list = districtMapper.selectAllDistrict();
        return new PageInfo<>(list);
    }

    public PageInfo<User> getUserByCondition(UserCondition condition) {
        PageHelper.startPage(condition.getPage(), condition.getRows());
        List<User> list = userMapper.selectUserByCondition(condition);
        return new PageInfo<>(list);
    }

    public PageInfo<House> getHouseByUser(Integer uid, PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPage(), pageUtil.getRows());
        List<House> list = houseMapper.selectHouseByUser(uid);
        return new PageInfo<>(list);
    }

    public PageInfo<House> getAllHouse(PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPage(), pageUtil.getRows());
        List<House> list =  houseMapper.selectAllHouse();
        return new PageInfo<>(list);
    }

}
