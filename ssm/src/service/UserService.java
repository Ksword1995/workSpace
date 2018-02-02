package service;

import java.util.List;

import entity.User;
import exception.DuplicalUsernameException;

public interface UserService {
	
	public User findByUsernameAndPasswrod(User user);
	
	public Boolean findByUserId(String userId);
	
	public String findId(String userId);
	
	public User showModify(String userId);
	
	public void addUser(User user);
	
	public List<User> findAll();
	
	public String valPriv(String userId);
	
	public User valModify(String userId);
	
	public void modifyUser(User user);
	
	public void modifyUserRole(User user);
	
	public void removeUser(String id);
	
	
}
