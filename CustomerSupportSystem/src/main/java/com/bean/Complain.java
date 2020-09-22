package com.bean;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;

@Entity
@Table(name = "Complain")
public class Complain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long cmid;
	private String cdate;
	private String comptype;;
	private String compdesc;
	private String cmemail;
	private String remarks;
	@ManyToOne
	@JoinColumn(name = "cid")
	private Customer customer;
	
	
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	
	
	/*
	 * @OneToOne
	 * 
	 * @JoinColumn(name = "cid") private Customer customer;
	 */
	public Long getCmid() {
		return cmid;
	}

	public void setCmid(Long cmid) {
		this.cmid = cmid;
	}

	

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public String getComptype() {
		return comptype;
	}

	public void setComptype(String comptype) {
		this.comptype = comptype;
	}

	public String getCompdesc() {
		return compdesc;
	}

	public void setCompdesc(String compdesc) {
		this.compdesc = compdesc;
	}

	/*
	 * public Customer getCustomer() { return customer; }
	 * 
	 * public void setCustomer(Customer customer) { this.customer = customer; }
	 */
	public String getCmemail() {
		return cmemail;
	}

	public void setCmemail(String cmemail) {
		this.cmemail = cmemail;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	
	
}
