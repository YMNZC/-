package com.entity;


/**
 * @ClassName Shoucang
 * @Description 商品收藏模块实体层
 */
public class Shoucang {
    //id列
    private Integer id;


    //收藏时间
    private String shijian;
    //商品id
    private Integer shangpinid;
    //用户id
    private Integer usersid;
    //父表：商品表shangpin
    private Shangpin shangpin;
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
    * 获取 收藏时间
    *
    * @return shijian 收藏时间
    */
    public String getShijian() {
        return this.shijian;
    }

    /**
    * 设置 收藏时间
    *
    * @param shijian 收藏时间
    */
    public void setShijian(String shijian) {
        this.shijian = shijian;
    }
    /**
    * 获取 商品id
    *
    * @return shangpinid 商品id
    */
    public Integer getShangpinid() {
        return this.shangpinid;
    }

    /**
    * 设置 商品id
    *
    * @param shangpinid 商品id
    */
    public void setShangpinid(Integer shangpinid) {
        this.shangpinid = shangpinid;
    }
    /**
    * 获取 用户id
    *
    * @return usersid 用户id
    */
    public Integer getUsersid() {
        return this.usersid;
    }

    /**
    * 设置 用户id
    *
    * @param usersid 用户id
    */
    public void setUsersid(Integer usersid) {
        this.usersid = usersid;
    }
    /**
    * 获取 父表：商品表shangpin
    *
    * @return shangpin 父表：商品表shangpin
    */
    public Shangpin getShangpin() {
        return this.shangpin;
    }

    /**
    * 设置 父表：商品表shangpin
    *
    * @param shangpin 父表：商品表shangpin
    */
    public void setShangpin(Shangpin shangpin) {
        this.shangpin = shangpin;
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
