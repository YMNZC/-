package com.service;

import com.entity.Pingjia;
import com.util.PageData;
import com.util.PageWrap;

import java.util.List;

/**
 * @ClassName PingjiaService
 * @Description 商品评价模块业务层
 */
public interface PingjiaService {

    //保存或更新商品评价表数据
    Integer saveOrUpdate(Pingjia instance);

    //查询所有商品评价表数据
    List<Pingjia> findAll();

    //根据条件(字符类型模糊)查询商品评价表数据
    List<Pingjia> find(Pingjia instance);

    //根据条件(字符类型完全匹配)查询商品评价表数据
    List<Pingjia> findByEqualTo(Pingjia instance);

    //根据条件(字符类型模糊)查询查询第一条商品评价表数据
    Pingjia findOne(Pingjia instance);

    //根据条件(字符类型完全匹配)查询查询第一条商品评价表数据
    Pingjia findOneByEqualTo(Pingjia instance);

    //根据id列查询商品评价表数据
    Pingjia findById(Integer id);

    //根据id列删除商品评价表数据
    int deleteById(Integer id);

    //根据条件(字符类型模糊)分页查询商品评价表数据
    PageData<Pingjia> findPage(PageWrap<Pingjia> pageWrap);

    //根据条件(字符类型完全匹配)分页查询商品评价表数据
    PageData<Pingjia> findPageByEqualTo(PageWrap<Pingjia> pageWrap);
}
