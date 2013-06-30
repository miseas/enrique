/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.sigepro.web.dao.impl;

import java.util.HashMap;
import java.util.Map;

import com.sigepro.web.dao.DAO;

/**
 * TODO comment<br>
 * <br>
 * <b>Change log:</b>
 * <ul>
 * <li>1.0 20/02/2013 - Xpost - initial version</li>
 * </ul>
 * 
 * @author Xpost
 * @version 1.0
 */
public class DAOLocator {

    private static DAOLocator instance;
    private Map<String, ? extends DAO> daos;

    public synchronized static DAOLocator getInstance() {
        if (instance == null) {
            instance = new DAOLocator();
        }
        return instance;
    }

    /**
     * TODO comment<br>
     * <br>
     * <b>Change log:</b>
     * <ul>
     * <li>1.0 04/12/2011 - TODO "insert username" (Xpost) - initial version</li>
     * </ul>
     * 
     * @param daos
     * @since TODO "insert version"
     */
    @SuppressWarnings("unchecked")
    public static void addDaos(Map daos) {
        if (getInstance().getDaos() == null) {
            getInstance().setDaos(new HashMap<String, DAO>());
        }
        getInstance().getDaos().putAll(daos);
    }

    public void setDaos(Map<String, ? extends DAO> daos) {
        this.daos = daos;
    }

    public Map<String, ? extends DAO> getDaos() {
        return daos;
    }

    /**
     * TODO comment<br>
     * <br>
     * <b>Change log:</b>
     * <ul>
     * <li>1.0 04/12/2011 - TODO "insert username" (Xpost) - initial version</li>
     * </ul>
     * 
     * @param <T>
     * @param key
     * @return
     * @since TODO "insert version"
     */
    public <T extends DAO> T lookup(String key) {
        if (!daos.containsKey(key)) {
            throw new RuntimeException(key);
        }
        return (T) daos.get(key);
    }

}
