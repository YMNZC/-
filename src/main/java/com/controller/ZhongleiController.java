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
 * @ClassName ZhongleiController
 * @Description 分类模块控制层
 */
@Controller
public class ZhongleiController extends BaseController{

    @Autowired
    private ZhongleiService zhongleiService;




    //前台-分类列表页
    @RequestMapping("/zhongleiManaQian")
    public ModelAndView zhongleiManaQian(Zhonglei req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("zhongleiManaQian");
        mav.addObject("actionName","zhongleiManaQian");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-分类图片列表页
    @RequestMapping("/zhongleiManaQiantp")
    public ModelAndView zhongleiManaQiantp(Zhonglei req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("zhongleiManaQiantp");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //后台-分类管理列表页
    @RequestMapping("/zhongleiMana")
    public ModelAndView zhongleiMana(Zhonglei req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("zhongleiMana");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //后台-分类查看列表页
    @RequestMapping("/zhongleiChakan")
    public ModelAndView zhongleiChakan(Zhonglei req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("zhongleiChakan");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-分类按id列排序列表页
    @RequestMapping("/zhongleiManaQianSort")
    public ModelAndView zhongleiManaQianSort(Zhonglei  req, @RequestParam(defaultValue = "1", value = "pageNo") int pageNo) {
        ModelAndView mav = new ModelAndView("zhongleiManaQian");
        mav.addObject("actionName","zhongleiManaQianSort");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-分类详情页
    @GetMapping("/zhongleiDetailQian/{id}")
    @ResponseBody
    public ModelAndView zhongleiDetailQian(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("zhongleiDetailQian");
        Zhonglei info= zhongleiService.findById(id);
        mav.addObject("zhonglei", info);

        return mav;
    }

    //后台-分类详情页
    @GetMapping("/zhongleiDetail/{id}")
    @ResponseBody
    public ModelAndView zhongleiDetail(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("zhongleiDetail");
        Zhonglei info= zhongleiService.findById(id);
        mav.addObject("zhonglei", info);
        return mav;
    }

    //获取所有分类数据接口
    @RequestMapping("/zhongleiAll")
    @ResponseBody
    public ApiResponse<Zhonglei> zhongleiAll(){
        List<Zhonglei> zhongleiList=zhongleiService.findAll();
        return ApiResponse.success(zhongleiList);
    }

    //根据条件（字符类型模糊匹配查询）获取分类数据接口
    @RequestMapping("/zhongleiSearch")
    @ResponseBody
    public ApiResponse<Zhonglei> zhongleiSearch(Zhonglei req){
        List<Zhonglei> zhongleiList=zhongleiService.find(req);
        return ApiResponse.success(zhongleiList);
    }

    //根据条件（字符类型完全匹配查询）获取分类数据接口
    @RequestMapping("/zhongleiSearchByEqualTo")
    @ResponseBody
    public ApiResponse<Zhonglei> zhongleiSearchByEqualTo(Zhonglei req){
        List<Zhonglei> zhongleiList=zhongleiService.findByEqualTo(req);
        return ApiResponse.success(zhongleiList);
    }

    //分类添加或修改接口
    @PostMapping("/zhongleiAddOrUpdate")
    @ResponseBody
    public ApiResponse<Integer> zhongleiAddOrUpdate(@RequestBody Zhonglei req, HttpSession session, Boolean isUPdateSession){



        int result = zhongleiService.saveOrUpdate(req);


        return ApiResponse.success(result);
    }

    //分类修改单独一个字段接口
    @PostMapping("/zhongleiSet")
    @ResponseBody
    public ApiResponse<Integer> zhongleiSet(Zhonglei req){
        int result = zhongleiService.saveOrUpdate(req);
        return ApiResponse.success(result);
    }



    //分类删除接口
    @RequestMapping("/zhongleiDel/{id}")
    @ResponseBody
    public ApiResponse<Integer> zhongleiDel(@PathVariable Integer id){
        int result = zhongleiService.deleteById(id);
        return ApiResponse.success(result);
    }

    //后台-分类修改页
    @RequestMapping("/zhongleiGet/{id}")
    @ResponseBody
    public ModelAndView zhongleiGet(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("zhongleiSet");
        Zhonglei info = zhongleiService.findById(id);
        mav.addObject("zhonglei", info);
        return mav;
    }








    //分类模糊匹配查询分页数据封装
    private ModelAndView getModelAndView(Zhonglei req, int pageNo, ModelAndView mav, String sortProperty) {
        PageWrap<Zhonglei> pageWrap=new PageWrap<Zhonglei>();
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
        PageData<Zhonglei> pageInfo= zhongleiService.findPage(pageWrap);
        mav.addObject("pageInfo", pageInfo);


        mav.addObject("req", req);

        return mav;
    }

    //分类完全匹配查询分页数据封装
    private ModelAndView getModelAndViewByEqualTo(Zhonglei req, int pageNo, ModelAndView mav, String sortProperty) {
        PageWrap<Zhonglei> pageWrap=new PageWrap<Zhonglei>();
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
        PageData<Zhonglei> pageInfo= zhongleiService.findPageByEqualTo(pageWrap);
        mav.addObject("pageInfo", pageInfo);


        mav.addObject("req", req);

        return mav;
        }
}
