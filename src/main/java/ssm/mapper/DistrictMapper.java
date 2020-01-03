package ssm.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import ssm.pojo.District;

import java.util.List;

public interface DistrictMapper {

    @Select("select * from district")
    List<District> selectAllDistrict();

    @Insert("insert into district values(null,#{name})")
    int insert(District district);

    @Select("select id,name from district where id = #{id}")
    District selectById(Integer id);

    @Update("update district set name = #{name} where id = #{id}")
    int update(District district);

    int deleteManyDistrict(Integer[] ids);
}
