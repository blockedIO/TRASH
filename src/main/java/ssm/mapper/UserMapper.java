package ssm.mapper;

import org.apache.ibatis.annotations.*;
import ssm.pojo.User;
import ssm.util.UserCondition;

import java.util.List;

public interface UserMapper {

    List<User> selectUserByCondition(UserCondition condition);

    @Select("select count(1) from users where name=#{name}")
    Integer checkExist(String name);

    @Insert("insert into users values(null,#{name},#{password},#{telephone},0)")
    Integer signUp(User user);

    @Select("select * from users where name=#{name} and password=#{password}")
    User signIn(@Param("name") String name, @Param("password") String password);
}
