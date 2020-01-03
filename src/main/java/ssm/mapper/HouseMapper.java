package ssm.mapper;

import java.util.List;
import ssm.pojo.House;
import ssm.pojo.HouseExample;

public interface HouseMapper {
    int deleteByPrimaryKey(String id);

    int insert(House record);

    int insertSelective(House record);

    List<House> selectByExample(HouseExample example);

    House selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(House record);

    int updateByPrimaryKey(House record);

    List<House> selectHouseByUser(Integer uid);

    House selectHouseById(String id);

    List<House> selectAllHouse();
}