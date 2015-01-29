package com.lxq.platform.dao.interf;

import java.io.Serializable;
import java.util.List;

/**
 * 通用DAO接口
 * @author lixueqing
 *
 */
public interface IBaseDAO {
	
	/**
	 * 保存实体对象
	 * @param o 实体对象
	 */
	public void save(Object entity);

	/**
	 * 删除实体对象
	 * @param o 实体对象
	 */
	public void delete(Object entity);
	
	/**
	 * 更新实体对象
	 * @param o 实体对象
	 */
	public void update(Object entity);
	
	/**
	 * 保存或更新实体对象
	 * @param o 实体对象
	 */
	public void saveOrUpdate(Object entity);

	/**
	 * 根据主键查找实体对象
	 * @param c 实体类
	 * @param id 实体类的主键
	 */
	public Object findById(Class<?> c,Serializable id);
	
	
	/**
	 * 根据Sql语句查找结果集
	 * @param Sql 查询语句
	 */
	public List<?> findBySql(Class<?> c , String sql);
	
	/**
	 * 根据Sql语句，和分页参数，查找结果集
	 * @param Sql 查询语句
	 */
	public List<?> findBySql(Class<?> c , String sql,int firstResult,int maxResults);

	public void execute(String sql);
	
	/**
	 * 根据Sql语句，获取结果集大小
	 * @param Sql 查询语句
	 */
	public int getCount(String sql);
	
	/**
	 * 执行Sql语句,获得唯一值
	 * @param Sql 执行语句
	 */
	public Object findUniqueBySql(Class<?> c , String sql);
	
}