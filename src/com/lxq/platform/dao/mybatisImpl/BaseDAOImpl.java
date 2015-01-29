package com.lxq.platform.dao.mybatisImpl;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lxq.platform.dao.interf.IBaseDAO;
import com.lxq.platform.pto.SQLAdapter;

/**
 * 通用DAO实现
 * @author lixueqing
 *
 */
public class BaseDAOImpl implements IBaseDAO {
	
	private SqlSession sqlSessionTemplate;
	
	public SqlSession getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSession sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public void save(Object entity) {
		
		sqlSessionTemplate.insert(entity.getClass().getName()+"Mapper.insert",entity);
	}
	
	public void delete(Object entity) {
		
		sqlSessionTemplate.delete(entity.getClass().getName()+"Mapper.delete",entity);
	}
	
	public void update(Object entity) {
		
		sqlSessionTemplate.update(entity.getClass().getName()+"Mapper.update",entity);
	}
	
	public void saveOrUpdate(Object entity){
		
		if(sqlSessionTemplate.selectOne(entity.getClass().getName()+"Mapper.findById",entity) != null){
			sqlSessionTemplate.update(entity.getClass().getName()+"Mapper.update",entity);
		}else{
			sqlSessionTemplate.insert(entity.getClass().getName()+"Mapper.insert",entity);
		}
			
	}
	
	public Object findById(Class<?> c , Serializable id) {
		
		return sqlSessionTemplate.selectOne(c.getName()+"Mapper.findById", id);
	}

	public List<?> findBySql(Class<?> c , String sql) {
		SQLAdapter sqlAdapter = new SQLAdapter();
		sqlAdapter.setSql(sql);
		
		if(c == null){
			return sqlSessionTemplate.selectList("com.lxq.platform.pojo.CommonMapper.findMapBySql",sqlAdapter);
		} else{
			return sqlSessionTemplate.selectList(c.getName()+"Mapper.findBySql",sqlAdapter);
		}
	}
	
	public List<?> findBySql(Class<?> c , final String sql,final int firstResult,final int maxResults){
		
		String sql2 = sql + " limit "+firstResult+","+maxResults;
		
		SQLAdapter adapter = new SQLAdapter();
		adapter.setSql(sql2);
		
		return findBySql(c,sql2);
	}	
	
    public void execute(String sql){
		SQLAdapter sqlAdapter = new SQLAdapter();
		sqlAdapter.setSql(sql);
		
		sqlSessionTemplate.update("com.lxq.platform.pojo.CommonMapper.executeUpdate",sqlAdapter);
	}
	
	public int getCount(String sql) {
		SQLAdapter sqlAdapter = new SQLAdapter();
		sqlAdapter.setSql(sql);
		
		return (Integer)sqlSessionTemplate.selectOne("com.lxq.platform.pojo.CommonMapper.getCount",sqlAdapter);
	}

	public Object findUniqueBySql(Class<?> c , String sql) {
		SQLAdapter sqlAdapter = new SQLAdapter();
		sqlAdapter.setSql(sql);
		
		if(c == null){
			return sqlSessionTemplate.selectOne("com.lxq.platform.pojo.CommonMapper.findUniqueBySql",sqlAdapter);
		} else{
			return sqlSessionTemplate.selectOne(c.getName()+"Mapper.findBySql",sqlAdapter);
		}
	}
}