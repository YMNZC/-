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
 * @ClassName ShoucangController
 * @Description 商品收藏模块控制层
 */
@Controller
public class ShoucangController extends BaseController{

    @Autowired
    private ShoucangService shoucangService;

    @Autowired
    private ShangpinService shangpinService;
    @Autowired
    private UsersService usersService;



    //前台-商品收藏列表页
    @RequestMapping("/shoucangManaQian")
    public ModelAndView shoucangManaQian(Shoucang req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("shoucangManaQian");
        mav.addObject("actionName","shoucangManaQian");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-商品收藏图片列表页
    @RequestMapping("/shoucangManaQiantp")
    public ModelAndView shoucangManaQiantp(Shoucang req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("shoucangManaQiantp");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //后台-商品收藏管理列表页
    @RequestMapping("/shoucangMana")
    public ModelAndView shoucangMana(Shoucang req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("shoucangMana");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //后台-商品收藏查看列表页
    @RequestMapping("/shoucangChakan")
    public ModelAndView shoucangChakan(Shoucang req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("shoucangChakan");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-商品收藏按id列排序列表页
    @RequestMapping("/shoucangManaQianSort")
    public ModelAndView shoucangManaQianSort(Shoucang  req, @RequestParam(defaultValue = "1", value = "pageNo") int pageNo) {
        ModelAndView mav = new ModelAndView("shoucangManaQian");
        mav.addObject("actionName","shoucangManaQianSort");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-商品收藏详情页
    @GetMapping("/shoucangDetailQian/{id}")
    @ResponseBody
    public ModelAndView shoucangDetailQian(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("shoucangDetailQian");
        Shoucang info= shoucangService.findById(id);
        mav.addObject("shoucang", info);

        return mav;
    }

    //后台-商品收藏详情页
    @GetMapping("/shoucangDetail/{id}")
    @ResponseBody
    public ModelAndView shoucangDetail(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("shoucangDetail");
        Shoucang info= shoucangService.findById(id);
        mav.addObject("shoucang", info);
        return mav;
    }

    //获取所有商品收藏数据接口
    @RequestMapping("/shoucangAll")
    @ResponseBody
    public ApiResponse<Shoucang> shoucangAll(){
        List<Shoucang> shoucangList=shoucangService.findAll();
        return ApiResponse.success(shoucangList);
    }

    //根据条件（字符类型模糊匹配查询）获取商品收藏数据接口
    @RequestMapping("/shoucangSearch")
    @ResponseBody
    public ApiResponse<Shoucang> shoucangSearch(Shoucang req){
        List<Shoucang> shoucangList=shoucangService.find(req);
        return ApiResponse.success(shoucangList);
    }

    //根据条件（字符类型完全匹配查询）获取商品收藏数据接口
    @RequestMapping("/shoucangSearchByEqualTo")
    @ResponseBody
    public ApiResponse<Shoucang> shoucangSearchByEqualTo(Shoucang req){
        List<Shoucang> shoucangList=shoucangService.findByEqualTo(req);
        return ApiResponse.success(shoucangList);
    }

    //商品收藏添加或修改接口
    @PostMapping("/shoucangAddOrUpdate")
    @ResponseBody
    public ApiResponse<Integer> shoucangAddOrUpdate(@RequestBody Shoucang req, HttpSession session, Boolean isUPdateSession){



        int result = shoucangService.saveOrUpdate(req);


        return ApiResponse.success(result);
    }

    //商品收藏修改单独一个字段接口
    @PostMapping("/shoucangSet")
    @ResponseBody
    public ApiResponse<Integer> shoucangSet(Shoucang req){
        int result = shoucangService.saveOrUpdate(req);
        return ApiResponse.success(result);
    }



    //商品收藏删除接口
    @RequestMapping("/shoucangDel/{id}")
    @ResponseBody
    public ApiResponse<Integer> shoucangDel(@PathVariable Integer id){
        int result = shoucangService.deleteById(id);
        return ApiResponse.success(result);
    }

    //后台-商品收藏修改页
    @RequestMapping("/shoucangGet/{id}")
    @ResponseBody
    public ModelAndView shoucangGet(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("shoucangSet");
        Shoucang info = shoucangService.findById(id);
        mav.addObject("shoucang", info);
        return mav;
    }



    //后台-我的商品收藏查看页面
    @RequestMapping("/shoucangChakanMy")
    public ModelAndView shoucangChakanMy(Shoucang req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo, HttpSession session){
        ModelAndView mav = new ModelAndView("shoucangChakanMy");
        Users users = (Users)session.getAttribute("user");
        if(null!=users) {
            req.setUsersid(users.getId());
            return getModelAndView(req, pageNo, mav, "id");
        }
        return mav;
    }

    //后台-我的商品收藏管理列表页面
    @RequestMapping("/shoucangManaMy")
    public ModelAndView shoucangManaMy(Shoucang req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo, HttpSession session){
        ModelAndView mav = new ModelAndView("shoucangManaMy");
        Users users = (Users)session.getAttribute("user");
        if(null!=users) {
            req.setUsersid(users.getId());
            return getModelAndView(req, pageNo, mav, "id");
        }
        return mav;
    }

    //前台-我的商品收藏管理列表页面
    @RequestMapping("/shoucangManaMyQian")
    public ModelAndView shoucangManaMyQian(Shoucang req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo, HttpSession session){
        ModelAndView mav = new ModelAndView("shoucangManaMyQian");
        Users users = (Users)session.getAttribute("user");
        if(null!=users) {
            req.setUsersid(users.getId());
            return getModelAndView(req, pageNo, mav, "id");
        }
        return mav;
    }


    //前台-商品添加商品收藏页面
    @GetMapping("/shangpinshoucangAddQian/{shangpinid}")
    @ResponseBody
    public ModelAndView shangpinshoucangAddQian(@PathVariable Integer shangpinid){
        ModelAndView mav = getShangpinShoucangAddModelAndView(shangpinid,"shangpinshoucangAddQian");
        return mav;
    }

    //后台-商品添加商品收藏页面
    @GetMapping("/shangpinshoucangAdd/{shangpinid}")
    @ResponseBody
    public ModelAndView shangpinshoucangAdd(@PathVariable Integer shangpinid){
        ModelAndView mav = getShangpinShoucangAddModelAndView(shangpinid,"shangpinshoucangAdd");
        return mav;
    }

    //后台-商品商品收藏查看页面
    @RequestMapping("/shangpinshoucangGetByshangpinid/{shangpinid}")
    @ResponseBody
    public ModelAndView shangpinshoucangGetByshangpinid(Shoucang req, @PathVariable Integer shangpinid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("shangpinshoucangChakan");
        req.setShangpinid(shangpinid);
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-商品商品收藏查看页面
    @RequestMapping("/shangpinshoucangGetByshangpinidQian/{shangpinid}")
    @ResponseBody
    public ModelAndView shangpinshoucangGetByshangpinidQian(Shoucang req, @PathVariable Integer shangpinid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("shoucangManaQian");
            mav.addObject("actionName","shoucangManaQian");
        req.setShangpinid(shangpinid);
        return getModelAndView(req, pageNo, mav, "id");
    }


    //商品商品收藏数据封装
    private ModelAndView getShangpinShoucangAddModelAndView(Integer shangpinid, String viewName) {
        ModelAndView mav = new ModelAndView(viewName);
        Shangpin shangpin=shangpinService.findById(shangpinid);
        mav.addObject("shangpin", shangpin);
        List<Users> usersList=usersService.findAll();
        mav.addObject("usersList", usersList);

        return mav;
    }
    //前台-用户添加商品收藏页面
    @GetMapping("/usersshoucangAddQian/{usersid}")
    @ResponseBody
    public ModelAndView usersshoucangAddQian(@PathVariable Integer usersid){
        ModelAndView mav = getUsersShoucangAddModelAndView(usersid,"usersshoucangAddQian");
        return mav;
    }

    //后台-用户添加商品收藏页面
    @GetMapping("/usersshoucangAdd/{usersid}")
    @ResponseBody
    public ModelAndView usersshoucangAdd(@PathVariable Integer usersid){
        ModelAndView mav = getUsersShoucangAddModelAndView(usersid,"usersshoucangAdd");
        return mav;
    }

    //后台-用户商品收藏查看页面
    @RequestMapping("/usersshoucangGetByusersid/{usersid}")
    @ResponseBody
    public ModelAndView usersshoucangGetByusersid(Shoucang req, @PathVariable Integer usersid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("usersshoucangChakan");
        req.setUsersid(usersid);
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-用户商品收藏查看页面
    @RequestMapping("/usersshoucangGetByusersidQian/{usersid}")
    @ResponseBody
    public ModelAndView usersshoucangGetByusersidQian(Shoucang req, @PathVariable Integer usersid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("shoucangManaQian");
            mav.addObject("actionName","shoucangManaQian");
        req.setUsersid(usersid);
        return getModelAndView(req, pageNo, mav, "id");
    }


    //用户商品收藏数据封装
    private ModelAndView getUsersShoucangAddModelAndView(Integer usersid, String viewName) {
        ModelAndView mav = new ModelAndView(viewName);
        Users users=usersService.findById(usersid);
        mav.addObject("users", users);
        List<Shangpin> shangpinList=shangpinService.findAll();
        mav.addObject("shangpinList", shangpinList);

        return mav;
    }



    //商品收藏模糊匹配查询分页数据封装
    private ModelAndView getModelAndView(Shoucang req, int pageNo, ModelAndView mav, String sortProperty) {
        PageWrap<Shoucang> pageWrap=new PageWrap<Shoucang>();
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
        PageData<Shoucang> pageInfo= shoucangService.findPage(pageWrap);
        mav.addObject("pageInfo", pageInfo);


        mav.addObject("req", req);
        List<Shangpin> shangpinList=shangpinService.findAll();
        mav.addObject("shangpinList", shangpinList);
        List<Users> usersList=usersService.findAll();
        mav.addObject("usersList", usersList);

        return mav;
    }

    //商品收藏完全匹配查询分页数据封装
    private ModelAndView getModelAndViewByEqualTo(Shoucang req, int pageNo, ModelAndView mav, String sortProperty) {
        PageWrap<Shoucang> pageWrap=new PageWrap<Shoucang>();
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
        PageData<Shoucang> pageInfo= shoucangService.findPageByEqualTo(pageWrap);
        mav.addObject("pageInfo", pageInfo);


        mav.addObject("req", req);
        List<Shangpin> shangpinList=shangpinService.findAll();
        mav.addObject("shangpinList", shangpinList);
        List<Users> usersList=usersService.findAll();
        mav.addObject("usersList", usersList);

        return mav;
        }
}
