package com.datasus.mappers;

import com.datasus.model.City;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CityMapper {
    List<City>  findByUf(@Param("uf") String uf);
}
