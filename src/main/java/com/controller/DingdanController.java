package com.controller;

import com.entity.*;
import com.service.*;
import com.util.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * @ClassName DingdanController
 * @Description 订单模块控制层
 */
@Controller
public class DingdanController extends BaseController{

    @Autowired
    private DingdanService dingdanService;

    @Autowired
    private FukuanfangshiService fukuanfangshiService;
    @Autowired
    private UsersService usersService;

    @Autowired
    private GouwucheService gouwucheService;
    @Autowired
    private ShangpinService shangpinService;
    @Autowired
    private DingdanxiangService dingdanxiangService;


    //前台-订单列表页
    @RequestMapping("/dingdanManaQian")
    public ModelAndView dingdanManaQian(Dingdan req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("dingdanManaQian");
        mav.addObject("actionName","dingdanManaQian");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-订单图片列表页
    @RequestMapping("/dingdanManaQiantp")
    public ModelAndView dingdanManaQiantp(Dingdan req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("dingdanManaQiantp");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //后台-订单管理列表页
    @RequestMapping("/dingdanMana")
    public ModelAndView dingdanMana(Dingdan req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("dingdanMana");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //后台-订单查看列表页
    @RequestMapping("/dingdanChakan")
    public ModelAndView dingdanChakan(Dingdan req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("dingdanChakan");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-订单按id列排序列表页
    @RequestMapping("/dingdanManaQianSort")
    public ModelAndView dingdanManaQianSort(Dingdan  req, @RequestParam(defaultValue = "1", value = "pageNo") int pageNo) {
        ModelAndView mav = new ModelAndView("dingdanManaQian");
        mav.addObject("actionName","dingdanManaQianSort");
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-订单详情页
    @GetMapping("/dingdanDetailQian/{id}")
    @ResponseBody
    public ModelAndView dingdanDetailQian(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("dingdanDetailQian");
        Dingdan info= dingdanService.findById(id);
        mav.addObject("dingdan", info);

        return mav;
    }

    //后台-订单详情页
    @GetMapping("/dingdanDetail/{id}")
    @ResponseBody
    public ModelAndView dingdanDetail(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("dingdanDetail");
        Dingdan info= dingdanService.findById(id);
        mav.addObject("dingdan", info);
        return mav;
    }

    //获取所有订单数据接口
    @RequestMapping("/dingdanAll")
    @ResponseBody
    public ApiResponse<Dingdan> dingdanAll(){
        List<Dingdan> dingdanList=dingdanService.findAll();
        return ApiResponse.success(dingdanList);
    }

    //根据条件（字符类型模糊匹配查询）获取订单数据接口
    @RequestMapping("/dingdanSearch")
    @ResponseBody
    public ApiResponse<Dingdan> dingdanSearch(Dingdan req){
        List<Dingdan> dingdanList=dingdanService.find(req);
        return ApiResponse.success(dingdanList);
    }

    //根据条件（字符类型完全匹配查询）获取订单数据接口
    @RequestMapping("/dingdanSearchByEqualTo")
    @ResponseBody
    public ApiResponse<Dingdan> dingdanSearchByEqualTo(Dingdan req){
        List<Dingdan> dingdanList=dingdanService.findByEqualTo(req);
        return ApiResponse.success(dingdanList);
    }

    //订单添加或修改接口
    @PostMapping("/dingdanAddOrUpdate")
    @ResponseBody
    public ApiResponse<Integer> dingdanAddOrUpdate(@RequestBody Dingdan req, HttpSession session, Boolean isUPdateSession, String shangPinId){


        Users users = (Users) session.getAttribute("user");
        List<Gouwuche> gouwucheList = new ArrayList<>();

        LinkedHashMap<Integer,Dingdan> dingdanList=new LinkedHashMap<>();

        LinkedHashMap<Integer,Dingdanxiang> dingdanxiangList = new LinkedHashMap<>();

        String message="订单提交成功，请记得及时支付哟！";


        if (null != users && null != users.getId()) {
            if (null == shangPinId || shangPinId.equals("0")) {
                //从购物车里提交订单下单
                Gouwuche gouwuche = new Gouwuche();
                gouwuche.setUsersid(users.getId());
                gouwucheList = gouwucheService.find(gouwuche);
            }else {
                //商品详情页里直接购买下单
                Integer shangpinid = cn.hutool.core.convert.Convert.toInt(shangPinId);
                Gouwuche gouwuche = new Gouwuche();
                gouwuche.setShangpinid(shangpinid);
                gouwuche.setId(0);
                gouwuche.setGoumaishuliang(1);
                gouwucheList.add(gouwuche);
            }
            if (gouwucheList.size() == 0) {
                return ApiResponse.failed("请先将商品添加到购物车再提交订单！");
            } else {
                for (Gouwuche info : gouwucheList) {
                    Integer shangpinid = info.getShangpinid();
                    if (null == shangpinid || shangpinid == 0) {
                        return ApiResponse.failed("购物车里的商品数据异常！");
                    }
                    Integer goumaishuliang = info.getGoumaishuliang();
                    //库存判断
                    Shangpin shangpin = shangpinService.findById(shangpinid);
                    if (null != shangpin) {
                        Integer kucunshuliang = shangpin.getKucunshuliang();
                        //判断库存是否大于或等于订单数量
                        if (kucunshuliang < goumaishuliang) {
                            return ApiResponse.failed("购物车里的商品库存不足，请修正后再提交！");
                        }

                        //按商品所属商家拆分订单
                        Dingdan dingdan=new Dingdan();
                        BeanUtils.copyProperties(req,dingdan);
                        Integer shangjia=shangpin.getUsersid();
                        dingdan.setBianhao(req.getBianhao()+"_"+shangjia);
//                        dingdan.setShouhuoshenhe(req.getShouhuoshenhe());
//                        dingdan.setFukuanfangshiid(req.getFukuanfangshiid());
//                        dingdan.setUsersid(req.getUsersid());
//                        dingdan.setDianhua(req.getDianhua());
//                        dingdan.setBeizhu(req.getBeizhu());
//                        dingdan.setDizhi(req.getDizhi());
//                        dingdan.setFahuoshenhe(req.getFahuoshenhe());
//                        dingdan.setZhifushenhe(req.getZhifushenhe());
//                        dingdan.setXingming(req.getXingming());
//                        dingdan.setShijian(req.getShijian());

                        if(dingdanList.containsKey(shangjia)){
                            Integer jine=dingdanList.get(shangjia).getJine();
                            dingdan.setJine(jine+(shangpin.getJiage()*info.getGoumaishuliang()));
                        }else {
                            dingdan.setJine(shangpin.getJiage()*info.getGoumaishuliang());
                        }
                        dingdan.setShangjia(shangpin.getUsersid().toString());
                        dingdanList.put(shangpin.getUsersid(),dingdan);

                        Dingdanxiang dingdanxiang=new Dingdanxiang();
                        dingdanxiang.setShangpinid(shangpinid);
                        dingdanxiang.setGoumaishuliang(goumaishuliang);
                        dingdanxiang.setUsersid(users.getId());
                        dingdanxiang.setDingdanid(shangjia);
                        dingdanxiangList.put(shangpinid,dingdanxiang);



                    } else {
                        return ApiResponse.failed("购物车里的商品不存在！");
                    }
                }
            }
        } else {
            return ApiResponse.failed("请登陆后再操作！");
        }



        //保存订单项数据
        for (Dingdan dingdan:dingdanList.values()) {
            int result = dingdanService.saveOrUpdate(dingdan);
            for(Dingdanxiang dingdanxiang:dingdanxiangList.values()){
                if(dingdanxiang.getDingdanid()==cn.hutool.core.convert.Convert.toInt(dingdan.getShangjia())){
                    dingdanxiang.setDingdanid(result);
                    dingdanxiangService.saveOrUpdate(dingdanxiang);
                }
            }
        }

        Integer dingdanCount=dingdanList.size();
        if(dingdanCount>1){
            message="由于您购买的商品由"+dingdanCount+"位商家提供，系统自动为您拆分成"+dingdanCount+"个订单，请记得及时分别支付哟！";
        }


        //更新商品表数据以及删除购物车数据
        for (Gouwuche info : gouwucheList) {
            Integer shangpinid = info.getShangpinid();
            Integer goumaishuliang = info.getGoumaishuliang();

            //更新商品表数据
            Shangpin shangpin = shangpinService.findById(shangpinid);
            Integer kucunshuliang = shangpin.getKucunshuliang();
            Integer xiaoshoushuliang = shangpin.getXiaoshoushuliang();
            shangpin.setKucunshuliang(kucunshuliang - goumaishuliang);
            shangpin.setXiaoshoushuliang(xiaoshoushuliang + goumaishuliang);
            shangpinService.saveOrUpdate(shangpin);

            //删除购物车数据
            gouwucheService.deleteById(info.getId());
        }


        return ApiResponse.success(message,1);
    }

    //订单修改单独一个字段接口
    @PostMapping("/dingdanSet")
    @ResponseBody
    public ApiResponse<Integer> dingdanSet(Dingdan req){
        int result = dingdanService.saveOrUpdate(req);
        return ApiResponse.success(result);
    }



    //订单删除接口
    @RequestMapping("/dingdanDel/{id}")
    @ResponseBody
    public ApiResponse<Integer> dingdanDel(@PathVariable Integer id){
        int result = dingdanService.deleteById(id);
        return ApiResponse.success(result);
    }

    //后台-订单修改页
    @RequestMapping("/dingdanGet/{id}")
    @ResponseBody
    public ModelAndView dingdanGet(@PathVariable Integer id){
        ModelAndView mav = new ModelAndView("dingdanSet");
        Dingdan info = dingdanService.findById(id);
        mav.addObject("dingdan", info);
        return mav;
    }



    //后台-我的订单查看页面
    @RequestMapping("/dingdanChakanMy")
    public ModelAndView dingdanChakanMy(Dingdan req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo, HttpSession session){
        ModelAndView mav = new ModelAndView("dingdanChakanMy");
        Users users = (Users)session.getAttribute("user");
        if(null!=users) {
            req.setUsersid(users.getId());
            return getModelAndView(req, pageNo, mav, "id");
        }
        return mav;
    }

    //后台-我的订单管理列表页面
    @RequestMapping("/dingdanManaMy")
    public ModelAndView dingdanManaMy(Dingdan req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo, HttpSession session){
        ModelAndView mav = new ModelAndView("dingdanManaMy");
        Users users = (Users)session.getAttribute("user");
        if(null!=users) {
            req.setShangjia(users.getId().toString());
            return getModelAndView(req, pageNo, mav, "id");
        }
        return mav;
    }

    //前台-我的订单管理列表页面
    @RequestMapping("/dingdanManaMyQian")
    public ModelAndView dingdanManaMyQian(Dingdan req, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo, HttpSession session){
        ModelAndView mav = new ModelAndView("dingdanManaMyQian");
        Users users = (Users)session.getAttribute("user");
        if(null!=users) {
            req.setUsersid(users.getId());
            return getModelAndView(req, pageNo, mav, "id");
        }
        return mav;
    }


    //前台-付款方式添加订单页面
    @GetMapping("/fukuanfangshidingdanAddQian/{fukuanfangshiid}")
    @ResponseBody
    public ModelAndView fukuanfangshidingdanAddQian(@PathVariable Integer fukuanfangshiid){
        ModelAndView mav = getFukuanfangshiDingdanAddModelAndView(fukuanfangshiid,"fukuanfangshidingdanAddQian");
        return mav;
    }

    //后台-付款方式添加订单页面
    @GetMapping("/fukuanfangshidingdanAdd/{fukuanfangshiid}")
    @ResponseBody
    public ModelAndView fukuanfangshidingdanAdd(@PathVariable Integer fukuanfangshiid){
        ModelAndView mav = getFukuanfangshiDingdanAddModelAndView(fukuanfangshiid,"fukuanfangshidingdanAdd");
        return mav;
    }

    //后台-付款方式订单查看页面
    @RequestMapping("/fukuanfangshidingdanGetByfukuanfangshiid/{fukuanfangshiid}")
    @ResponseBody
    public ModelAndView fukuanfangshidingdanGetByfukuanfangshiid(Dingdan req, @PathVariable Integer fukuanfangshiid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("fukuanfangshidingdanChakan");
        req.setFukuanfangshiid(fukuanfangshiid);
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-付款方式订单查看页面
    @RequestMapping("/fukuanfangshidingdanGetByfukuanfangshiidQian/{fukuanfangshiid}")
    @ResponseBody
    public ModelAndView fukuanfangshidingdanGetByfukuanfangshiidQian(Dingdan req, @PathVariable Integer fukuanfangshiid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("dingdanManaQian");
            mav.addObject("actionName","dingdanManaQian");
        req.setFukuanfangshiid(fukuanfangshiid);
        return getModelAndView(req, pageNo, mav, "id");
    }


    //付款方式订单数据封装
    private ModelAndView getFukuanfangshiDingdanAddModelAndView(Integer fukuanfangshiid, String viewName) {
        ModelAndView mav = new ModelAndView(viewName);
        Fukuanfangshi fukuanfangshi=fukuanfangshiService.findById(fukuanfangshiid);
        mav.addObject("fukuanfangshi", fukuanfangshi);
        List<Users> usersList=usersService.findAll();
        mav.addObject("usersList", usersList);

        return mav;
    }
    //前台-用户添加订单页面
    @GetMapping("/usersdingdanAddQian/{usersid}")
    @ResponseBody
    public ModelAndView usersdingdanAddQian(@PathVariable Integer usersid){
        ModelAndView mav = getUsersDingdanAddModelAndView(usersid,"usersdingdanAddQian");
        return mav;
    }

    //后台-用户添加订单页面
    @GetMapping("/usersdingdanAdd/{usersid}")
    @ResponseBody
    public ModelAndView usersdingdanAdd(@PathVariable Integer usersid){
        ModelAndView mav = getUsersDingdanAddModelAndView(usersid,"usersdingdanAdd");
        return mav;
    }

    //后台-用户订单查看页面
    @RequestMapping("/usersdingdanGetByusersid/{usersid}")
    @ResponseBody
    public ModelAndView usersdingdanGetByusersid(Dingdan req, @PathVariable Integer usersid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("usersdingdanChakan");
        req.setUsersid(usersid);
        return getModelAndView(req, pageNo, mav, "id");
    }

    //前台-用户订单查看页面
    @RequestMapping("/usersdingdanGetByusersidQian/{usersid}")
    @ResponseBody
    public ModelAndView usersdingdanGetByusersidQian(Dingdan req, @PathVariable Integer usersid, @RequestParam(defaultValue = "1",value = "pageNo")int pageNo){
        ModelAndView mav = new ModelAndView("dingdanManaQian");
            mav.addObject("actionName","dingdanManaQian");
        req.setUsersid(usersid);
        return getModelAndView(req, pageNo, mav, "id");
    }


    //用户订单数据封装
    private ModelAndView getUsersDingdanAddModelAndView(Integer usersid, String viewName) {
        ModelAndView mav = new ModelAndView(viewName);
        Users users=usersService.findById(usersid);
        mav.addObject("users", users);
        List<Fukuanfangshi> fukuanfangshiList=fukuanfangshiService.findAll();
        mav.addObject("fukuanfangshiList", fukuanfangshiList);

        return mav;
    }



    //订单模糊匹配查询分页数据封装
    private ModelAndView getModelAndView(Dingdan req, int pageNo, ModelAndView mav, String sortProperty) {
        PageWrap<Dingdan> pageWrap=new PageWrap<Dingdan>();
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
        PageData<Dingdan> pageInfo= dingdanService.findPage(pageWrap);
        mav.addObject("pageInfo", pageInfo);

        //计算订单总金额
        Integer totalAmount = 0;
        List<Dingdan> dingdanList = dingdanService.find(req);
        for (Dingdan dingdan : dingdanList) {
                totalAmount += dingdan.getJine();
        }
        mav.addObject("totalAmount", totalAmount);

        mav.addObject("req", req);
        List<Fukuanfangshi> fukuanfangshiList=fukuanfangshiService.findAll();
        mav.addObject("fukuanfangshiList", fukuanfangshiList);
        List<Users> usersList=usersService.findAll();
        mav.addObject("usersList", usersList);

        return mav;
    }

    //订单完全匹配查询分页数据封装
    private ModelAndView getModelAndViewByEqualTo(Dingdan req, int pageNo, ModelAndView mav, String sortProperty) {
        PageWrap<Dingdan> pageWrap=new PageWrap<Dingdan>();
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
        PageData<Dingdan> pageInfo= dingdanService.findPageByEqualTo(pageWrap);
        mav.addObject("pageInfo", pageInfo);

        //计算订单总金额
        Integer totalAmount = 0;
        List<Dingdan> dingdanList = dingdanService.find(req);
        for (Dingdan dingdan : dingdanList) {
                totalAmount += dingdan.getJine();
        }
        mav.addObject("totalAmount", totalAmount);

        mav.addObject("req", req);
        List<Fukuanfangshi> fukuanfangshiList=fukuanfangshiService.findAll();
        mav.addObject("fukuanfangshiList", fukuanfangshiList);
        List<Users> usersList=usersService.findAll();
        mav.addObject("usersList", usersList);

        return mav;
        }
}
