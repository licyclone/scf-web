package com.topwork.javadev.modules.cms.dao;

import com.topwork.javadev.common.persistence.CrudDao;
import com.topwork.javadev.common.persistence.annotation.MyBatisDao;
import com.topwork.javadev.modules.cms.entity.Guestbook;

/**
 * 留言DAO接口
 * @version 2013-8-23
 */
@MyBatisDao
public interface GuestbookDao extends CrudDao<Guestbook> {

}
