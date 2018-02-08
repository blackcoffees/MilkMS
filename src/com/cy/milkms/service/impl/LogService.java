package com.cy.milkms.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cy.milkms.db.dao.LogMapper;
import com.cy.milkms.db.entity.Log;
import com.cy.milkms.service.ILogService;
import com.cy.milkms.util.DateTool;
import com.cy.milkms.util.SqlHelper;

@Service("logService")
public class LogService implements ILogService{

	@Autowired
	private LogMapper mapper;
	
	@Override
	public void addLog(Object mappperObj, String method, Object... data){
		String sql = SqlHelper.getMapperSql(mappperObj, method, data);
		Log log = new Log();
		log.setSql(sql);
		log.setTime(DateTool.getNowTime());
		log.setData("");
		mapper.addLog(log);
	}

}
