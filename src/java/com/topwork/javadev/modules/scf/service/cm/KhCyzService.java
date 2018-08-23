package com.topwork.javadev.modules.scf.service.cm;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.topwork.javadev.common.persistence.Page;
import com.topwork.javadev.common.service.CrudService;
import com.topwork.javadev.modules.scf.entity.cm.KhCyz;
import com.topwork.javadev.modules.scf.dao.cm.KhCyzDao;

/**
 * 客户信息列表Service
 * @author 客户信息列表
 * @version 2018-08-21
 */
@Service
@Transactional(readOnly = true)
public class KhCyzService extends CrudService<KhCyzDao, KhCyz> {

	public KhCyz get(String id) {
		return super.get(id);
	}
	
	public List<KhCyz> findList(KhCyz khCyz) {
		return super.findList(khCyz);
	}
	
	public Page<KhCyz> findPage(Page<KhCyz> page, KhCyz khCyz) {
		return super.findPage(page, khCyz);
	}
	
	@Transactional(readOnly = false)
	public void save(KhCyz khCyz) {
		super.save(khCyz);
	}
	
	@Transactional(readOnly = false)
	public void delete(KhCyz khCyz) {
		super.delete(khCyz);
	}
	
}