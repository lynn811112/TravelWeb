package dao;

import java.util.List;

public interface DAO<T> {
	
	public List<T> getAll();
	
	public T getOne(int id);

	public boolean insert(T t);
	
	public boolean update(T t);
	
	public boolean delete(int id);
	
}
