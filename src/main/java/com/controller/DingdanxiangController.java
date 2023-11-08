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
 * @ClassName DingdanxiangController
 * @Description 订单项模块控制层
 */
@Controller
public class DingdanxiangController extends BaseController{

    @Autowired
    private DingdanxiangService dingdanxiangService;

    @Autowired
    private DingdanService dingdanService;
    @Autowired
    private ShangpinService shangpinService;
    @Autowired
    private UsersService usersService;



    //前台-订单项列表页
    @RequestMapping("/dingdanxiangManaQian")
    public ModelAndView dingdanxiangManaQian(Dingdanxiang req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("dingdanxiangManaQian");
        mav.addObject("actionName","dingdanxiangManaQian");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-订单项图片列表页
    @RequestMapping("/dingdanxiangManaQiantp")
    public ModelAndView dingdanxiangManaQiantp(Dingdanxiang req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("dingdanxiangManaQiantp");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //后台-订单项管理列表页
    @RequestMapping("/dingdanxiangMana")
    public ModelAndView dingdanxiangMana(Dingdanxiang req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("dingdanxiangMana");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //后台-订单项查看列表页
    @RequestMapping("/dingdanxiangChakan")
    public ModelAndView dingdanxiangChakan(Dingdanxiang req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("dingdanxiangChakan");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-订单项按id列排序列表页
    @RequestMapping("/dingdanxiangManaQianSort")
    public ModelAndView dingdanxiangManaQianSort(Dingdanxiang  req, @RequestParam(defaultValue = "1", value = "pageNo") int pageNo) {
        ModelAndView mav = new ModelAndView("dingdanxiangManaQian");
        mav.addObject("actionName","dingdanxiangManaQianSort");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-订单项详情页
    @GetMapping("/dingdanxiangDetailQian/{id}")
    @ResponseBody
    public ModelAndView dingdanxiangDetailQian(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("dingdanxiangDetailQian");
        Dingdanxiang info= dingdanxiangService.findById(id);
        mav.addObject("dingdanxiang", info);

        return mav;
    }

    //后台-订单项详情页
    @GetMapping("/dingdanxiangDetail/{id}")
    @ResponseBody
    public ModelAndView dingdanxiangDetail(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("dingdanxiangDetail");
        Dingdanxiang info= dingdanxiangService.findById(id);
        mav.addObject("dingdanxiang", info);
        return mav;
    }

    //获取所有订单项数据接口
    @RequestMapping("/dingdanxiangAll")
    @ResponseBody
    public ApiResponse<Dingdanxiang> dingdanxiangAll(){
        List<Dingdanxiang> dingdanxiangList=dingdanxiangService.findAll();
        return ApiResponse.success(dingdanxiangList);
    }

    //根据条件（字符类型模糊匹配查询）获取订单项数据接口
    @RequestMapping("/dingdanxiangSearch")
    @ResponseBody
    public ApiResponse<Dingdanxiang> dingdanxiangSearch(Dingdanxiang req){
        List<Dingdanxiang> dingdanxiangList=dingdanxiangService.find(req);
        return ApiResponse.success(dingdanxiangList);
    }

    //根据条件（字符类型完全匹配查询）获取订单项数据接口
    @RequestMapping("/dingdanxiangSearchByEqualTo")
    @ResponseBody
    public ApiResponse<Dingdanxiang> dingdanxiangSearchByEqualTo(Dingdanxiang req){
        List<Dingdanxiang> dingdanxiangList=dingdanxiangService.findByEqualTo(req);
        return ApiResponse.success(dingdanxiangList);
    }

    //订单项添加或修改接口
    @PostMapping("/dingdanxiangAddOrUpdate")
    @ResponseBody
    public ApiResponse<Integer> dingdanxiangAddOrUpdate(@RequestBody Dingdanxiang req, HttpSession session, Boolean isUPdateSession){



        int result = dingdanxiangService.saveOrUpdate(req);


        return ApiResponse.success(result);
    }

    //订单项修改单独一个字段接口
    @PostMapping("/dingdanxiangSet")
    @ResponseBody
    public ApiResponse<Integer> dingdanxiangSet(Dingdanxiang req){
        int result = dingdanxiangService.saveOrUpdate(req);
        return ApiResponse.success(result);
    }



    //订单项删除接口
    @RequestMapping("/dingdanxiangDel/{id}")
    @ResponseBody
    public ApiResponse<Integer> dingdanxiangDel(@PathVariable Integer id){
        int result = dingdanxiangService.deleteById(id);
        return ApiResponse.success(result);
    }

    //后台-订单项修改页
    @RequestMapping("/dingdanxiangGet/{id}")
    @ResponseBody
    public ModelAndView dingdanxiangGet(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("dingdanxiangSet");
        Dingdanxiang info = dingdanxiangService.findById(id);
        mav.addObject("dingdanxiang", info);
        return mav;
    }



    //后台-我的订单项查看页面
    @RequestMapping("/dingdanxiangChakanMy")
    public ModelAndView dingdanxiangChakanMy(Dingdanxiang req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo, HttpSession session){
        ModelAndView mav = new ModelAndView("dingdanxiangChakanMy");
        Users users = (Users)session.getAttribute("user");
        if(null!=users) {
            req.setUsersid(users.getId());
            return getModelAndView(req, pageNo, mav, "id");
        }
        return mav;
    }

    //后台-我的订单项管理列表页面
    @RequestMapping("/dingdanxiangManaMy")
    public ModelAndView dingdanxiangManaMy(Dingdanxiang req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo, HttpSession session){
        ModelAndView mav = new ModelAndView("dingdanxiangManaMy");
        Users users = (Users)session.getAttribute("user");
        if(null!=users) {
            req.setUsersid(users.getId());
            return getModelAndView(req, pageNo, mav, "id");
        }
        return mav;
    }

    //前台-我的订单项管理列表页面
    @RequestMapping("/dingdanxiangManaMyQian")
    public ModelAndView dingdanxiangManaMyQian(Dingdanxiang req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo, HttpSession session){
        ModelAndView mav = new ModelAndView("dingdanxiangManaMyQian");
        Users users = (Users)session.getAttribute("user");
        if(null!=users) {
            req.setUsersid(users.getId());
            return getModelAndView(req, pageNo, mav, "id");
        }
        return mav;
    }


    //前台-订单添加订单项页面
    @GetMapping("/dingdandingdanxiangAddQian/{dingdanid}")
    @ResponseBody
    public ModelAndView dingdandingdanxiangAddQian(@PathVariable Integer dingdanid){
        ModelAndView mav = getDingdanDingdanxiangAddModelAndView(dingdanid,"dingdandingdanxiangAddQian");
        return mav;
    }

    //后台-订单添加订单项页面
    @GetMapping("/dingdandingdanxiangAdd/{dingdanid}")
    @ResponseBody
    public ModelAndView dingdandingdanxiangAdd(@PathVariable Integer dingdanid){
        ModelAndView mav = getDingdanDingdanxiangAddModelAndView(dingdanid,"dingdandingdanxiangAdd");
        return mav;
    }

    //后台-订单订单项查看页面
    @RequestMapping("/dingdandingdanxiangGetBydingdanid/{dingdanid}")
    @ResponseBody
    public ModelAndView dingdandingdanxiangGetBydingdanid(Dingdanxiang req, @PathVariable Integer dingdanid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("dingdandingdanxiangChakan");
        req.setDingdanid(dingdanid);
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-订单订单项查看页面
    @RequestMapping("/dingdandingdanxiangGetBydingdanidQian/{dingdanid}")
    @ResponseBody
    public ModelAndView dingdandingdanxiangGetBydingdanidQian(Dingdanxiang req, @PathVariable Integer dingdanid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("dingdanxiangManaQian");
            mav.addObject("actionName","dingdanxiangManaQian");
        req.setDingdanid(dingdanid);
        return getModelAndView(req, pageNo, mav, "id");
    }


    //订单订单项数据封装
    private ModelAndView getDingdanDingdanxiangAddModelAndView(Integer dingdanid, String viewName) {
        ModelAndView mav = new ModelAndView(viewName);
        Dingdan dingdan=dingdanService.findById(dingdanid);
        mav.addObject("dingdan", dingdan);
        List<Shangpin> shangpinList=shangpinService.findAll();
        mav.addObject("shangpinList", shangpinList);
        List<Users> usersList=usersService.findAll();
        mav.addObject("usersList", usersList);

        return mav;
    }
    //前台-商品添加订单项页面
    @GetMapping("/shangpindingdanxiangAddQian/{shangpinid}")
    @ResponseBody
    public ModelAndView shangpindingdanxiangAddQian(@PathVariable Integer shangpinid){
        ModelAndView mav = getShangpinDingdanxiangAddModelAndView(shangpinid,"shangpindingdanxiangAddQian");
        return mav;
    }

    //后台-商品添加订单项页面
    @GetMapping("/shangpindingdanxiangAdd/{shangpinid}")
    @ResponseBody
    public ModelAndView shangpindingdanxiangAdd(@PathVariable Integer shangpinid){
        ModelAndView mav = getShangpinDingdanxiangAddModelAndView(shangpinid,"shangpindingdanxiangAdd");
        return mav;
    }

    //后台-商品订单项查看页面
    @RequestMapping("/shangpindingdanxiangGetByshangpinid/{shangpinid}")
    @ResponseBody
    public ModelAndView shangpindingdanxiangGetByshangpinid(Dingdanxiang req, @PathVariable Integer shangpinid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("shangpindingdanxiangChakan");
        req.setShangpinid(shangpinid);
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-商品订单项查看页面
    @RequestMapping("/shangpindingdanxiangGetByshangpinidQian/{shangpinid}")
    @ResponseBody
    public ModelAndView shangpindingdanxiangGetByshangpinidQian(Dingdanxiang req, @PathVariable Integer shangpinid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("dingdanxiangManaQian");
            mav.addObject("actionName","dingdanxiangManaQian");
        req.setShangpinid(shangpinid);
        return getModelAndView(req, pageNo, mav, "id");
    }


    //商品订单项数据封装
    private ModelAndView getShangpinDingdanxiangAddModelAndView(Integer shangpinid, String viewName) {
        ModelAndView mav = new ModelAndView(viewName);
        Shangpin shangpin=shangpinService.findById(shangpinid);
        mav.addObject("shangpin", shangpin);
        List<Dingdan> dingdanList=dingdanService.findAll();
        mav.addObject("dingdanList", dingdanList);
        List<Users> usersList=usersService.findAll();
        mav.addObject("usersList", usersList);

        return mav;
    }
    //前台-用户添加订单项页面
    @GetMapping("/usersdingdanxiangAddQian/{usersid}")
    @ResponseBody
    public ModelAndView usersdingdanxiangAddQian(@PathVariable Integer usersid){
        ModelAndView mav = getUsersDingdanxiangAddModelAndView(usersid,"usersdingdanxiangAddQian");
        return mav;
    }

    //后台-用户添加订单项页面
    @GetMapping("/usersdingdanxiangAdd/{usersid}")
    @ResponseBody
    public ModelAndView usersdingdanxiangAdd(@PathVariable Integer usersid){
        ModelAndView mav = getUsersDingdanxiangAddModelAndView(usersid,"usersdingdanxiangAdd");
        return mav;
    }

    //后台-用户订单项查看页面
    @RequestMapping("/usersdingdanxiangGetByusersid/{usersid}")
    @ResponseBody
    public ModelAndView usersdingdanxiangGetByusersid(Dingdanxiang req, @PathVariable Integer usersid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("usersdingdanxiangChakan");
        req.setUsersid(usersid);
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-用户订单项查看页面
    @RequestMapping("/usersdingdanxiangGetByusersidQian/{usersid}")
    @ResponseBody
    public ModelAndView usersdingdanxiangGetByusersidQian(Dingdanxiang req, @PathVariable Integer usersid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("dingdanxiangManaQian");
            mav.addObject("actionName","dingdanxiangManaQian");
        req.setUsersid(usersid);
        return getModelAndView(req, pageNo, mav, "id");
    }


    //用户订单项数据封装
    private ModelAndView getUsersDingdanxiangAddModelAndView(Integer usersid, String viewName) {
        ModelAndView mav = new ModelAndView(viewName);
        Users users=usersService.findById(usersid);
        mav.addObject("users", users);
        List<Dingdan> dingdanList=dingdanService.findAll();
        mav.addObject("dingdanList", dingdanList);
        List<Shangpin> shangpinList=shangpinService.findAll();
        mav.addObject("shangpinList", shangpinList);

        return mav;
    }



    //订单项模糊匹配查询分页数据封装
    private ModelAndView getModelAndView(Dingdanxiang req, int pageNo, ModelAndView mav, String sortProperty) {
        PageWrap<Dingdanxiang> pageWrap=new PageWrap<Dingdanxiang>();
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
        PageData<Dingdanxiang> pageInfo= dingdanxiangService.findPage(pageWrap);
        mav.addObject("pageInfo", pageInfo);


        mav.addObject("req", req);
        List<Dingdan> dingdanList=dingdanService.findAll();
        mav.addObject("dingdanList", dingdanList);
        List<Shangpin> shangpinList=shangpinService.findAll();
        mav.addObject("shangpinList", shangpinList);
        List<Users> usersList=usersService.findAll();
        mav.addObject("usersList", usersList);

        return mav;
    }

    //订单项完全匹配查询分页数据封装
    private ModelAndView getModelAndViewByEqualTo(Dingdanxiang req, int pageNo, ModelAndView mav, String sortProperty) {
        PageWrap<Dingdanxiang> pageWrap=new PageWrap<Dingdanxiang>();
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
        PageData<Dingdanxiang> pageInfo= dingdanxiangService.findPageByEqualTo(pageWrap);
        mav.addObject("pageInfo", pageInfo);


        mav.addObject("req", req);
        List<Dingdan> dingdanList=dingdanService.findAll();
        mav.addObject("dingdanList", dingdanList);
        List<Shangpin> shangpinList=shangpinService.findAll();
        mav.addObject("shangpinList", shangpinList);
        List<Users> usersList=usersService.findAll();
        mav.addObject("usersList", usersList);

        return mav;
        }
}
