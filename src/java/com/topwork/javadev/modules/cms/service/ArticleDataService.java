package com.topwork.javadev.modules.cms.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.topwork.javadev.common.service.CrudService;
import com.topwork.javadev.modules.cms.dao.ArticleDataDao;
import com.topwork.javadev.modules.cms.entity.ArticleData;

/**
 * 站点Service
 * @version 2013-01-15
 */
@Service
@Transactional(readOnly = true)
public class ArticleDataService extends CrudService<ArticleDataDao, ArticleData> {

}
