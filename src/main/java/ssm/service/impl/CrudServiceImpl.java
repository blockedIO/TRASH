package ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssm.mapper.DistrictMapper;
import ssm.mapper.HouseMapper;
import ssm.mapper.StreetMapper;
import ssm.mapper.TypeMapper;
import ssm.pojo.District;
import ssm.pojo.House;
import ssm.pojo.Street;
import ssm.pojo.Type;
import ssm.service.CrudService;

import java.util.List;

@Service
public class CrudServiceImpl implements CrudService {

    @Autowired
    private DistrictMapper districtMapper;
    @Autowired
    private TypeMapper typeMapper;
    @Autowired
    private StreetMapper streetMapper;
    @Autowired
    private HouseMapper houseMapper;

    public int addDistrict(District district) {
        return districtMapper.insert(district);
    }

    public District getDistrict(Integer id) {
        return districtMapper.selectById(id);
    }

    public int changeDistrict(District district) {
        return districtMapper.update(district);
    }

    public int deleteManyDistrict(Integer[] ids) {
        return districtMapper.deleteManyDistrict(ids);
    }

    public List<Type> getTypeList() {
        return typeMapper.selectTypeList();
    }

    public List<District> getDistrictList() {
        return districtMapper.selectAllDistrict();
    }

    public List<Street> getStreetList(Integer districtId) {
        return streetMapper.selectStreetList(districtId);
    }

    public boolean addHouse(House house) {
        return houseMapper.insertSelective(house)>0;
    }

    public House findHouse(String id) {
        return houseMapper.selectHouseById(id);
    }

    public int modifyHouse(House house) {
        return houseMapper.updateByPrimaryKeySelective(house);
    }
}
