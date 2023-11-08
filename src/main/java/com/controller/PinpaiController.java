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
 * @ClassName PinpaiController
 * @Description 品牌模块控制层
 */
@Controller
public class PinpaiController extends BaseController{

    @Autowired
    private PinpaiService pinpaiService;




    //前台-品牌列表页
    @RequestMapping("/pinpaiManaQian")
    public ModelAndView pinpaiManaQian(Pinpai req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("pinpaiManaQian");
        mav.addObject("actionName","pinpaiManaQian");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-品牌图片列表页
    @RequestMapping("/pinpaiManaQiantp")
    public ModelAndView pinpaiManaQiantp(Pinpai req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("pinpaiManaQiantp");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //后台-品牌管理列表页
    @RequestMapping("/pinpaiMana")
    public ModelAndView pinpaiMana(Pinpai req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("pinpaiMana");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //后台-品牌查看列表页
    @RequestMapping("/pinpaiChakan")
    public ModelAndView pinpaiChakan(Pinpai req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("pinpaiChakan");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-品牌按id列排序列表页
    @RequestMapping("/pinpaiManaQianSort")
    public ModelAndView pinpaiManaQianSort(Pinpai  req, @RequestParam(defaultValue = "1", value = "pageNo") int pageNo) {
        ModelAndView mav = new ModelAndView("pinpaiManaQian");
        mav.addObject("actionName","pinpaiManaQianSort");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-品牌详情页
    @GetMapping("/pinpaiDetailQian/{id}")
    @ResponseBody
    public ModelAndView pinpaiDetailQian(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("pinpaiDetailQian");
        Pinpai info= pinpaiService.findById(id);
        mav.addObject("pinpai", info);

        return mav;
    }

    //后台-品牌详情页
    @GetMapping("/pinpaiDetail/{id}")
    @ResponseBody
    public ModelAndView pinpaiDetail(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("pinpaiDetail");
        Pinpai info= pinpaiService.findById(id);
        mav.addObject("pinpai", info);
        return mav;
    }

    //获取所有品牌数据接口
    @RequestMapping("/pinpaiAll")
    @ResponseBody
    public ApiResponse<Pinpai> pinpaiAll(){
        List<Pinpai> pinpaiList=pinpaiService.findAll();
        return ApiResponse.success(pinpaiList);
    }

    //根据条件（字符类型模糊匹配查询）获取品牌数据接口
    @RequestMapping("/pinpaiSearch")
    @ResponseBody
    public ApiResponse<Pinpai> pinpaiSearch(Pinpai req){
        List<Pinpai> pinpaiList=pinpaiService.find(req);
        return ApiResponse.success(pinpaiList);
    }

    //根据条件（字符类型完全匹配查询）获取品牌数据接口
    @RequestMapping("/pinpaiSearchByEqualTo")
    @ResponseBody
    public ApiResponse<Pinpai> pinpaiSearchByEqualTo(Pinpai req){
        List<Pinpai> pinpaiList=pinpaiService.findByEqualTo(req);
        return ApiResponse.success(pinpaiList);
    }

    //品牌添加或修改接口
    @PostMapping("/pinpaiAddOrUpdate")
    @ResponseBody
    public ApiResponse<Integer> pinpaiAddOrUpdate(@RequestBody Pinpai req, HttpSession session, Boolean isUPdateSession){



        int result = pinpaiService.saveOrUpdate(req);


        return ApiResponse.success(result);
    }

    //品牌修改单独一个字段接口
    @PostMapping("/pinpaiSet")
    @ResponseBody
    public ApiResponse<Integer> pinpaiSet(Pinpai req){
        int result = pinpaiService.saveOrUpdate(req);
        return ApiResponse.success(result);
    }



    //品牌删除接口
    @RequestMapping("/pinpaiDel/{id}")
    @ResponseBody
    public ApiResponse<Integer> pinpaiDel(@PathVariable Integer id){
        int result = pinpaiService.deleteById(id);
        return ApiResponse.success(result);
    }

    //后台-品牌修改页
    @RequestMapping("/pinpaiGet/{id}")
    @ResponseBody
    public ModelAndView pinpaiGet(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("pinpaiSet");
        Pinpai info = pinpaiService.findById(id);
        mav.addObject("pinpai", info);
        return mav;
    }








    //品牌模糊匹配查询分页数据封装
    private ModelAndView getModelAndView(Pinpai req, int pageNo, ModelAndView mav, String sortProperty) {
        PageWrap<Pinpai> pageWrap=new PageWrap<Pinpai>();
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
        PageData<Pinpai> pageInfo= pinpaiService.findPage(pageWrap);
        mav.addObject("pageInfo", pageInfo);


        mav.addObject("req", req);

        return mav;
    }

    //品牌完全匹配查询分页数据封装
    private ModelAndView getModelAndViewByEqualTo(Pinpai req, int pageNo, ModelAndView mav, String sortProperty) {
        PageWrap<Pinpai> pageWrap=new PageWrap<Pinpai>();
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
        PageData<Pinpai> pageInfo= pinpaiService.findPageByEqualTo(pageWrap);
        mav.addObject("pageInfo", pageInfo);


        mav.addObject("req", req);

        return mav;
        }
}
