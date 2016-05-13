package com.springapp.mvc;

import com.springapp.dao.*;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.SimpleDateFormat;

/**
 * Created by anc on 15/3/13.
 */
public class BaseController{
    /*
    @Autowired
    protected SignInfoDao signInfoDao;
    */
    public SimpleDateFormat simpleDateFormat;
    @Autowired
    protected RFIDDao rfidDao;

    @Autowired
    protected MaintainLogDao maintainLogDao;

    @Autowired
    protected eFenceDao eFenceDao;
    @Autowired
    protected LineDao lineDao;
    @Autowired
    protected PackageDao packageDao;
    @Autowired
    protected ParkDao parkDao;
    @Autowired
    protected PositionDao positionDao;
    @Autowired
    protected UserDao userDao;
    @Autowired
    protected VehicleDao vehicleDao;
    @Autowired
    protected RulesDao rulesDao;
    @Autowired
    protected MaintainProgressDao progressDao;
    @Autowired
    protected PowerDao powerDao;
    @Autowired
    protected VehiclePosDao vehiclePosDao;
    public BaseController(){
       simpleDateFormat =new SimpleDateFormat("yyyy-MM-dd");
    }
    /*@InitBinder
    protected void initBinder(HttpServletRequest request,
                              ServletRequestDataBinder binder) throws Exception {
        //对于需要转换为Date类型的属性，使用DateEditor进行处理
       // binder.registerCustomEditor(Date.class, new DateEditor());
    }*/

}
