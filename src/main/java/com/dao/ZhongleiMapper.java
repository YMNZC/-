package com.dao;

import com.entity.Zhonglei;
import com.entity.ZhongleiExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @ClassName ZhongleiMapper
 * @Description 分类模块数据持久层
 */
public interface ZhongleiMapper {

    //根据条件获取分类表zhonglei的数据数量
    int countByExample(ZhongleiExample example);

    //根据条件删除分类表zhonglei的数据
    int deleteByExample(ZhongleiExample example);

    //根据主键ID列删除分类表zhonglei的数据
    int deleteByPrimaryKey(Integer id);

    //插入分类表zhonglei的实体数据（包含null值）
    int insert(Zhonglei record);

    //插入分类表zhonglei的实体数据（不包含null值）
    int insertSelective(Zhonglei record);

    //根据条件获取分类表zhonglei的数据列表
    List<Zhonglei> selectByExample(ZhongleiExample example);

    //根据主键ID列获取分类表zhonglei的数据实体
    Zhonglei selectByPrimaryKey(Integer id);

    //根据条件更新分类表zhonglei的实体数据（不包含null值）
    int updateByExampleSelective(@Param("record") Zhonglei record, @Param("example") ZhongleiExample example);

    //根据条件更新分类表zhonglei的实体数据（包含null值）
    int updateByExample(@Param("record") Zhonglei record, @Param("example") ZhongleiExample example);

    //根据主键ID列更新分类表zhonglei的实体数据（不包含null值）
    int updateByPrimaryKeySelective(Zhonglei record);

    //根据主键ID列更新分类表zhonglei的实体数据（包含null值）
    int updateByPrimaryKey(Zhonglei record);
}
