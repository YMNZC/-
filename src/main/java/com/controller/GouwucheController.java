package com.controller;

import com.entity.*;
import com.service.*;
import com.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName GouwucheController
 * @Description 购物车模块控制层
 */
@Controller
public class GouwucheController extends BaseController{

    @Autowired
    private GouwucheService gouwucheService;

    @Autowired
    private ShangpinService shangpinService;
    @Autowired
    private UsersService usersService;



    //前台-购物车列表页
    @RequestMapping("/gouwucheManaQian")
    public ModelAndView gouwucheManaQian(Gouwuche req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("gouwucheManaQian");
        mav.addObject("actionName","gouwucheManaQian");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-购物车图片列表页
    @RequestMapping("/gouwucheManaQiantp")
    public ModelAndView gouwucheManaQiantp(Gouwuche req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("gouwucheManaQiantp");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //后台-购物车管理列表页
    @RequestMapping("/gouwucheMana")
    public ModelAndView gouwucheMana(Gouwuche req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("gouwucheMana");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //后台-购物车查看列表页
    @RequestMapping("/gouwucheChakan")
    public ModelAndView gouwucheChakan(Gouwuche req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("gouwucheChakan");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-购物车按id列排序列表页
    @RequestMapping("/gouwucheManaQianSort")
    public ModelAndView gouwucheManaQianSort(Gouwuche  req, @RequestParam(defaultValue = "1", value = "pageNo") int pageNo) {
        ModelAndView mav = new ModelAndView("gouwucheManaQian");
        mav.addObject("actionName","gouwucheManaQianSort");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-购物车详情页
    @GetMapping("/gouwucheDetailQian/{id}")
    @ResponseBody
    public ModelAndView gouwucheDetailQian(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("gouwucheDetailQian");
        Gouwuche info= gouwucheService.findById(id);
        mav.addObject("gouwuche", info);

        return mav;
    }

    //后台-购物车详情页
    @GetMapping("/gouwucheDetail/{id}")
    @ResponseBody
    public ModelAndView gouwucheDetail(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("gouwucheDetail");
        Gouwuche info= gouwucheService.findById(id);
        mav.addObject("gouwuche", info);
        return mav;
    }

    //获取所有购物车数据接口
    @RequestMapping("/gouwucheAll")
    @ResponseBody
    public ApiResponse<Gouwuche> gouwucheAll(){
        List<Gouwuche> gouwucheList=gouwucheService.findAll();
        return ApiResponse.success(gouwucheList);
    }

    //根据条件（字符类型模糊匹配查询）获取购物车数据接口
    @RequestMapping("/gouwucheSearch")
    @ResponseBody
    public ApiResponse<Gouwuche> gouwucheSearch(Gouwuche req){
        List<Gouwuche> gouwucheList=gouwucheService.find(req);
        return ApiResponse.success(gouwucheList);
    }

    //根据条件（字符类型完全匹配查询）获取购物车数据接口
    @RequestMapping("/gouwucheSearchByEqualTo")
    @ResponseBody
    public ApiResponse<Gouwuche> gouwucheSearchByEqualTo(Gouwuche req){
        List<Gouwuche> gouwucheList=gouwucheService.findByEqualTo(req);
        return ApiResponse.success(gouwucheList);
    }

    //购物车添加或修改接口
    @PostMapping("/gouwucheAddOrUpdate")
    @ResponseBody
    public ApiResponse<Integer> gouwucheAddOrUpdate(@RequestBody Gouwuche req, HttpSession session, Boolean isUPdateSession){

        //判断商品是否已存在购物车
        Users users = (Users) session.getAttribute("user");
        if (null != req && null != req.getShangpinid() && null != users && null != users.getId()) {
            Gouwuche instance = new Gouwuche();
            instance.setUsersid(users.getId());
            instance.setShangpinid(req.getShangpinid());
            List<Gouwuche> gouwucheList = gouwucheService.find(instance);
            if (gouwucheList.size() > 0) {
                //我的购物车已有此商品，则增加数量
                Gouwuche gouwuche = gouwucheList.get(0);
                Integer ishuliang = gouwuche.getGoumaishuliang();
                Integer ishuliangadd = req.getGoumaishuliang();
                req.setId(gouwuche.getId());
                req.setGoumaishuliang((ishuliang + ishuliangadd));
            }
        } else {
            return ApiResponse.failed("数据不存在");
        }


        int result = gouwucheService.saveOrUpdate(req);


        return ApiResponse.success(result);
    }

    //购物车修改单独一个字段接口
    @PostMapping("/gouwucheSet")
    @ResponseBody
    public ApiResponse<Integer> gouwucheSet(Gouwuche req){
        int result = gouwucheService.saveOrUpdate(req);
        return ApiResponse.success(result);
    }

    //购物车提交订单
    @PostMapping("/submitDingdan")
    @ResponseBody
    public ApiResponse<Integer> submitDingdan(@RequestBody(required = false) List<Gouwuche> gouwucheList, HttpSession session) {

        Users users = (Users) session.getAttribute("user");
        if (null != gouwucheList && gouwucheList.size() > 0 && null != users && null != users.getId()) {
            for (Gouwuche gouwuche : gouwucheList) {
                if (null != gouwuche.getId()) {
            gouwucheService.saveOrUpdate(gouwuche);
                }
            }
        } else {
            return ApiResponse.failed("数据不存在");
        }

        return ApiResponse.success(1);
    }


    //购物车删除接口
    @RequestMapping("/gouwucheDel/{id}")
    @ResponseBody
    public ApiResponse<Integer> gouwucheDel(@PathVariable Integer id){
        int result = gouwucheService.deleteById(id);
        return ApiResponse.success(result);
    }

    //后台-购物车修改页
    @RequestMapping("/gouwucheGet/{id}")
    @ResponseBody
    public ModelAndView gouwucheGet(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("gouwucheSet");
        Gouwuche info = gouwucheService.findById(id);
        mav.addObject("gouwuche", info);
        return mav;
    }



    //后台-我的购物车查看页面
    @RequestMapping("/gouwucheChakanMy")
    public ModelAndView gouwucheChakanMy(Gouwuche req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo, HttpSession session){
        ModelAndView mav = new ModelAndView("gouwucheChakanMy");
        Users users = (Users)session.getAttribute("user");
        if(null!=users) {
            req.setUsersid(users.getId());
            return getModelAndView(req, pageNo, mav, "id");
        }
        return mav;
    }

    //后台-我的购物车管理列表页面
    @RequestMapping("/gouwucheManaMy")
    public ModelAndView gouwucheManaMy(Gouwuche req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo, HttpSession session){
        ModelAndView mav = new ModelAndView("gouwucheManaMy");
        Users users = (Users)session.getAttribute("user");
        if(null!=users) {
            req.setUsersid(users.getId());
            return getModelAndView(req, pageNo, mav, "id");
        }
        return mav;
    }

    //前台-我的购物车管理列表页面
    @RequestMapping("/gouwucheManaMyQian")
    public ModelAndView gouwucheManaMyQian(Gouwuche req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo, HttpSession session){
        ModelAndView mav = new ModelAndView("gouwucheManaMyQian");
        Users users = (Users)session.getAttribute("user");
        if(null!=users) {
            req.setUsersid(users.getId());
            return getModelAndView(req, pageNo, mav, "id");
        }
        return mav;
    }


    //前台-商品添加购物车页面
    @GetMapping("/shangpingouwucheAddQian/{shangpinid}")
    @ResponseBody
    public ModelAndView shangpingouwucheAddQian(@PathVariable Integer shangpinid){
        ModelAndView mav = getShangpinGouwucheAddModelAndView(shangpinid,"shangpingouwucheAddQian");
        return mav;
    }

    //后台-商品添加购物车页面
    @GetMapping("/shangpingouwucheAdd/{shangpinid}")
    @ResponseBody
    public ModelAndView shangpingouwucheAdd(@PathVariable Integer shangpinid){
        ModelAndView mav = getShangpinGouwucheAddModelAndView(shangpinid,"shangpingouwucheAdd");
        return mav;
    }

    //后台-商品购物车查看页面
    @RequestMapping("/shangpingouwucheGetByshangpinid/{shangpinid}")
    @ResponseBody
    public ModelAndView shangpingouwucheGetByshangpinid(Gouwuche req, @PathVariable Integer shangpinid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("shangpingouwucheChakan");
        req.setShangpinid(shangpinid);
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-商品购物车查看页面
    @RequestMapping("/shangpingouwucheGetByshangpinidQian/{shangpinid}")
    @ResponseBody
    public ModelAndView shangpingouwucheGetByshangpinidQian(Gouwuche req, @PathVariable Integer shangpinid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("gouwucheManaQian");
            mav.addObject("actionName","gouwucheManaQian");
        req.setShangpinid(shangpinid);
        return getModelAndView(req, pageNo, mav, "id");
    }


    //商品购物车数据封装
    private ModelAndView getShangpinGouwucheAddModelAndView(Integer shangpinid, String viewName) {
        ModelAndView mav = new ModelAndView(viewName);
        Shangpin shangpin=shangpinService.findById(shangpinid);
        mav.addObject("shangpin", shangpin);
        List<Users> usersList=usersService.findAll();
        mav.addObject("usersList", usersList);

        return mav;
    }
    //前台-用户添加购物车页面
    @GetMapping("/usersgouwucheAddQian/{usersid}")
    @ResponseBody
    public ModelAndView usersgouwucheAddQian(@PathVariable Integer usersid){
        ModelAndView mav = getUsersGouwucheAddModelAndView(usersid,"usersgouwucheAddQian");
        return mav;
    }

    //后台-用户添加购物车页面
    @GetMapping("/usersgouwucheAdd/{usersid}")
    @ResponseBody
    public ModelAndView usersgouwucheAdd(@PathVariable Integer usersid){
        ModelAndView mav = getUsersGouwucheAddModelAndView(usersid,"usersgouwucheAdd");
        return mav;
    }

    //后台-用户购物车查看页面
    @RequestMapping("/usersgouwucheGetByusersid/{usersid}")
    @ResponseBody
    public ModelAndView usersgouwucheGetByusersid(Gouwuche req, @PathVariable Integer usersid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("usersgouwucheChakan");
        req.setUsersid(usersid);
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-用户购物车查看页面
    @RequestMapping("/usersgouwucheGetByusersidQian/{usersid}")
    @ResponseBody
    public ModelAndView usersgouwucheGetByusersidQian(Gouwuche req, @PathVariable Integer usersid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("gouwucheManaQian");
            mav.addObject("actionName","gouwucheManaQian");
        req.setUsersid(usersid);
        return getModelAndView(req, pageNo, mav, "id");
    }


    //用户购物车数据封装
    private ModelAndView getUsersGouwucheAddModelAndView(Integer usersid, String viewName) {
        ModelAndView mav = new ModelAndView(viewName);
        Users users=usersService.findById(usersid);
        mav.addObject("users", users);
        List<Shangpin> shangpinList=shangpinService.findAll();
        mav.addObject("shangpinList", shangpinList);

        return mav;
    }



    //购物车模糊匹配查询分页数据封装
    private ModelAndView getModelAndView(Gouwuche req, int pageNo, ModelAndView mav, String sortProperty) {
        PageWrap<Gouwuche> pageWrap=new PageWrap<Gouwuche>();
        pageWrap.setModel(req);
        pageWrap.setPageNum(pageNo);
        //设置每页最多几条数据，默认为8条
        //pageWrap.setPageSize(8);
        PageWrap.SortData sortData=new PageWrap.SortData();
        sortData.setDirection("DESC");
        sortData.setProperty(sortProperty);
        List<PageWrap.SortData> sorts = new ArrayList<>();
        sorts.add(sortData);
        pageWrap.setSorts(sorts);
        PageData<Gouwuche> pageInfo= gouwucheService.findPage(pageWrap);
        mav.addObject("pageInfo", pageInfo);
        //计算购物车总金额
        Integer totalAmount = 0;
        List<Gouwuche> gouwucheList = gouwucheService.find(req);
        for (Gouwuche gouwuche:gouwucheList) {
            Integer shangpinid = gouwuche.getShangpinid();
            if(null != shangpinid && shangpinid>0) {
                Shangpin shangpin = shangpinService.findById(shangpinid);
                if (null != shangpin) {
                    totalAmount += gouwuche.getGoumaishuliang()*shangpin.getJiage();
                }
            }
        }
        mav.addObject("totalAmount", totalAmount);


        mav.addObject("req", req);
        List<Shangpin> shangpinList=shangpinService.findAll();
        mav.addObject("shangpinList", shangpinList);
        List<Users> usersList=usersService.findAll();
        mav.addObject("usersList", usersList);

        return mav;
    }

    //购物车完全匹配查询分页数据封装
    private ModelAndView getModelAndViewByEqualTo(Gouwuche req, int pageNo, ModelAndView mav, String sortProperty) {
        PageWrap<Gouwuche> pageWrap=new PageWrap<Gouwuche>();
        pageWrap.setModel(req);
        pageWrap.setPageNum(pageNo);
        //设置每页最多几条数据，默认为8条
        //pageWrap.setPageSize(8);
        PageWrap.SortData sortData=new PageWrap.SortData();
        sortData.setDirection("DESC");
        sortData.setProperty(sortProperty);
        List<PageWrap.SortData> sorts = new ArrayList<>();
        sorts.add(sortData);
        pageWrap.setSorts(sorts);
        PageData<Gouwuche> pageInfo= gouwucheService.findPageByEqualTo(pageWrap);
        mav.addObject("pageInfo", pageInfo);
        //计算购物车总金额
        Integer totalAmount = 0;
        List<Gouwuche> gouwucheList = gouwucheService.find(req);
        for (Gouwuche gouwuche:gouwucheList) {
            Integer shangpinid = gouwuche.getShangpinid();
            if(null != shangpinid && shangpinid>0) {
                Shangpin shangpin = shangpinService.findById(shangpinid);
                if (null != shangpin) {
                    totalAmount += gouwuche.getGoumaishuliang()*shangpin.getJiage();
                }
            }
        }
        mav.addObject("totalAmount", totalAmount);


        mav.addObject("req", req);
        List<Shangpin> shangpinList=shangpinService.findAll();
        mav.addObject("shangpinList", shangpinList);
        List<Users> usersList=usersService.findAll();
        mav.addObject("usersList", usersList);

        return mav;
        }
}
