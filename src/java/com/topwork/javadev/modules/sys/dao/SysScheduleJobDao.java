package com.topwork.javadev.modules.sys.dao;

import com.topwork.javadev.common.persistence.CrudDao;
import com.topwork.javadev.common.persistence.annotation.MyBatisDao;
import com.topwork.javadev.modules.sys.entity.SysScheduleJob;

/**
 * 定时任务DAO接口
 * @version 2016-11-24
 */
@MyBatisDao
public interface SysScheduleJobDao extends CrudDao<SysScheduleJob> {
	
}