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
 * @ClassName FukuanfangshiController
 * @Description 付款方式模块控制层
 */
@Controller
public class FukuanfangshiController extends BaseController{

    @Autowired
    private FukuanfangshiService fukuanfangshiService;




    //前台-付款方式列表页
    @RequestMapping("/fukuanfangshiManaQian")
    public ModelAndView fukuanfangshiManaQian(Fukuanfangshi req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("fukuanfangshiManaQian");
        mav.addObject("actionName","fukuanfangshiManaQian");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-付款方式图片列表页
    @RequestMapping("/fukuanfangshiManaQiantp")
    public ModelAndView fukuanfangshiManaQiantp(Fukuanfangshi req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("fukuanfangshiManaQiantp");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //后台-付款方式管理列表页
    @RequestMapping("/fukuanfangshiMana")
    public ModelAndView fukuanfangshiMana(Fukuanfangshi req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("fukuanfangshiMana");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //后台-付款方式查看列表页
    @RequestMapping("/fukuanfangshiChakan")
    public ModelAndView fukuanfangshiChakan(Fukuanfangshi req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("fukuanfangshiChakan");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-付款方式按id列排序列表页
    @RequestMapping("/fukuanfangshiManaQianSort")
    public ModelAndView fukuanfangshiManaQianSort(Fukuanfangshi  req, @RequestParam(defaultValue = "1", value = "pageNo") int pageNo) {
        ModelAndView mav = new ModelAndView("fukuanfangshiManaQian");
        mav.addObject("actionName","fukuanfangshiManaQianSort");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-付款方式详情页
    @GetMapping("/fukuanfangshiDetailQian/{id}")
    @ResponseBody
    public ModelAndView fukuanfangshiDetailQian(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("fukuanfangshiDetailQian");
        Fukuanfangshi info= fukuanfangshiService.findById(id);
        mav.addObject("fukuanfangshi", info);

        return mav;
    }

    //后台-付款方式详情页
    @GetMapping("/fukuanfangshiDetail/{id}")
    @ResponseBody
    public ModelAndView fukuanfangshiDetail(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("fukuanfangshiDetail");
        Fukuanfangshi info= fukuanfangshiService.findById(id);
        mav.addObject("fukuanfangshi", info);
        return mav;
    }

    //获取所有付款方式数据接口
    @RequestMapping("/fukuanfangshiAll")
    @ResponseBody
    public ApiResponse<Fukuanfangshi> fukuanfangshiAll(){
        List<Fukuanfangshi> fukuanfangshiList=fukuanfangshiService.findAll();
        return ApiResponse.success(fukuanfangshiList);
    }

    //根据条件（字符类型模糊匹配查询）获取付款方式数据接口
    @RequestMapping("/fukuanfangshiSearch")
    @ResponseBody
    public ApiResponse<Fukuanfangshi> fukuanfangshiSearch(Fukuanfangshi req){
        List<Fukuanfangshi> fukuanfangshiList=fukuanfangshiService.find(req);
        return ApiResponse.success(fukuanfangshiList);
    }

    //根据条件（字符类型完全匹配查询）获取付款方式数据接口
    @RequestMapping("/fukuanfangshiSearchByEqualTo")
    @ResponseBody
    public ApiResponse<Fukuanfangshi> fukuanfangshiSearchByEqualTo(Fukuanfangshi req){
        List<Fukuanfangshi> fukuanfangshiList=fukuanfangshiService.findByEqualTo(req);
        return ApiResponse.success(fukuanfangshiList);
    }

    //付款方式添加或修改接口
    @PostMapping("/fukuanfangshiAddOrUpdate")
    @ResponseBody
    public ApiResponse<Integer> fukuanfangshiAddOrUpdate(@RequestBody Fukuanfangshi req, HttpSession session, Boolean isUPdateSession){



        int result = fukuanfangshiService.saveOrUpdate(req);


        return ApiResponse.success(result);
    }

    //付款方式修改单独一个字段接口
    @PostMapping("/fukuanfangshiSet")
    @ResponseBody
    public ApiResponse<Integer> fukuanfangshiSet(Fukuanfangshi req){
        int result = fukuanfangshiService.saveOrUpdate(req);
        return ApiResponse.success(result);
    }



    //付款方式删除接口
    @RequestMapping("/fukuanfangshiDel/{id}")
    @ResponseBody
    public ApiResponse<Integer> fukuanfangshiDel(@PathVariable Integer id){
        int result = fukuanfangshiService.deleteById(id);
        return ApiResponse.success(result);
    }

    //后台-付款方式修改页
    @RequestMapping("/fukuanfangshiGet/{id}")
    @ResponseBody
    public ModelAndView fukuanfangshiGet(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("fukuanfangshiSet");
        Fukuanfangshi info = fukuanfangshiService.findById(id);
        mav.addObject("fukuanfangshi", info);
        return mav;
    }








    //付款方式模糊匹配查询分页数据封装
    private ModelAndView getModelAndView(Fukuanfangshi req, int pageNo, ModelAndView mav, String sortProperty) {
        PageWrap<Fukuanfangshi> pageWrap=new PageWrap<Fukuanfangshi>();
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
        PageData<Fukuanfangshi> pageInfo= fukuanfangshiService.findPage(pageWrap);
        mav.addObject("pageInfo", pageInfo);


        mav.addObject("req", req);

        return mav;
    }

    //付款方式完全匹配查询分页数据封装
    private ModelAndView getModelAndViewByEqualTo(Fukuanfangshi req, int pageNo, ModelAndView mav, String sortProperty) {
        PageWrap<Fukuanfangshi> pageWrap=new PageWrap<Fukuanfangshi>();
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
        PageData<Fukuanfangshi> pageInfo= fukuanfangshiService.findPageByEqualTo(pageWrap);
        mav.addObject("pageInfo", pageInfo);


        mav.addObject("req", req);

        return mav;
        }
}
