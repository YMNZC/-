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
 * @ClassName PingjiaController
 * @Description 商品评价模块控制层
 */
@Controller
public class PingjiaController extends BaseController{

    @Autowired
    private PingjiaService pingjiaService;

    @Autowired
    private ShangpinService shangpinService;
    @Autowired
    private UsersService usersService;



    //前台-商品评价列表页
    @RequestMapping("/pingjiaManaQian")
    public ModelAndView pingjiaManaQian(Pingjia req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("pingjiaManaQian");
        mav.addObject("actionName","pingjiaManaQian");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-商品评价图片列表页
    @RequestMapping("/pingjiaManaQiantp")
    public ModelAndView pingjiaManaQiantp(Pingjia req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("pingjiaManaQiantp");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //后台-商品评价管理列表页
    @RequestMapping("/pingjiaMana")
    public ModelAndView pingjiaMana(Pingjia req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("pingjiaMana");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //后台-商品评价查看列表页
    @RequestMapping("/pingjiaChakan")
    public ModelAndView pingjiaChakan(Pingjia req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("pingjiaChakan");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-商品评价按id列排序列表页
    @RequestMapping("/pingjiaManaQianSort")
    public ModelAndView pingjiaManaQianSort(Pingjia  req, @RequestParam(defaultValue = "1", value = "pageNo") int pageNo) {
        ModelAndView mav = new ModelAndView("pingjiaManaQian");
        mav.addObject("actionName","pingjiaManaQianSort");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-商品评价详情页
    @GetMapping("/pingjiaDetailQian/{id}")
    @ResponseBody
    public ModelAndView pingjiaDetailQian(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("pingjiaDetailQian");
        Pingjia info= pingjiaService.findById(id);
        mav.addObject("pingjia", info);

        return mav;
    }

    //后台-商品评价详情页
    @GetMapping("/pingjiaDetail/{id}")
    @ResponseBody
    public ModelAndView pingjiaDetail(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("pingjiaDetail");
        Pingjia info= pingjiaService.findById(id);
        mav.addObject("pingjia", info);
        return mav;
    }

    //获取所有商品评价数据接口
    @RequestMapping("/pingjiaAll")
    @ResponseBody
    public ApiResponse<Pingjia> pingjiaAll(){
        List<Pingjia> pingjiaList=pingjiaService.findAll();
        return ApiResponse.success(pingjiaList);
    }

    //根据条件（字符类型模糊匹配查询）获取商品评价数据接口
    @RequestMapping("/pingjiaSearch")
    @ResponseBody
    public ApiResponse<Pingjia> pingjiaSearch(Pingjia req){
        List<Pingjia> pingjiaList=pingjiaService.find(req);
        return ApiResponse.success(pingjiaList);
    }

    //根据条件（字符类型完全匹配查询）获取商品评价数据接口
    @RequestMapping("/pingjiaSearchByEqualTo")
    @ResponseBody
    public ApiResponse<Pingjia> pingjiaSearchByEqualTo(Pingjia req){
        List<Pingjia> pingjiaList=pingjiaService.findByEqualTo(req);
        return ApiResponse.success(pingjiaList);
    }

    //商品评价添加或修改接口
    @PostMapping("/pingjiaAddOrUpdate")
    @ResponseBody
    public ApiResponse<Integer> pingjiaAddOrUpdate(@RequestBody Pingjia req, HttpSession session, Boolean isUPdateSession){



        int result = pingjiaService.saveOrUpdate(req);


        return ApiResponse.success(result);
    }

    //商品评价修改单独一个字段接口
    @PostMapping("/pingjiaSet")
    @ResponseBody
    public ApiResponse<Integer> pingjiaSet(Pingjia req){
        int result = pingjiaService.saveOrUpdate(req);
        return ApiResponse.success(result);
    }



    //商品评价删除接口
    @RequestMapping("/pingjiaDel/{id}")
    @ResponseBody
    public ApiResponse<Integer> pingjiaDel(@PathVariable Integer id){
        int result = pingjiaService.deleteById(id);
        return ApiResponse.success(result);
    }

    //后台-商品评价修改页
    @RequestMapping("/pingjiaGet/{id}")
    @ResponseBody
    public ModelAndView pingjiaGet(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("pingjiaSet");
        Pingjia info = pingjiaService.findById(id);
        mav.addObject("pingjia", info);
        return mav;
    }



    //后台-我的商品评价查看页面
    @RequestMapping("/pingjiaChakanMy")
    public ModelAndView pingjiaChakanMy(Pingjia req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo, HttpSession session){
        ModelAndView mav = new ModelAndView("pingjiaChakanMy");
        Users users = (Users)session.getAttribute("user");
        if(null!=users) {
            req.setUsersid(users.getId());
            return getModelAndView(req, pageNo, mav, "id");
        }
        return mav;
    }

    //后台-我的商品评价管理列表页面
    @RequestMapping("/pingjiaManaMy")
    public ModelAndView pingjiaManaMy(Pingjia req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo, HttpSession session){
        ModelAndView mav = new ModelAndView("pingjiaManaMy");
        Users users = (Users)session.getAttribute("user");
        if(null!=users) {
            req.setUsersid(users.getId());
            return getModelAndView(req, pageNo, mav, "id");
        }
        return mav;
    }

    //前台-我的商品评价管理列表页面
    @RequestMapping("/pingjiaManaMyQian")
    public ModelAndView pingjiaManaMyQian(Pingjia req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo, HttpSession session){
        ModelAndView mav = new ModelAndView("pingjiaManaMyQian");
        Users users = (Users)session.getAttribute("user");
        if(null!=users) {
            req.setUsersid(users.getId());
            return getModelAndView(req, pageNo, mav, "id");
        }
        return mav;
    }


    //前台-商品添加商品评价页面
    @GetMapping("/shangpinpingjiaAddQian/{shangpinid}")
    @ResponseBody
    public ModelAndView shangpinpingjiaAddQian(@PathVariable Integer shangpinid){
        ModelAndView mav = getShangpinPingjiaAddModelAndView(shangpinid,"shangpinpingjiaAddQian");
        return mav;
    }

    //后台-商品添加商品评价页面
    @GetMapping("/shangpinpingjiaAdd/{shangpinid}")
    @ResponseBody
    public ModelAndView shangpinpingjiaAdd(@PathVariable Integer shangpinid){
        ModelAndView mav = getShangpinPingjiaAddModelAndView(shangpinid,"shangpinpingjiaAdd");
        return mav;
    }

    //后台-商品商品评价查看页面
    @RequestMapping("/shangpinpingjiaGetByshangpinid/{shangpinid}")
    @ResponseBody
    public ModelAndView shangpinpingjiaGetByshangpinid(Pingjia req, @PathVariable Integer shangpinid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("shangpinpingjiaChakan");
        req.setShangpinid(shangpinid);
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-商品商品评价查看页面
    @RequestMapping("/shangpinpingjiaGetByshangpinidQian/{shangpinid}")
    @ResponseBody
    public ModelAndView shangpinpingjiaGetByshangpinidQian(Pingjia req, @PathVariable Integer shangpinid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("pingjiaManaQian");
            mav.addObject("actionName","pingjiaManaQian");
        req.setShangpinid(shangpinid);
        return getModelAndView(req, pageNo, mav, "id");
    }


    //商品商品评价数据封装
    private ModelAndView getShangpinPingjiaAddModelAndView(Integer shangpinid, String viewName) {
        ModelAndView mav = new ModelAndView(viewName);
        Shangpin shangpin=shangpinService.findById(shangpinid);
        mav.addObject("shangpin", shangpin);
        List<Users> usersList=usersService.findAll();
        mav.addObject("usersList", usersList);

        return mav;
    }
    //前台-用户添加商品评价页面
    @GetMapping("/userspingjiaAddQian/{usersid}")
    @ResponseBody
    public ModelAndView userspingjiaAddQian(@PathVariable Integer usersid){
        ModelAndView mav = getUsersPingjiaAddModelAndView(usersid,"userspingjiaAddQian");
        return mav;
    }

    //后台-用户添加商品评价页面
    @GetMapping("/userspingjiaAdd/{usersid}")
    @ResponseBody
    public ModelAndView userspingjiaAdd(@PathVariable Integer usersid){
        ModelAndView mav = getUsersPingjiaAddModelAndView(usersid,"userspingjiaAdd");
        return mav;
    }

    //后台-用户商品评价查看页面
    @RequestMapping("/userspingjiaGetByusersid/{usersid}")
    @ResponseBody
    public ModelAndView userspingjiaGetByusersid(Pingjia req, @PathVariable Integer usersid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("userspingjiaChakan");
        req.setUsersid(usersid);
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-用户商品评价查看页面
    @RequestMapping("/userspingjiaGetByusersidQian/{usersid}")
    @ResponseBody
    public ModelAndView userspingjiaGetByusersidQian(Pingjia req, @PathVariable Integer usersid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("pingjiaManaQian");
            mav.addObject("actionName","pingjiaManaQian");
        req.setUsersid(usersid);
        return getModelAndView(req, pageNo, mav, "id");
    }


    //用户商品评价数据封装
    private ModelAndView getUsersPingjiaAddModelAndView(Integer usersid, String viewName) {
        ModelAndView mav = new ModelAndView(viewName);
        Users users=usersService.findById(usersid);
        mav.addObject("users", users);
        List<Shangpin> shangpinList=shangpinService.findAll();
        mav.addObject("shangpinList", shangpinList);

        return mav;
    }



    //商品评价模糊匹配查询分页数据封装
    private ModelAndView getModelAndView(Pingjia req, int pageNo, ModelAndView mav, String sortProperty) {
        PageWrap<Pingjia> pageWrap=new PageWrap<Pingjia>();
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
        PageData<Pingjia> pageInfo= pingjiaService.findPage(pageWrap);
        mav.addObject("pageInfo", pageInfo);


        mav.addObject("req", req);
        List<Shangpin> shangpinList=shangpinService.findAll();
        mav.addObject("shangpinList", shangpinList);
        List<Users> usersList=usersService.findAll();
        mav.addObject("usersList", usersList);

        return mav;
    }

    //商品评价完全匹配查询分页数据封装
    private ModelAndView getModelAndViewByEqualTo(Pingjia req, int pageNo, ModelAndView mav, String sortProperty) {
        PageWrap<Pingjia> pageWrap=new PageWrap<Pingjia>();
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
        PageData<Pingjia> pageInfo= pingjiaService.findPageByEqualTo(pageWrap);
        mav.addObject("pageInfo", pageInfo);


        mav.addObject("req", req);
        List<Shangpin> shangpinList=shangpinService.findAll();
        mav.addObject("shangpinList", shangpinList);
        List<Users> usersList=usersService.findAll();
        mav.addObject("usersList", usersList);

        return mav;
        }
}
