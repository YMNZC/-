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
 * @ClassName FukuanfangshiServiceImpl
 * @Description 付款方式模块业务实现层
 */
@Service
public class FukuanfangshiServiceImpl implements FukuanfangshiService {

    @Autowired
    private FukuanfangshiMapper fukuanfangshiMapper;



    //保存或更新付款方式表fukuanfangshi
    @Override
    public Integer saveOrUpdate(Fukuanfangshi instance) {
        if(null != instance.getId() && instance.getId() > 0) {
            fukuanfangshiMapper.updateByPrimaryKeySelective(instance);
        }else {
            fukuanfangshiMapper.insertSelective(instance);
        }
        return instance.getId();
    }

    //查询付款方式表fukuanfangshi
    @Override
    public List<Fukuanfangshi> findAll() {
        List<Fukuanfangshi> list = fukuanfangshiMapper.selectByExample(null);
        for (Fukuanfangshi info:list) {
            setFatherInfo(info);
        }
        return list;
    }

    //根据条件(字符类型模糊匹配)查询付款方式表fukuanfangshi
    @Override
    public List<Fukuanfangshi> find(Fukuanfangshi instance) {
        FukuanfangshiExample fukuanfangshiExample = getFukuanfangshiExampleByLike(instance);
        fukuanfangshiExample.setOrderByClause(" id desc");
        List<Fukuanfangshi> list = fukuanfangshiMapper.selectByExample(fukuanfangshiExample);
        for (Fukuanfangshi info:list) {
            setFatherInfo(info);
        }
        return list;
     }

    //根据条件(字符类型完全匹配)查询付款方式表fukuanfangshi
    @Override
    public List<Fukuanfangshi> findByEqualTo(Fukuanfangshi instance) {
        FukuanfangshiExample fukuanfangshiExample = getFukuanfangshiExampleByEqualTo(instance);
        fukuanfangshiExample.setOrderByClause(" id desc");
        List<Fukuanfangshi> list = fukuanfangshiMapper.selectByExample(fukuanfangshiExample);
        for (Fukuanfangshi info:list) {
            setFatherInfo(info);
        }
        return list;
    }


    //根据条件(字符类型模糊匹配)查询付款方式表fukuanfangshi最后一条数据
    @Override
    public Fukuanfangshi findOne(Fukuanfangshi instance) {
        List<Fukuanfangshi> list = find(instance);
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    //根据条件(字符类型完全匹配)查询付款方式表fukuanfangshi最后一条数据
    @Override
    public Fukuanfangshi findOneByEqualTo(Fukuanfangshi instance) {
        List<Fukuanfangshi> list = findByEqualTo(instance);
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    //根据id列查询付款方式表fukuanfangshi数据
    @Override
    public Fukuanfangshi findById(Integer id) {
        Fukuanfangshi info = fukuanfangshiMapper.selectByPrimaryKey(id);
        setFatherInfo(info);
        return info;
    }

    //根据主键id列删除付款方式表fukuanfangshi数据
    @Override
    public int deleteById(Integer id) {
        return fukuanfangshiMapper.deleteByPrimaryKey(id);
    }


    //根据条件(字符类型模糊匹配)分页查询付款方式表fukuanfangshi数据
    @Override
    public PageData<Fukuanfangshi> findPage(PageWrap<Fukuanfangshi> pageWrap) {
        PageHelper.startPage(pageWrap.getPageNum(), pageWrap.getPageSize());
        FukuanfangshiExample fukuanfangshiExample = getFukuanfangshiExampleByLike(pageWrap.getModel());
        fukuanfangshiExample.setOrderByClause(pageWrap.getOrderByClause());
        List<Fukuanfangshi> list = fukuanfangshiMapper.selectByExample(fukuanfangshiExample);
        for (Fukuanfangshi info:list) {
            setFatherInfo(info);
        }
        return PageData.from(new PageInfo<>(list));
    }

    //根据条件(字符类型完全匹配)分页查询付款方式表fukuanfangshi数据
    @Override
    public PageData<Fukuanfangshi> findPageByEqualTo(PageWrap<Fukuanfangshi> pageWrap) {
        PageHelper.startPage(pageWrap.getPageNum(), pageWrap.getPageSize());
        FukuanfangshiExample fukuanfangshiExample = getFukuanfangshiExampleByEqualTo(pageWrap.getModel());
        fukuanfangshiExample.setOrderByClause(pageWrap.getOrderByClause());
        List<Fukuanfangshi> list = fukuanfangshiMapper.selectByExample(fukuanfangshiExample);
        for (Fukuanfangshi info:list) {
            setFatherInfo(info);
        }
        return PageData.from(new PageInfo<>(list));
    }

    //父表信息
    private void setFatherInfo(Fukuanfangshi info){
        if (null != info){

        }
    }

    //字符类型模糊查询条件构造器
    private FukuanfangshiExample getFukuanfangshiExampleByLike(Fukuanfangshi instance) {
        FukuanfangshiExample fukuanfangshiExample = new FukuanfangshiExample();
        FukuanfangshiExample.Criteria criteria = fukuanfangshiExample.createCriteria();
        //付款方式id完全匹配
        if (null != instance.getId()) {
            criteria.andIdEqualTo(instance.getId());
        }
        //支付方式mingcheng模糊匹配
        if (null != instance.getMingcheng() && !instance.getMingcheng().equals("")) {
            criteria.andMingchengLike("%" + instance.getMingcheng() + "%");
        }

        return fukuanfangshiExample;
    }

    //字符类型完全相等查询条件构造器
    private FukuanfangshiExample getFukuanfangshiExampleByEqualTo(Fukuanfangshi instance) {
        FukuanfangshiExample fukuanfangshiExample = new FukuanfangshiExample();
        FukuanfangshiExample.Criteria criteria = fukuanfangshiExample.createCriteria();
        //付款方式id完全匹配
        if (null != instance.getId()) {
            criteria.andIdEqualTo(instance.getId());
        }
        //支付方式mingcheng完全匹配
        if (null != instance.getMingcheng() && !instance.getMingcheng().equals("")) {
            criteria.andMingchengEqualTo(instance.getMingcheng());
        }

        return fukuanfangshiExample;
    }
}
