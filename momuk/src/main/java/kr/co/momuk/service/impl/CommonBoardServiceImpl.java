package kr.co.momuk.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.momuk.domain.CommonBoardDTO;
import kr.co.momuk.mapper.CommonBoardMapper;
import kr.co.momuk.service.ICommonBoardService;

public class CommonBoardServiceImpl implements ICommonBoardService{
	@Autowired
	private CommonBoardMapper commonMapper;
	
	@Override
	public void insertCommonBoard(CommonBoardDTO commonBoard) {
//		commonMapper.insertCommonBoard(commonBoard);
	}

}