package cn.itcast.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.dao.AccountMapper;
import cn.itcast.entity.Account;
import cn.itcast.entity.Page;
import cn.itcast.service.AccountService;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

	@Autowired
	private AccountMapper accountMapper;

	@Override
	public void insert(Account entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Account entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Account entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Account select(Account entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Account login(Account account) {
		return accountMapper.login(account);
	}

	@Override
	public Page<Account> selectPage(Page<Account> page) {
		return null;
	}

	@Override
	public Page<Account> selectPageUseDyc(Page<Account> page) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
