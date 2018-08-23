package com.topwork.javadev.modules.scf.web.cm;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.topwork.javadev.common.config.Global;
import com.topwork.javadev.common.persistence.Page;
import com.topwork.javadev.common.web.BaseController;
import com.topwork.javadev.common.utils.StringUtils;
import com.topwork.javadev.modules.scf.entity.cm.KhCyz;
import com.topwork.javadev.modules.scf.service.cm.KhCyzService;

/**
 * 客户信息列表Controller
 * @author 客户信息列表
 * @version 2018-08-21
 */
@Controller
@RequestMapping(value = "${adminPath}/scf/cm/khCyz")
public class KhCyzController extends BaseController {

	@Autowired
	private KhCyzService khCyzService;
	
	@ModelAttribute
	public KhCyz get(@RequestParam(required=false) String id) {
		KhCyz entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = khCyzService.get(id);
		}
		if (entity == null){
			entity = new KhCyz();
		}
		return entity;
	}
	
	@RequiresPermissions("scf:cm:khCyz:view")
	@RequestMapping(value = {"list", ""})
	public String list(KhCyz khCyz, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<KhCyz> page = khCyzService.findPage(new Page<KhCyz>(request, response), khCyz); 
		model.addAttribute("page", page);
		return "modules/scf/cm/khCyzList";
	}

	@RequiresPermissions("scf:cm:khCyz:view")
	@RequestMapping(value = "form")
	public String form(KhCyz khCyz, Model model) {
		model.addAttribute("khCyz", khCyz);
		return "modules/scf/cm/khCyzForm";
	}

	@RequiresPermissions("scf:cm:khCyz:edit")
	@RequestMapping(value = "save")
	public String save(KhCyz khCyz, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, khCyz)){
			return form(khCyz, model);
		}
		khCyzService.save(khCyz);
		addMessage(redirectAttributes, "保存客户信息列表成功");
		return "redirect:"+Global.getAdminPath()+"/scf/cm/khCyz/?repage";
	}
	
	@RequiresPermissions("scf:cm:khCyz:edit")
	@RequestMapping(value = "delete")
	public String delete(KhCyz khCyz, RedirectAttributes redirectAttributes) {
		khCyzService.delete(khCyz);
		addMessage(redirectAttributes, "删除客户信息列表成功");
		return "redirect:"+Global.getAdminPath()+"/scf/cm/khCyz/?repage";
	}

}