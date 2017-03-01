package cn.itcast.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.dao.AccountMapper;
import cn.itcast.entity.Account;
import cn.itcast.service.AccountService;

@Service("accountService")
public class AccountServiceImpl extends BaseServiceImpl<Account> implements AccountService {

	@Autowired
	private AccountMapper accountMapper;

	@Override
	public Account login(Account account) {
		return accountMapper.login(account);
	}	
	

}
