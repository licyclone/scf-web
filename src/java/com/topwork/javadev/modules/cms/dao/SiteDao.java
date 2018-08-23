package com.topwork.javadev.modules.cms.dao;

import com.topwork.javadev.common.persistence.CrudDao;
import com.topwork.javadev.common.persistence.annotation.MyBatisDao;
import com.topwork.javadev.modules.cms.entity.Site;

/**
 * 站点DAO接口
 * @version 2013-8-23
 */
@MyBatisDao
public interface SiteDao extends CrudDao<Site> {

}
