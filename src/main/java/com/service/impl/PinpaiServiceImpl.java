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
 * @ClassName PinpaiServiceImpl
 * @Description 品牌模块业务实现层
 */
@Service
public class PinpaiServiceImpl implements PinpaiService {

    @Autowired
    private PinpaiMapper pinpaiMapper;



    //保存或更新品牌表pinpai
    @Override
    public Integer saveOrUpdate(Pinpai instance) {
        if(null != instance.getId() && instance.getId() > 0) {
            pinpaiMapper.updateByPrimaryKeySelective(instance);
        }else {
            pinpaiMapper.insertSelective(instance);
        }
        return instance.getId();
    }

    //查询品牌表pinpai
    @Override
    public List<Pinpai> findAll() {
        List<Pinpai> list = pinpaiMapper.selectByExample(null);
        for (Pinpai info:list) {
            setFatherInfo(info);
        }
        return list;
    }

    //根据条件(字符类型模糊匹配)查询品牌表pinpai
    @Override
    public List<Pinpai> find(Pinpai instance) {
        PinpaiExample pinpaiExample = getPinpaiExampleByLike(instance);
        pinpaiExample.setOrderByClause(" id desc");
        List<Pinpai> list = pinpaiMapper.selectByExample(pinpaiExample);
        for (Pinpai info:list) {
            setFatherInfo(info);
        }
        return list;
     }

    //根据条件(字符类型完全匹配)查询品牌表pinpai
    @Override
    public List<Pinpai> findByEqualTo(Pinpai instance) {
        PinpaiExample pinpaiExample = getPinpaiExampleByEqualTo(instance);
        pinpaiExample.setOrderByClause(" id desc");
        List<Pinpai> list = pinpaiMapper.selectByExample(pinpaiExample);
        for (Pinpai info:list) {
            setFatherInfo(info);
        }
        return list;
    }


    //根据条件(字符类型模糊匹配)查询品牌表pinpai最后一条数据
    @Override
    public Pinpai findOne(Pinpai instance) {
        List<Pinpai> list = find(instance);
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    //根据条件(字符类型完全匹配)查询品牌表pinpai最后一条数据
    @Override
    public Pinpai findOneByEqualTo(Pinpai instance) {
        List<Pinpai> list = findByEqualTo(instance);
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    //根据id列查询品牌表pinpai数据
    @Override
    public Pinpai findById(Integer id) {
        Pinpai info = pinpaiMapper.selectByPrimaryKey(id);
        setFatherInfo(info);
        return info;
    }

    //根据主键id列删除品牌表pinpai数据
    @Override
    public int deleteById(Integer id) {
        return pinpaiMapper.deleteByPrimaryKey(id);
    }


    //根据条件(字符类型模糊匹配)分页查询品牌表pinpai数据
    @Override
    public PageData<Pinpai> findPage(PageWrap<Pinpai> pageWrap) {
        PageHelper.startPage(pageWrap.getPageNum(), pageWrap.getPageSize());
        PinpaiExample pinpaiExample = getPinpaiExampleByLike(pageWrap.getModel());
        pinpaiExample.setOrderByClause(pageWrap.getOrderByClause());
        List<Pinpai> list = pinpaiMapper.selectByExample(pinpaiExample);
        for (Pinpai info:list) {
            setFatherInfo(info);
        }
        return PageData.from(new PageInfo<>(list));
    }

    //根据条件(字符类型完全匹配)分页查询品牌表pinpai数据
    @Override
    public PageData<Pinpai> findPageByEqualTo(PageWrap<Pinpai> pageWrap) {
        PageHelper.startPage(pageWrap.getPageNum(), pageWrap.getPageSize());
        PinpaiExample pinpaiExample = getPinpaiExampleByEqualTo(pageWrap.getModel());
        pinpaiExample.setOrderByClause(pageWrap.getOrderByClause());
        List<Pinpai> list = pinpaiMapper.selectByExample(pinpaiExample);
        for (Pinpai info:list) {
            setFatherInfo(info);
        }
        return PageData.from(new PageInfo<>(list));
    }

    //父表信息
    private void setFatherInfo(Pinpai info){
        if (null != info){

        }
    }

    //字符类型模糊查询条件构造器
    private PinpaiExample getPinpaiExampleByLike(Pinpai instance) {
        PinpaiExample pinpaiExample = new PinpaiExample();
        PinpaiExample.Criteria criteria = pinpaiExample.createCriteria();
        //品牌id完全匹配
        if (null != instance.getId()) {
            criteria.andIdEqualTo(instance.getId());
        }
        //品牌名pinpaimingcheng模糊匹配
        if (null != instance.getPinpaimingcheng() && !instance.getPinpaimingcheng().equals("")) {
            criteria.andPinpaimingchengLike("%" + instance.getPinpaimingcheng() + "%");
        }

        return pinpaiExample;
    }

    //字符类型完全相等查询条件构造器
    private PinpaiExample getPinpaiExampleByEqualTo(Pinpai instance) {
        PinpaiExample pinpaiExample = new PinpaiExample();
        PinpaiExample.Criteria criteria = pinpaiExample.createCriteria();
        //品牌id完全匹配
        if (null != instance.getId()) {
            criteria.andIdEqualTo(instance.getId());
        }
        //品牌名pinpaimingcheng完全匹配
        if (null != instance.getPinpaimingcheng() && !instance.getPinpaimingcheng().equals("")) {
            criteria.andPinpaimingchengEqualTo(instance.getPinpaimingcheng());
        }

        return pinpaiExample;
    }
}
