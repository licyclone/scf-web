package com.topwork.javadev.modules.sys.dao;

import com.topwork.javadev.common.persistence.TreeDao;
import com.topwork.javadev.common.persistence.annotation.MyBatisDao;
import com.topwork.javadev.modules.sys.entity.Office;

/**
 * 机构DAO接口
 * @version 2014-05-16
 */
@MyBatisDao
public interface OfficeDao extends TreeDao<Office> {
	
}
