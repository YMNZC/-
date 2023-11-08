package com.controller;

import com.entity.*;
import com.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @ClassName IndexController
 * @Description 首页控制层
 */
@Controller
public class IndexController extends BaseController {

    @Autowired
    private DingdanService dingdanService;
    @Autowired
    private DingdanxiangService dingdanxiangService;
    @Autowired
    private DxService dxService;
    @Autowired
    private FukuanfangshiService fukuanfangshiService;
    @Autowired
    private GonggaoService gonggaoService;
    @Autowired
    private GouwucheService gouwucheService;
    @Autowired
    private LianjieService lianjieService;
    @Autowired
    private LiuyanService liuyanService;
    @Autowired
    private LunboService lunboService;
    @Autowired
    private PingjiaService pingjiaService;
    @Autowired
    private PinpaiService pinpaiService;
    @Autowired
    private ShangpinService shangpinService;
    @Autowired
    private ShoucangService shoucangService;
    @Autowired
    private UsersService usersService;
    @Autowired
    private ZhongleiService zhongleiService;


    //首页
    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("index");
        //取出所有业务表数据存储到session里方便前端页面随意调用
        HttpSession session = request.getSession();

        //订单表dingdan
        List<Dingdan> dingdanList = dingdanService.findAll();
        session.setAttribute("dingdanList", dingdanList);
        session.setAttribute("dingdanListSize", dingdanList.size());
        //订单项表dingdanxiang
        List<Dingdanxiang> dingdanxiangList = dingdanxiangService.findAll();
        session.setAttribute("dingdanxiangList", dingdanxiangList);
        session.setAttribute("dingdanxiangListSize", dingdanxiangList.size());
        //信息介绍表dx
        List<Dx> dxList = dxService.findAll();
        session.setAttribute("dxList", dxList);
        session.setAttribute("dxListSize", dxList.size());
        //付款方式表fukuanfangshi
        List<Fukuanfangshi> fukuanfangshiList = fukuanfangshiService.findAll();
        session.setAttribute("fukuanfangshiList", fukuanfangshiList);
        session.setAttribute("fukuanfangshiListSize", fukuanfangshiList.size());
        //公告表gonggao
        List<Gonggao> gonggaoList = gonggaoService.findAll();
        session.setAttribute("gonggaoList", gonggaoList);
        session.setAttribute("gonggaoListSize", gonggaoList.size());
        //购物车表gouwuche
        List<Gouwuche> gouwucheList = gouwucheService.findAll();
        session.setAttribute("gouwucheList", gouwucheList);
        session.setAttribute("gouwucheListSize", gouwucheList.size());
        //友情链接表lianjie
        List<Lianjie> lianjieList = lianjieService.findAll();
        session.setAttribute("lianjieList", lianjieList);
        session.setAttribute("lianjieListSize", lianjieList.size());
        //留言反馈表liuyan
        List<Liuyan> liuyanList = liuyanService.findAll();
        session.setAttribute("liuyanList", liuyanList);
        session.setAttribute("liuyanListSize", liuyanList.size());
        //轮播图表lunbo
        List<Lunbo> lunboList = lunboService.findAll();
        session.setAttribute("lunboList", lunboList);
        session.setAttribute("lunboListSize", lunboList.size());
        //商品评价表pingjia
        List<Pingjia> pingjiaList = pingjiaService.findAll();
        session.setAttribute("pingjiaList", pingjiaList);
        session.setAttribute("pingjiaListSize", pingjiaList.size());
        //品牌表pinpai
        List<Pinpai> pinpaiList = pinpaiService.findAll();
        session.setAttribute("pinpaiList", pinpaiList);
        session.setAttribute("pinpaiListSize", pinpaiList.size());
        //商品表shangpin
        List<Shangpin> shangpinList = shangpinService.findAll();
        session.setAttribute("shangpinList", shangpinList);
        session.setAttribute("shangpinListSize", shangpinList.size());
        //商品收藏表shoucang
        List<Shoucang> shoucangList = shoucangService.findAll();
        session.setAttribute("shoucangList", shoucangList);
        session.setAttribute("shoucangListSize", shoucangList.size());
        //用户表users
        List<Users> usersList = usersService.findAll();
        session.setAttribute("usersList", usersList);
        session.setAttribute("usersListSize", usersList.size());
        //分类表zhonglei
        List<Zhonglei> zhongleiList = zhongleiService.findAll();
        session.setAttribute("zhongleiList", zhongleiList);
        session.setAttribute("zhongleiListSize", zhongleiList.size());

        return mav;
    }
}
