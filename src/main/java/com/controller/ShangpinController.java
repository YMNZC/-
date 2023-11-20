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
 * @ClassName ShangpinController
 * @Description 商品模块控制层
 */
@Controller
public class ShangpinController extends BaseController{

    @Autowired
    private ShangpinService shangpinService;

    @Autowired
    private ZhongleiService zhongleiService;
    @Autowired
    private PinpaiService pinpaiService;
    @Autowired
    private UsersService usersService;



    //前台-商品列表页
    @RequestMapping("/shangpinManaQian")
    public ModelAndView shangpinManaQian(Shangpin req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("shangpinManaQian");
        mav.addObject("actionName","shangpinManaQian");
        req.setShenhe("yes");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-商品图片列表页
    @RequestMapping("/shangpinManaQiantp")
    public ModelAndView shangpinManaQiantp(Shangpin req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("shangpinManaQiantp");
        req.setShenhe("yes");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //后台-商品管理列表页
    @RequestMapping("/shangpinMana")
    public ModelAndView shangpinMana(Shangpin req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("shangpinMana");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //后台-商品查看列表页
    @RequestMapping("/shangpinChakan")
    public ModelAndView shangpinChakan(Shangpin req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("shangpinChakan");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-商品按xiaoshoushuliang列排序列表页
    @RequestMapping("/shangpinManaQianSort")
    public ModelAndView shangpinManaQianSort(Shangpin  req, @RequestParam(defaultValue = "1", value = "pageNo") int pageNo) {
        ModelAndView mav = new ModelAndView("shangpinManaQian");
        mav.addObject("actionName","shangpinManaQianSort");
        req.setShenhe("yes");
        return getModelAndView(req, pageNo, mav, "xiaoshoushuliang");
    }

    //前台-商品详情页
    @GetMapping("/shangpinDetailQian/{id}")
    @ResponseBody
    public ModelAndView shangpinDetailQian(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("shangpinDetailQian");
        Shangpin info= shangpinService.findById(id);
        mav.addObject("shangpin", info);

        return mav;
    }

    //后台-商品详情页
    @GetMapping("/shangpinDetail/{id}")
    @ResponseBody
    public ModelAndView shangpinDetail(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("shangpinDetail");
        Shangpin info= shangpinService.findById(id);
        mav.addObject("shangpin", info);
        return mav;
    }

    //获取所有商品数据接口
    @RequestMapping("/shangpinAll")
    @ResponseBody
    public ApiResponse<Shangpin> shangpinAll(){
        List<Shangpin> shangpinList=shangpinService.findAll();
        return ApiResponse.success(shangpinList);
    }

    //根据条件（字符类型模糊匹配查询）获取商品数据接口
    @RequestMapping("/shangpinSearch")
    @ResponseBody
    public ApiResponse<Shangpin> shangpinSearch(Shangpin req){
        List<Shangpin> shangpinList=shangpinService.find(req);
        return ApiResponse.success(shangpinList);
    }

    //根据条件（字符类型完全匹配查询）获取商品数据接口
    @RequestMapping("/shangpinSearchByEqualTo")
    @ResponseBody
    public ApiResponse<Shangpin> shangpinSearchByEqualTo(Shangpin req){
        List<Shangpin> shangpinList=shangpinService.findByEqualTo(req);
        return ApiResponse.success(shangpinList);
    }

    //商品添加或修改接口
    @PostMapping("/shangpinAddOrUpdate")
    @ResponseBody
    public ApiResponse<Integer> shangpinAddOrUpdate(@RequestBody Shangpin req, HttpSession session, Boolean isUPdateSession){



        int result = shangpinService.saveOrUpdate(req);


        return ApiResponse.success(result);
    }

    //商品修改单独一个字段接口
    @PostMapping("/shangpinSet")
    @ResponseBody
    public ApiResponse<Integer> shangpinSet(Shangpin req){
        int result = shangpinService.saveOrUpdate(req);
        return ApiResponse.success(result);
    }



    //商品删除接口
    @RequestMapping("/shangpinDel/{id}")
    @ResponseBody
    public ApiResponse<Integer> shangpinDel(@PathVariable Integer id){
        int result = shangpinService.deleteById(id);
        return ApiResponse.success(result);
    }

    //后台-商品修改页
    @RequestMapping("/shangpinGet/{id}")
    @ResponseBody
    public ModelAndView shangpinGet(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("shangpinSet");
        Shangpin info = shangpinService.findById(id);
        mav.addObject("shangpin", info);
        return mav;
    }



    //后台-我的商品查看页面
    @RequestMapping("/shangpinChakanMy")
    public ModelAndView shangpinChakanMy(Shangpin req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo, HttpSession session){
        ModelAndView mav = new ModelAndView("shangpinChakanMy");
        Users users = (Users)session.getAttribute("user");
        if(null!=users) {
            req.setUsersid(users.getId());
            return getModelAndView(req, pageNo, mav, "id");
        }
        return mav;
    }

    //后台-我的商品管理列表页面
    @RequestMapping("/shangpinManaMy")
    public ModelAndView shangpinManaMy(Shangpin req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo, HttpSession session){
        ModelAndView mav = new ModelAndView("shangpinManaMy");
        Users users = (Users)session.getAttribute("user");
        if(null!=users) {
            req.setUsersid(users.getId());
            return getModelAndView(req, pageNo, mav, "id");
        }
        return mav;
    }

    //前台-我的商品管理列表页面
    @RequestMapping("/shangpinManaMyQian")
    public ModelAndView shangpinManaMyQian(Shangpin req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo, HttpSession session){
        ModelAndView mav = new ModelAndView("shangpinManaMyQian");
        Users users = (Users)session.getAttribute("user");
        if(null!=users) {
            req.setUsersid(users.getId());
            return getModelAndView(req, pageNo, mav, "id");
        }
        return mav;
    }


    //前台-分类添加商品页面
    @GetMapping("/zhongleishangpinAddQian/{zhongleiid}")
    @ResponseBody
    public ModelAndView zhongleishangpinAddQian(@PathVariable Integer zhongleiid){
        ModelAndView mav = getZhongleiShangpinAddModelAndView(zhongleiid,"zhongleishangpinAddQian");
        return mav;
    }

    //后台-分类添加商品页面
    @GetMapping("/zhongleishangpinAdd/{zhongleiid}")
    @ResponseBody
    public ModelAndView zhongleishangpinAdd(@PathVariable Integer zhongleiid){
        ModelAndView mav = getZhongleiShangpinAddModelAndView(zhongleiid,"zhongleishangpinAdd");
        return mav;
    }

    //后台-分类商品查看页面
    @RequestMapping("/zhongleishangpinGetByzhongleiid/{zhongleiid}")
    @ResponseBody
    public ModelAndView zhongleishangpinGetByzhongleiid(Shangpin req, @PathVariable Integer zhongleiid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("zhongleishangpinChakan");
        req.setZhongleiid(zhongleiid);
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-分类商品查看页面
    @RequestMapping("/zhongleishangpinGetByzhongleiidQian/{zhongleiid}")
    @ResponseBody
    public ModelAndView zhongleishangpinGetByzhongleiidQian(Shangpin req, @PathVariable Integer zhongleiid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("shangpinManaQian");
            mav.addObject("actionName","shangpinManaQian");
        req.setZhongleiid(zhongleiid);
        return getModelAndView(req, pageNo, mav, "id");
    }


    //分类商品数据封装
    private ModelAndView getZhongleiShangpinAddModelAndView(Integer zhongleiid, String viewName) {
        ModelAndView mav = new ModelAndView(viewName);
        Zhonglei zhonglei=zhongleiService.findById(zhongleiid);
        mav.addObject("zhonglei", zhonglei);
        List<Pinpai> pinpaiList=pinpaiService.findAll();
        mav.addObject("pinpaiList", pinpaiList);
        List<Users> usersList=usersService.findAll();
        mav.addObject("usersList", usersList);

        return mav;
    }
    //前台-品牌添加商品页面
    @GetMapping("/pinpaishangpinAddQian/{pinpaiid}")
    @ResponseBody
    public ModelAndView pinpaishangpinAddQian(@PathVariable Integer pinpaiid){
        ModelAndView mav = getPinpaiShangpinAddModelAndView(pinpaiid,"pinpaishangpinAddQian");
        return mav;
    }

    //后台-品牌添加商品页面
    @GetMapping("/pinpaishangpinAdd/{pinpaiid}")
    @ResponseBody
    public ModelAndView pinpaishangpinAdd(@PathVariable Integer pinpaiid){
        ModelAndView mav = getPinpaiShangpinAddModelAndView(pinpaiid,"pinpaishangpinAdd");
        return mav;
    }

    //后台-品牌商品查看页面
    @RequestMapping("/pinpaishangpinGetBypinpaiid/{pinpaiid}")
    @ResponseBody
    public ModelAndView pinpaishangpinGetBypinpaiid(Shangpin req, @PathVariable Integer pinpaiid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("pinpaishangpinChakan");
        req.setPinpaiid(pinpaiid);
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-品牌商品查看页面
    @RequestMapping("/pinpaishangpinGetBypinpaiidQian/{pinpaiid}")
    @ResponseBody
    public ModelAndView pinpaishangpinGetBypinpaiidQian(Shangpin req, @PathVariable Integer pinpaiid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("shangpinManaQian");
            mav.addObject("actionName","shangpinManaQian");
        req.setPinpaiid(pinpaiid);
        return getModelAndView(req, pageNo, mav, "id");
    }


    //品牌商品数据封装
    private ModelAndView getPinpaiShangpinAddModelAndView(Integer pinpaiid, String viewName) {
        ModelAndView mav = new ModelAndView(viewName);
        Pinpai pinpai=pinpaiService.findById(pinpaiid);
        mav.addObject("pinpai", pinpai);
        List<Zhonglei> zhongleiList=zhongleiService.findAll();
        mav.addObject("zhongleiList", zhongleiList);
        List<Users> usersList=usersService.findAll();
        mav.addObject("usersList", usersList);

        return mav;
    }
    //前台-用户添加商品页面
    @GetMapping("/usersshangpinAddQian/{usersid}")
    @ResponseBody
    public ModelAndView usersshangpinAddQian(@PathVariable Integer usersid){
        ModelAndView mav = getUsersShangpinAddModelAndView(usersid,"usersshangpinAddQian");
        return mav;
    }

    //后台-用户添加商品页面
    @GetMapping("/usersshangpinAdd/{usersid}")
    @ResponseBody
    public ModelAndView usersshangpinAdd(@PathVariable Integer usersid){
        ModelAndView mav = getUsersShangpinAddModelAndView(usersid,"usersshangpinAdd");
        return mav;
    }

    //后台-用户商品查看页面
    @RequestMapping("/usersshangpinGetByusersid/{usersid}")
    @ResponseBody
    public ModelAndView usersshangpinGetByusersid(Shangpin req, @PathVariable Integer usersid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("usersshangpinChakan");
        req.setUsersid(usersid);
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-用户商品查看页面
    @RequestMapping("/usersshangpinGetByusersidQian/{usersid}")
    @ResponseBody
    public ModelAndView usersshangpinGetByusersidQian(Shangpin req, @PathVariable Integer usersid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("shangpinManaQian");
            mav.addObject("actionName","shangpinManaQian");
        req.setUsersid(usersid);
        return getModelAndView(req, pageNo, mav, "id");
    }


    //用户商品数据封装
    private ModelAndView getUsersShangpinAddModelAndView(Integer usersid, String viewName) {
        ModelAndView mav = new ModelAndView(viewName);
        Users users=usersService.findById(usersid);
        mav.addObject("users", users);
        List<Zhonglei> zhongleiList=zhongleiService.findAll();
        mav.addObject("zhongleiList", zhongleiList);
        List<Pinpai> pinpaiList=pinpaiService.findAll();
        mav.addObject("pinpaiList", pinpaiList);

        return mav;
    }



    //商品模糊匹配查询分页数据封装
    private ModelAndView getModelAndView(Shangpin req, int pageNo, ModelAndView mav, String sortProperty) {
        PageWrap<Shangpin> pageWrap=new PageWrap<Shangpin>();
        pageWrap.setModel(req);
        pageWrap.setPageNum(pageNo);
        //设置每页最多几条数据，默认为8条
        pageWrap.setPageSize(16);
        PageWrap.SortData sortData=new PageWrap.SortData();
        sortData.setDirection("DESC");
        sortData.setProperty(sortProperty);
        List<PageWrap.SortData> sorts = new ArrayList<>();
        sorts.add(sortData);
        pageWrap.setSorts(sorts);
        PageData<Shangpin> pageInfo= shangpinService.findPage(pageWrap);
        mav.addObject("pageInfo", pageInfo);


        mav.addObject("req", req);
        List<Zhonglei> zhongleiList=zhongleiService.findAll();
        mav.addObject("zhongleiList", zhongleiList);
        List<Pinpai> pinpaiList=pinpaiService.findAll();
        mav.addObject("pinpaiList", pinpaiList);
        List<Users> usersList=usersService.findAll();
        mav.addObject("usersList", usersList);

        return mav;
    }

    //商品完全匹配查询分页数据封装
    private ModelAndView getModelAndViewByEqualTo(Shangpin req, int pageNo, ModelAndView mav, String sortProperty) {
        PageWrap<Shangpin> pageWrap=new PageWrap<Shangpin>();
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
        PageData<Shangpin> pageInfo= shangpinService.findPageByEqualTo(pageWrap);
        mav.addObject("pageInfo", pageInfo);


        mav.addObject("req", req);
        List<Zhonglei> zhongleiList=zhongleiService.findAll();
        mav.addObject("zhongleiList", zhongleiList);
        List<Pinpai> pinpaiList=pinpaiService.findAll();
        mav.addObject("pinpaiList", pinpaiList);
        List<Users> usersList=usersService.findAll();
        mav.addObject("usersList", usersList);

        return mav;
        }
}
