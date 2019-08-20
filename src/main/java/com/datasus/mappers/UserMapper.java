package com.datasus.mappers;

import com.datasus.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserMapper {

    User findUserByEmail(@Param("email") String email);

    User findByUsername(@Param("username") String username);

    void save(@Param("user") User user);


}
