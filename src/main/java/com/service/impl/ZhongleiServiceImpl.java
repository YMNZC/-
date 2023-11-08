package com.service.impl;

import com.dao.*;
import com.entity.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.*;
import com.util.ExampleBuilder;
import com.util.PageData;
import com.util.PageWrap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * @ClassName ZhongleiServiceImpl
 * @Description 分类模块业务实现层
 */
@Service
public class ZhongleiServiceImpl implements ZhongleiService {

    @Autowired
    private ZhongleiMapper zhongleiMapper;



    //保存或更新分类表zhonglei
    @Override
    public Integer saveOrUpdate(Zhonglei instance) {
        if(null != instance.getId() && instance.getId() > 0) {
            zhongleiMapper.updateByPrimaryKeySelective(instance);
        }else {
            zhongleiMapper.insertSelective(instance);
        }
        return instance.getId();
    }

    //查询分类表zhonglei
    @Override
    public List<Zhonglei> findAll() {
        List<Zhonglei> list = zhongleiMapper.selectByExample(null);
        for (Zhonglei info:list) {
            setFatherInfo(info);
        }
        return list;
    }

    //根据条件(字符类型模糊匹配)查询分类表zhonglei
    @Override
    public List<Zhonglei> find(Zhonglei instance) {
        ZhongleiExample zhongleiExample = getZhongleiExampleByLike(instance);
        zhongleiExample.setOrderByClause(" id desc");
        List<Zhonglei> list = zhongleiMapper.selectByExample(zhongleiExample);
        for (Zhonglei info:list) {
            setFatherInfo(info);
        }
        return list;
     }

    //根据条件(字符类型完全匹配)查询分类表zhonglei
    @Override
    public List<Zhonglei> findByEqualTo(Zhonglei instance) {
        ZhongleiExample zhongleiExample = getZhongleiExampleByEqualTo(instance);
        zhongleiExample.setOrderByClause(" id desc");
        List<Zhonglei> list = zhongleiMapper.selectByExample(zhongleiExample);
        for (Zhonglei info:list) {
            setFatherInfo(info);
        }
        return list;
    }


    //根据条件(字符类型模糊匹配)查询分类表zhonglei最后一条数据
    @Override
    public Zhonglei findOne(Zhonglei instance) {
        List<Zhonglei> list = find(instance);
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    //根据条件(字符类型完全匹配)查询分类表zhonglei最后一条数据
    @Override
    public Zhonglei findOneByEqualTo(Zhonglei instance) {
        List<Zhonglei> list = findByEqualTo(instance);
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    //根据id列查询分类表zhonglei数据
    @Override
    public Zhonglei findById(Integer id) {
        Zhonglei info = zhongleiMapper.selectByPrimaryKey(id);
        setFatherInfo(info);
        return info;
    }

    //根据主键id列删除分类表zhonglei数据
    @Override
    public int deleteById(Integer id) {
        return zhongleiMapper.deleteByPrimaryKey(id);
    }


    //根据条件(字符类型模糊匹配)分页查询分类表zhonglei数据
    @Override
    public PageData<Zhonglei> findPage(PageWrap<Zhonglei> pageWrap) {
        PageHelper.startPage(pageWrap.getPageNum(), pageWrap.getPageSize());
        ZhongleiExample zhongleiExample = getZhongleiExampleByLike(pageWrap.getModel());
        zhongleiExample.setOrderByClause(pageWrap.getOrderByClause());
        List<Zhonglei> list = zhongleiMapper.selectByExample(zhongleiExample);
        for (Zhonglei info:list) {
            setFatherInfo(info);
        }
        return PageData.from(new PageInfo<>(list));
    }

    //根据条件(字符类型完全匹配)分页查询分类表zhonglei数据
    @Override
    public PageData<Zhonglei> findPageByEqualTo(PageWrap<Zhonglei> pageWrap) {
        PageHelper.startPage(pageWrap.getPageNum(), pageWrap.getPageSize());
        ZhongleiExample zhongleiExample = getZhongleiExampleByEqualTo(pageWrap.getModel());
        zhongleiExample.setOrderByClause(pageWrap.getOrderByClause());
        List<Zhonglei> list = zhongleiMapper.selectByExample(zhongleiExample);
        for (Zhonglei info:list) {
            setFatherInfo(info);
        }
        return PageData.from(new PageInfo<>(list));
    }

    //父表信息
    private void setFatherInfo(Zhonglei info){
        if (null != info){

        }
    }

    //字符类型模糊查询条件构造器
    private ZhongleiExample getZhongleiExampleByLike(Zhonglei instance) {
        ZhongleiExample zhongleiExample = new ZhongleiExample();
        ZhongleiExample.Criteria criteria = zhongleiExample.createCriteria();
        //分类id完全匹配
        if (null != instance.getId()) {
            criteria.andIdEqualTo(instance.getId());
        }
        //名称mingcheng模糊匹配
        if (null != instance.getMingcheng() && !instance.getMingcheng().equals("")) {
            criteria.andMingchengLike("%" + instance.getMingcheng() + "%");
        }

        return zhongleiExample;
    }

    //字符类型完全相等查询条件构造器
    private ZhongleiExample getZhongleiExampleByEqualTo(Zhonglei instance) {
        ZhongleiExample zhongleiExample = new ZhongleiExample();
        ZhongleiExample.Criteria criteria = zhongleiExample.createCriteria();
        //分类id完全匹配
        if (null != instance.getId()) {
            criteria.andIdEqualTo(instance.getId());
        }
        //名称mingcheng完全匹配
        if (null != instance.getMingcheng() && !instance.getMingcheng().equals("")) {
            criteria.andMingchengEqualTo(instance.getMingcheng());
        }

        return zhongleiExample;
    }
}
