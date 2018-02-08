package com.cy.milkms.db.dao;

import org.apache.ibatis.annotations.Param;

import com.cy.milkms.db.entity.Log;

public interface LogMapper {
	public int addLog(@Param("log")Log log);
}
