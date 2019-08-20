package com.datasus.mappers;

import com.datasus.model.State;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface StateMapper {
    List<State>  findAll();
}
