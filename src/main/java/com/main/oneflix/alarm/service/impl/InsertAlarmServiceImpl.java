package com.main.oneflix.alarm.service.impl;

import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.main.oneflix.alarm.dao.AlarmDAO;
import com.main.oneflix.alarm.service.InsertAlarmService;
import com.main.oneflix.alarm.vo.AlarmVO;

@Service
public class InsertAlarmServiceImpl implements InsertAlarmService {

	@Autowired
	private AlarmDAO alarmDAO;

	@Autowired
	private SqlSessionFactory sqlSessionFactory;

	@Override
	public void insertAlarm(AlarmVO vo) {
		alarmDAO.insertAlarm(vo);
	}

	@Override
	@Transactional
	public void selectAlarmList(HttpServletResponse response) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();

		SXSSFWorkbook wb = new SXSSFWorkbook(100);
		Sheet sheet = wb.createSheet();

		try {
			sqlSession.select("selectAlarmList", "게시물", new ResultHandler<AlarmVO>() {
				@Override
				public void handleResult(ResultContext<? extends AlarmVO> context) {
					AlarmVO vo = context.getResultObject();
					Row row = sheet.createRow(context.getResultCount() - 1);
					Cell cell = null;
					cell = row.createCell(0);
					cell.setCellValue(vo.getAlarmId());
					cell = row.createCell(1);
					cell.setCellValue(vo.getAlarmType());

				}
			});
			response.setHeader("Set-Cookie", "fileDownLoad=ture; path=/");
			response.setHeader("Content-Disposition", String.format("attachment; filename=\"alarmList.xlsx \""));
			wb.write(response.getOutputStream());
		} catch (Exception e) {
			response.setHeader("Set-Cookie", "fileDownload=false;path=/");
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.setHeader("Content-Type", "text/html; charset=utf-8");

			OutputStream out = null;
			try {
				out = response.getOutputStream();
				byte[] data = new String("오류...").getBytes();
				out.write(data, 0, data.length);
			} catch (Exception ignore) {

			} finally {
				if (out != null) {
					try {
						out.close();
					} catch (Exception ignore) {

					}
				}
			}
		} finally {
			sqlSession.close();
			wb.dispose();
			try {
				wb.close();
			} catch (Exception ignore) {

			}
		}
	}

}
