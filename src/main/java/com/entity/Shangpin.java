package com.entity;


/**
 * @ClassName Shangpin
 * @Description 商品模块实体层
 */
public class Shangpin {
    //id列
    private Integer id;


    //名称
    private String mingcheng;
    //编号
    private String bianhao;
    //类型id
    private Integer zhongleiid;
    //品牌id
    private Integer pinpaiid;
    //内容介绍
    private String neirong;
    //图片
    private String image;
    //原价
    private Integer yuanshijiage;
    //现价
    private Integer jiage;
    //单位
    private String danwei;
    //是否上架
    private String shenhe;
    //库存数量
    private Integer kucunshuliang;
    //销售数量
    private Integer xiaoshoushuliang;
    //商家ID
    private Integer usersid;
    //父表：分类表zhonglei
    private Zhonglei zhonglei;
    //父表：品牌表pinpai
    private Pinpai pinpai;
    //父表：用户表users
    private Users users;


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
    * 获取 名称
    *
    * @return mingcheng 名称
    */
    public String getMingcheng() {
        return this.mingcheng;
    }

    /**
    * 设置 名称
    *
    * @param mingcheng 名称
    */
    public void setMingcheng(String mingcheng) {
        this.mingcheng = mingcheng;
    }
    /**
    * 获取 编号
    *
    * @return bianhao 编号
    */
    public String getBianhao() {
        return this.bianhao;
    }

    /**
    * 设置 编号
    *
    * @param bianhao 编号
    */
    public void setBianhao(String bianhao) {
        this.bianhao = bianhao;
    }
    /**
    * 获取 类型id
    *
    * @return zhongleiid 类型id
    */
    public Integer getZhongleiid() {
        return this.zhongleiid;
    }

    /**
    * 设置 类型id
    *
    * @param zhongleiid 类型id
    */
    public void setZhongleiid(Integer zhongleiid) {
        this.zhongleiid = zhongleiid;
    }
    /**
    * 获取 品牌id
    *
    * @return pinpaiid 品牌id
    */
    public Integer getPinpaiid() {
        return this.pinpaiid;
    }

    /**
    * 设置 品牌id
    *
    * @param pinpaiid 品牌id
    */
    public void setPinpaiid(Integer pinpaiid) {
        this.pinpaiid = pinpaiid;
    }
    /**
    * 获取 内容介绍
    *
    * @return neirong 内容介绍
    */
    public String getNeirong() {
        return this.neirong;
    }

    /**
    * 设置 内容介绍
    *
    * @param neirong 内容介绍
    */
    public void setNeirong(String neirong) {
        this.neirong = neirong;
    }
    /**
    * 获取 图片
    *
    * @return image 图片
    */
    public String getImage() {
        return this.image;
    }

    /**
    * 设置 图片
    *
    * @param image 图片
    */
    public void setImage(String image) {
        this.image = image;
    }
    /**
    * 获取 原价
    *
    * @return yuanshijiage 原价
    */
    public Integer getYuanshijiage() {
        return this.yuanshijiage;
    }

    /**
    * 设置 原价
    *
    * @param yuanshijiage 原价
    */
    public void setYuanshijiage(Integer yuanshijiage) {
        this.yuanshijiage = yuanshijiage;
    }
    /**
    * 获取 现价
    *
    * @return jiage 现价
    */
    public Integer getJiage() {
        return this.jiage;
    }

    /**
    * 设置 现价
    *
    * @param jiage 现价
    */
    public void setJiage(Integer jiage) {
        this.jiage = jiage;
    }
    /**
    * 获取 单位
    *
    * @return danwei 单位
    */
    public String getDanwei() {
        return this.danwei;
    }

    /**
    * 设置 单位
    *
    * @param danwei 单位
    */
    public void setDanwei(String danwei) {
        this.danwei = danwei;
    }
    /**
    * 获取 是否上架
    *
    * @return shenhe 是否上架
    */
    public String getShenhe() {
        return this.shenhe;
    }

    /**
    * 设置 是否上架
    *
    * @param shenhe 是否上架
    */
    public void setShenhe(String shenhe) {
        this.shenhe = shenhe;
    }
    /**
    * 获取 库存数量
    *
    * @return kucunshuliang 库存数量
    */
    public Integer getKucunshuliang() {
        return this.kucunshuliang;
    }

    /**
    * 设置 库存数量
    *
    * @param kucunshuliang 库存数量
    */
    public void setKucunshuliang(Integer kucunshuliang) {
        this.kucunshuliang = kucunshuliang;
    }
    /**
    * 获取 销售数量
    *
    * @return xiaoshoushuliang 销售数量
    */
    public Integer getXiaoshoushuliang() {
        return this.xiaoshoushuliang;
    }

    /**
    * 设置 销售数量
    *
    * @param xiaoshoushuliang 销售数量
    */
    public void setXiaoshoushuliang(Integer xiaoshoushuliang) {
        this.xiaoshoushuliang = xiaoshoushuliang;
    }
    /**
    * 获取 商家ID
    *
    * @return usersid 商家ID
    */
    public Integer getUsersid() {
        return this.usersid;
    }

    /**
    * 设置 商家ID
    *
    * @param usersid 商家ID
    */
    public void setUsersid(Integer usersid) {
        this.usersid = usersid;
    }
    /**
    * 获取 父表：分类表zhonglei
    *
    * @return zhonglei 父表：分类表zhonglei
    */
    public Zhonglei getZhonglei() {
        return this.zhonglei;
    }

    /**
    * 设置 父表：分类表zhonglei
    *
    * @param zhonglei 父表：分类表zhonglei
    */
    public void setZhonglei(Zhonglei zhonglei) {
        this.zhonglei = zhonglei;
    }
    /**
    * 获取 父表：品牌表pinpai
    *
    * @return pinpai 父表：品牌表pinpai
    */
    public Pinpai getPinpai() {
        return this.pinpai;
    }

    /**
    * 设置 父表：品牌表pinpai
    *
    * @param pinpai 父表：品牌表pinpai
    */
    public void setPinpai(Pinpai pinpai) {
        this.pinpai = pinpai;
    }
    /**
    * 获取 父表：用户表users
    *
    * @return users 父表：用户表users
    */
    public Users getUsers() {
        return this.users;
    }

    /**
    * 设置 父表：用户表users
    *
    * @param users 父表：用户表users
    */
    public void setUsers(Users users) {
        this.users = users;
    }

}
