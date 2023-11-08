package com.service;

import com.entity.Pinpai;
import com.util.PageData;
import com.util.PageWrap;

import java.util.List;

/**
 * @ClassName PinpaiService
 * @Description 品牌模块业务层
 */
public interface PinpaiService {

    //保存或更新品牌表数据
    Integer saveOrUpdate(Pinpai instance);

    //查询所有品牌表数据
    List<Pinpai> findAll();

    //根据条件(字符类型模糊)查询品牌表数据
    List<Pinpai> find(Pinpai instance);

    //根据条件(字符类型完全匹配)查询品牌表数据
    List<Pinpai> findByEqualTo(Pinpai instance);

    //根据条件(字符类型模糊)查询查询第一条品牌表数据
    Pinpai findOne(Pinpai instance);

    //根据条件(字符类型完全匹配)查询查询第一条品牌表数据
    Pinpai findOneByEqualTo(Pinpai instance);

    //根据id列查询品牌表数据
    Pinpai findById(Integer id);

    //根据id列删除品牌表数据
    int deleteById(Integer id);

    //根据条件(字符类型模糊)分页查询品牌表数据
    PageData<Pinpai> findPage(PageWrap<Pinpai> pageWrap);

    //根据条件(字符类型完全匹配)分页查询品牌表数据
    PageData<Pinpai> findPageByEqualTo(PageWrap<Pinpai> pageWrap);
}
