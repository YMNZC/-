package com.service;

import com.entity.Fukuanfangshi;
import com.util.PageData;
import com.util.PageWrap;

import java.util.List;

/**
 * @ClassName FukuanfangshiService
 * @Description 付款方式模块业务层
 */
public interface FukuanfangshiService {

    //保存或更新付款方式表数据
    Integer saveOrUpdate(Fukuanfangshi instance);

    //查询所有付款方式表数据
    List<Fukuanfangshi> findAll();

    //根据条件(字符类型模糊)查询付款方式表数据
    List<Fukuanfangshi> find(Fukuanfangshi instance);

    //根据条件(字符类型完全匹配)查询付款方式表数据
    List<Fukuanfangshi> findByEqualTo(Fukuanfangshi instance);

    //根据条件(字符类型模糊)查询查询第一条付款方式表数据
    Fukuanfangshi findOne(Fukuanfangshi instance);

    //根据条件(字符类型完全匹配)查询查询第一条付款方式表数据
    Fukuanfangshi findOneByEqualTo(Fukuanfangshi instance);

    //根据id列查询付款方式表数据
    Fukuanfangshi findById(Integer id);

    //根据id列删除付款方式表数据
    int deleteById(Integer id);

    //根据条件(字符类型模糊)分页查询付款方式表数据
    PageData<Fukuanfangshi> findPage(PageWrap<Fukuanfangshi> pageWrap);

    //根据条件(字符类型完全匹配)分页查询付款方式表数据
    PageData<Fukuanfangshi> findPageByEqualTo(PageWrap<Fukuanfangshi> pageWrap);
}
