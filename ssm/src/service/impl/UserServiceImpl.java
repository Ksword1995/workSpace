package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.UserDao;
import entity.User;
import exception.DuplicalUsernameException;
import service.UserService;


@Service
@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;

	public List<User> findAll() {
		return userDao.selectAll();
	}

	public User findByUsernameAndPasswrod(User user) {
		return userDao.selectByUsernameAndPassword(user);
	}

	@Override
	public Boolean findByUserId(String userId) {
		
		User user = userDao.selectByUserId(userId);
		if(user==null){
			return true;
		}
		return false ;
	}

	@Override
	public void addUser(User user) {
		userDao.insertIntoUser(user);
		userDao.insertIntoRole(user);
		
	}


	@Override
	public void removeUser(String id) {
		userDao.deleteUser(id);
		userDao.deleteUserRole(id);
		
	}

	@Override
	public String valPriv(String userId) {
		String createRole = userDao.selectCreateRole(userId);
		return createRole;
	}

	@Override
	public User showModify(String userId) {
		User user = userDao.selectUser(userId);
		return user;
	}

	@Override
	public User valModify(String userId) {
		User user = userDao.selectByUserId2(userId);
		return user;
	}

	@Override
	public void modifyUser(User user) {
		
		userDao.updateUser(user);
		
	}

	@Override
	public String findId(String userId) {
		
		String id = userDao.selectFromUser(userId);
		return id;
	}

	@Override
	public void modifyUserRole(User user) {
		
		userDao.updateUserRole(user);
		
	}
	
	
	
	
	
}
