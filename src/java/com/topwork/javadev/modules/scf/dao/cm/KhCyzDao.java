package com.topwork.javadev.modules.scf.dao.cm;

import com.topwork.javadev.common.persistence.CrudDao;
import com.topwork.javadev.common.persistence.annotation.MyBatisDao;
import com.topwork.javadev.modules.scf.entity.cm.KhCyz;

/**
 * 客户信息列表DAO接口
 * @author 客户信息列表
 * @version 2018-08-21
 */
@MyBatisDao
public interface KhCyzDao extends CrudDao<KhCyz> {
	
}