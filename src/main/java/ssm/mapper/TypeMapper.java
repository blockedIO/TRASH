package ssm.mapper;

import org.apache.ibatis.annotations.Select;
import ssm.pojo.Type;

import java.util.List;

public interface TypeMapper {

    @Select("select * from type")
    List<Type> selectTypeList();
}
