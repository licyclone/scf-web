package com.topwork.javadev.modules.oa.dao;

import com.topwork.javadev.common.persistence.CrudDao;
import com.topwork.javadev.common.persistence.annotation.MyBatisDao;
import com.topwork.javadev.modules.oa.entity.OaNotify;

/**
 * 通知通告DAO接口
 * @version 2014-05-16
 */
@MyBatisDao
public interface OaNotifyDao extends CrudDao<OaNotify> {
	
	/**
	 * 获取通知数目
	 * @param oaNotify
	 * @return
	 */
	public Long findCount(OaNotify oaNotify);
	
}