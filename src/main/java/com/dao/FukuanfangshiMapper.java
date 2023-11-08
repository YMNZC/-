package com.dao;

import com.entity.Fukuanfangshi;
import com.entity.FukuanfangshiExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @ClassName FukuanfangshiMapper
 * @Description 付款方式模块数据持久层
 */
public interface FukuanfangshiMapper {

    //根据条件获取付款方式表fukuanfangshi的数据数量
    int countByExample(FukuanfangshiExample example);

    //根据条件删除付款方式表fukuanfangshi的数据
    int deleteByExample(FukuanfangshiExample example);

    //根据主键ID列删除付款方式表fukuanfangshi的数据
    int deleteByPrimaryKey(Integer id);

    //插入付款方式表fukuanfangshi的实体数据（包含null值）
    int insert(Fukuanfangshi record);

    //插入付款方式表fukuanfangshi的实体数据（不包含null值）
    int insertSelective(Fukuanfangshi record);

    //根据条件获取付款方式表fukuanfangshi的数据列表
    List<Fukuanfangshi> selectByExample(FukuanfangshiExample example);

    //根据主键ID列获取付款方式表fukuanfangshi的数据实体
    Fukuanfangshi selectByPrimaryKey(Integer id);

    //根据条件更新付款方式表fukuanfangshi的实体数据（不包含null值）
    int updateByExampleSelective(@Param("record") Fukuanfangshi record, @Param("example") FukuanfangshiExample example);

    //根据条件更新付款方式表fukuanfangshi的实体数据（包含null值）
    int updateByExample(@Param("record") Fukuanfangshi record, @Param("example") FukuanfangshiExample example);

    //根据主键ID列更新付款方式表fukuanfangshi的实体数据（不包含null值）
    int updateByPrimaryKeySelective(Fukuanfangshi record);

    //根据主键ID列更新付款方式表fukuanfangshi的实体数据（包含null值）
    int updateByPrimaryKey(Fukuanfangshi record);
}
