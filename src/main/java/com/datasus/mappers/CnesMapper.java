package com.datasus.mappers;

import com.datasus.model.Cnes;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Mapper
@Repository
public interface CnesMapper {
    List<Cnes> findByCnes(String cnes);
    List<Cnes> findAll();
    List<HashMap> groupingReport(@Param("colunas") String columns,
                                 @Param("listaMunicipios") String[] cities,
                                 @Param("uf") String uf,
                                 @Param("cbos") String[] cbos,
                                 @Param("isSUS") Boolean isSUS,
                                 @Param("notIsSUS") Boolean notIsSus);

}
