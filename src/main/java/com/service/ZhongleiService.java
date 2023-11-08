package com.service;

import com.entity.Zhonglei;
import com.util.PageData;
import com.util.PageWrap;

import java.util.List;

/**
 * @ClassName ZhongleiService
 * @Description 分类模块业务层
 */
public interface ZhongleiService {

    //保存或更新分类表数据
    Integer saveOrUpdate(Zhonglei instance);

    //查询所有分类表数据
    List<Zhonglei> findAll();

    //根据条件(字符类型模糊)查询分类表数据
    List<Zhonglei> find(Zhonglei instance);

    //根据条件(字符类型完全匹配)查询分类表数据
    List<Zhonglei> findByEqualTo(Zhonglei instance);

    //根据条件(字符类型模糊)查询查询第一条分类表数据
    Zhonglei findOne(Zhonglei instance);

    //根据条件(字符类型完全匹配)查询查询第一条分类表数据
    Zhonglei findOneByEqualTo(Zhonglei instance);

    //根据id列查询分类表数据
    Zhonglei findById(Integer id);

    //根据id列删除分类表数据
    int deleteById(Integer id);

    //根据条件(字符类型模糊)分页查询分类表数据
    PageData<Zhonglei> findPage(PageWrap<Zhonglei> pageWrap);

    //根据条件(字符类型完全匹配)分页查询分类表数据
    PageData<Zhonglei> findPageByEqualTo(PageWrap<Zhonglei> pageWrap);
}
