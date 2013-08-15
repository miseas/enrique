/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.sigepro.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * TODO comment<br>
 * <br>
 * <b>Change log:</b>
 * <ul>
 * <li>1.0 20/05/2013 - Xpost - initial version</li>
 * </ul>
 * 
 * @author Xpost
 * @version 1.0
 */
@Controller
public class NavigationController {

	Logger LOG = LoggerFactory.getLogger(NavigationController.class);

    @Autowired
//    AlertService alertService;

    @RequestMapping(value = "/login")
    public ModelAndView loadLoginPage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("index");
        return model;
    }
 
    @RequestMapping(value = "/addClient")
    public ModelAndView loadAddClientPage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("addClient");
        return model;
    }
    
    @RequestMapping(value = "/listClient")
    public ModelAndView loadlistClientPage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("listClient");
        return model;
    }

    @RequestMapping(value = "/addAbono")
    public ModelAndView loadAddAbonoPage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("addAbono");
        return model;
    }
    
    @RequestMapping(value = "/listAbonos")
    public ModelAndView loadListAbonosPage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("listAbonos");
        return model;
    }
    
    @RequestMapping(value = "/assignClientAbono")
    public ModelAndView loadLassignClientAbonoPage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("assignClientAbono");
        return model;
    }
    
//    @RequestMapping(value = "/alerts")
//    public ModelAndView loadAlertsPage() {
//        System.out.println("NavigationController.loadAlertsPage()");
//        ModelAndView model = new ModelAndView();
//        model.addObject("disableAlert", !alertService.getStateAlerts());
//        model.setViewName("alerts");
//        return model;
//    }

    @RequestMapping(value = "/dummy")
    public @ResponseBody
    String dummyEditTable() {
        return "{value:true}";
    }

    @RequestMapping(value = "/help")
    public ModelAndView loadHelpPage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("help");
        return model;
    }

    @RequestMapping(value = "/help1")
    public ModelAndView loadHelp1Page() {
        ModelAndView model = new ModelAndView();
        model.setViewName("help1");
        return model;
    }


    @RequestMapping(value = "/contact")
    public ModelAndView loadContactPage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("contact");
        return model;
    }




}
