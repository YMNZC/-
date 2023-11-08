package com.dao;

import com.entity.Shangpin;
import com.entity.ShangpinExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @ClassName ShangpinMapper
 * @Description 商品模块数据持久层
 */
public interface ShangpinMapper {

    //根据条件获取商品表shangpin的数据数量
    int countByExample(ShangpinExample example);

    //根据条件删除商品表shangpin的数据
    int deleteByExample(ShangpinExample example);

    //根据主键ID列删除商品表shangpin的数据
    int deleteByPrimaryKey(Integer id);

    //插入商品表shangpin的实体数据（包含null值）
    int insert(Shangpin record);

    //插入商品表shangpin的实体数据（不包含null值）
    int insertSelective(Shangpin record);

    //根据条件获取商品表shangpin的数据列表
    List<Shangpin> selectByExample(ShangpinExample example);

    //根据主键ID列获取商品表shangpin的数据实体
    Shangpin selectByPrimaryKey(Integer id);

    //根据条件更新商品表shangpin的实体数据（不包含null值）
    int updateByExampleSelective(@Param("record") Shangpin record, @Param("example") ShangpinExample example);

    //根据条件更新商品表shangpin的实体数据（包含null值）
    int updateByExample(@Param("record") Shangpin record, @Param("example") ShangpinExample example);

    //根据主键ID列更新商品表shangpin的实体数据（不包含null值）
    int updateByPrimaryKeySelective(Shangpin record);

    //根据主键ID列更新商品表shangpin的实体数据（包含null值）
    int updateByPrimaryKey(Shangpin record);
}
