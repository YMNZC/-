package com.dao;

import com.entity.Pinpai;
import com.entity.PinpaiExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @ClassName PinpaiMapper
 * @Description 品牌模块数据持久层
 */
public interface PinpaiMapper {

    //根据条件获取品牌表pinpai的数据数量
    int countByExample(PinpaiExample example);

    //根据条件删除品牌表pinpai的数据
    int deleteByExample(PinpaiExample example);

    //根据主键ID列删除品牌表pinpai的数据
    int deleteByPrimaryKey(Integer id);

    //插入品牌表pinpai的实体数据（包含null值）
    int insert(Pinpai record);

    //插入品牌表pinpai的实体数据（不包含null值）
    int insertSelective(Pinpai record);

    //根据条件获取品牌表pinpai的数据列表
    List<Pinpai> selectByExample(PinpaiExample example);

    //根据主键ID列获取品牌表pinpai的数据实体
    Pinpai selectByPrimaryKey(Integer id);

    //根据条件更新品牌表pinpai的实体数据（不包含null值）
    int updateByExampleSelective(@Param("record") Pinpai record, @Param("example") PinpaiExample example);

    //根据条件更新品牌表pinpai的实体数据（包含null值）
    int updateByExample(@Param("record") Pinpai record, @Param("example") PinpaiExample example);

    //根据主键ID列更新品牌表pinpai的实体数据（不包含null值）
    int updateByPrimaryKeySelective(Pinpai record);

    //根据主键ID列更新品牌表pinpai的实体数据（包含null值）
    int updateByPrimaryKey(Pinpai record);
}
