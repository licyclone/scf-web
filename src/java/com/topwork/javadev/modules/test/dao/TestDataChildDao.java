package com.topwork.javadev.modules.test.dao;

import com.topwork.javadev.common.persistence.CrudDao;
import com.topwork.javadev.common.persistence.annotation.MyBatisDao;
import com.topwork.javadev.modules.test.entity.TestDataChild;

/**
 * 主子表生成DAO接口
 * @author licyclone
 * @version 2018-08-21
 */
@MyBatisDao
public interface TestDataChildDao extends CrudDao<TestDataChild> {
	
}