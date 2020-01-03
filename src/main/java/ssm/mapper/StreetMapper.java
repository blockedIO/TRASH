package ssm.mapper;

import org.apache.ibatis.annotations.Select;
import ssm.pojo.Street;

import java.util.List;

public interface StreetMapper {

    @Select("select id,name from street where district_id=#{did}")
    List<Street> selectStreetList(Integer did);
}
