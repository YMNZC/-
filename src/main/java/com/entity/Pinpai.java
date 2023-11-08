package com.entity;


/**
 * @ClassName Pinpai
 * @Description 品牌模块实体层
 */
public class Pinpai {
    //id列
    private Integer id;


    //品牌名
    private String pinpaimingcheng;


    /**
    * 获取 id列
    *
    * @return id id列
    */
    public Integer getId() {
        return this.id;
    }

    /**
    * 设置 id列
    *
    * @param id id列
    */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
    * 获取 品牌名
    *
    * @return pinpaimingcheng 品牌名
    */
    public String getPinpaimingcheng() {
        return this.pinpaimingcheng;
    }

    /**
    * 设置 品牌名
    *
    * @param pinpaimingcheng 品牌名
    */
    public void setPinpaimingcheng(String pinpaimingcheng) {
        this.pinpaimingcheng = pinpaimingcheng;
    }

}
