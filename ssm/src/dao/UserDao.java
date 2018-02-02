package dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import entity.User;


public interface UserDao {
	
	public User selectByUsernameAndPassword(User user);
	
	public User selectByUserId(String userId);
	
	public User selectByUserId2(String userId);
	
	public String selectFromUser(String userId);
	
	public User selectUser(String userId);
	
	public String selectCreateRole(String userId);
	
	public void insertIntoUser(User user);
	
	public void insertIntoRole(User user);
	
	public List<User> selectAll();
	
	public void deleteUser(String userId);
	
	public void deleteUserRole(String userId);
	
	public void updateUser(User user);
	
	public void updateUserRole(User user);
	
	
	
	
}
