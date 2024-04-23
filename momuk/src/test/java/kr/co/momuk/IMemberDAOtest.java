package kr.co.momuk;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.momuk.domain.MemberDTO;
import kr.co.momuk.persistence.IMemberDAO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class IMemberDAOtest {
	@Autowired
	private IMemberDAO mDao;
	
	@Test
	public void testTime() throws Exception {
		log.info("mDao.getTime() : " + mDao.getTime());
	}
	
	@Test
	public void testInsertMember() throws Exception {
		MemberDTO mDto = new MemberDTO();
		mDto.setUserid("user04");
		mDto.setUserpw("aa1234");
		mDto.setUsername("홍길동");
		mDto.setEmail("hong@naver.com");
		
		mDao.insertMember(mDto);
	}

}