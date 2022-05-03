package dao;

import java.util.List;

public interface DAO<T> {
	
	public List<T> selectAll(); //選取全部，回傳List<物件>
	
	public T selectOne(int id); //依id選取，回傳物件

	public boolean insert(T t); //更新Data，回傳的boolean讓controller可以接收執行成功與否的資訊
	
	public boolean update(T t); //更新Data，回傳的boolean讓controller可以接收執行成功與否的資訊
	
	public boolean delete(int id); //刪除Data，回傳的boolean讓controller可以接收執行成功與否的資訊
	
}
