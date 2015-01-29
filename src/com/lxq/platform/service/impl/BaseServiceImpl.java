package com.lxq.platform.service.impl;

import java.io.Serializable;
import java.util.List;

import net.sf.json.JSONObject;

import com.lxq.platform.dao.interf.IBaseDAO;
import com.lxq.platform.exception.PrivilegeException;
import com.lxq.platform.service.intef.IBaseService;

public class BaseServiceImpl implements IBaseService {

	protected IBaseDAO baseDAO;

	public IBaseDAO getBaseDAO() {
		return baseDAO;
	}

	public void setBaseDAO(IBaseDAO baseDAO) {
		this.baseDAO = baseDAO;
	}

	public List<?> findBySql(Class<?> c , String sql) {
		return baseDAO.findBySql(c,sql);
	}

	public List<?> findBySql(Class<?> c ,String sql, int firstResult, int maxResults) {
		return baseDAO.findBySql(c,sql, firstResult, maxResults);
	}

	public Object findByObject(Class<?> c, JSONObject jb) {
		return baseDAO.findById(c, jb.getInt("uid"));
	}
	
	public Object findById(Class<?> c, Serializable id) {
		return baseDAO.findById(c, id);
	}

	public Object findUniqueBySql(Class<?> c , String sql) {
		return baseDAO.findUniqueBySql(c,sql);
	}

	public int getCount(String sql) {
		return baseDAO.getCount(sql);
	}

	public void delete(Object entity, String message) throws PrivilegeException{
		baseDAO.delete(entity);
	}

	public void delete(Object entity)  throws PrivilegeException{
		baseDAO.delete(entity);
	}

	public void add(Object entity, String message) throws PrivilegeException{
		baseDAO.saveOrUpdate(entity);
	}

	public void add(Object entity) throws PrivilegeException{
		baseDAO.saveOrUpdate(entity);
	}

	public void update(Object entity,String message) throws PrivilegeException{
		baseDAO.saveOrUpdate(entity);
	}

	public void update(Object entity)  throws PrivilegeException{
		baseDAO.saveOrUpdate(entity);
	}
}
