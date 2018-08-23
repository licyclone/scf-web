package com.topwork.javadev.modules.scf.entity.cm;

import org.hibernate.validator.constraints.Length;

import com.topwork.javadev.common.persistence.DataEntity;

/**
 * 客户信息列表Entity
 * @author 客户信息列表
 * @version 2018-08-21
 */
public class KhCyz extends DataEntity<KhCyz> {
	
	private static final long serialVersionUID = 1L;
	private String khbh;		// 客户编号
	private String khmc;		// 客户名称
	private String khlx;		// 客户类型
	private String zjlx;		// 证件类型
	private String zjhm;		// 证件号码
	private String bz;		// 备注
	private String zt;		// 状态
	private String createTime;		// 创建时间
	private String updateTime;		// 修改时间
	
	public KhCyz() {
		super();
	}

	public KhCyz(String id){
		super(id);
	}

	@Length(min=1, max=64, message="客户编号长度必须介于 1 和 64 之间")
	public String getKhbh() {
		return khbh;
	}

	public void setKhbh(String khbh) {
		this.khbh = khbh;
	}
	
	@Length(min=1, max=100, message="客户名称长度必须介于 1 和 100 之间")
	public String getKhmc() {
		return khmc;
	}

	public void setKhmc(String khmc) {
		this.khmc = khmc;
	}
	
	@Length(min=1, max=12, message="客户类型长度必须介于 1 和 12 之间")
	public String getKhlx() {
		return khlx;
	}

	public void setKhlx(String khlx) {
		this.khlx = khlx;
	}
	
	@Length(min=1, max=12, message="证件类型长度必须介于 1 和 12 之间")
	public String getZjlx() {
		return zjlx;
	}

	public void setZjlx(String zjlx) {
		this.zjlx = zjlx;
	}
	
	@Length(min=1, max=100, message="证件号码长度必须介于 1 和 100 之间")
	public String getZjhm() {
		return zjhm;
	}

	public void setZjhm(String zjhm) {
		this.zjhm = zjhm;
	}
	
	@Length(min=0, max=1024, message="备注长度必须介于 0 和 1024 之间")
	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}
	
	@Length(min=0, max=12, message="状态长度必须介于 0 和 12 之间")
	public String getZt() {
		return zt;
	}

	public void setZt(String zt) {
		this.zt = zt;
	}
	
	@Length(min=0, max=32, message="创建时间长度必须介于 0 和 32 之间")
	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
	@Length(min=0, max=32, message="修改时间长度必须介于 0 和 32 之间")
	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	
}