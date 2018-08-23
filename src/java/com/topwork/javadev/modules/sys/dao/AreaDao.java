package com.topwork.javadev.modules.sys.dao;

import com.topwork.javadev.common.persistence.TreeDao;
import com.topwork.javadev.common.persistence.annotation.MyBatisDao;
import com.topwork.javadev.modules.sys.entity.Area;

/**
 * 区域DAO接口
 * @version 2014-05-16
 */
@MyBatisDao
public interface AreaDao extends TreeDao<Area> {
	
}
