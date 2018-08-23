package com.topwork.javadev.modules.test.dao;

import com.topwork.javadev.common.persistence.CrudDao;
import com.topwork.javadev.common.persistence.annotation.MyBatisDao;
import com.topwork.javadev.modules.test.entity.TestData;

/**
 * 单表生成DAO接口
 * @author ThinkGem
 * @version 2018-08-21
 */
@MyBatisDao
public interface TestDataDao extends CrudDao<TestData> {
	
}