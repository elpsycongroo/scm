package cn.itcast.dao;

import cn.itcast.entity.Account;

public interface AccountMapper extends BaseMapper<Account> {
	//��¼
    public Account login(Account account);
}