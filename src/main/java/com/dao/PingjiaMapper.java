package com.dao;

import com.entity.Pingjia;
import com.entity.PingjiaExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @ClassName PingjiaMapper
 * @Description 商品评价模块数据持久层
 */
public interface PingjiaMapper {

    //根据条件获取商品评价表pingjia的数据数量
    int countByExample(PingjiaExample example);

    //根据条件删除商品评价表pingjia的数据
    int deleteByExample(PingjiaExample example);

    //根据主键ID列删除商品评价表pingjia的数据
    int deleteByPrimaryKey(Integer id);

    //插入商品评价表pingjia的实体数据（包含null值）
    int insert(Pingjia record);

    //插入商品评价表pingjia的实体数据（不包含null值）
    int insertSelective(Pingjia record);

    //根据条件获取商品评价表pingjia的数据列表
    List<Pingjia> selectByExample(PingjiaExample example);

    //根据主键ID列获取商品评价表pingjia的数据实体
    Pingjia selectByPrimaryKey(Integer id);

    //根据条件更新商品评价表pingjia的实体数据（不包含null值）
    int updateByExampleSelective(@Param("record") Pingjia record, @Param("example") PingjiaExample example);

    //根据条件更新商品评价表pingjia的实体数据（包含null值）
    int updateByExample(@Param("record") Pingjia record, @Param("example") PingjiaExample example);

    //根据主键ID列更新商品评价表pingjia的实体数据（不包含null值）
    int updateByPrimaryKeySelective(Pingjia record);

    //根据主键ID列更新商品评价表pingjia的实体数据（包含null值）
    int updateByPrimaryKey(Pingjia record);
}
