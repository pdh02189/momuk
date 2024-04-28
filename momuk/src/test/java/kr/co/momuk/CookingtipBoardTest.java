package kr.co.momuk;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class CookingtipBoardTest {
	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	// 등록 테스트
//	@Test
//	public void testCookingtipInsert() throws Exception {
//	    String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/cookingtip/register")
//	            .param("title", "이거 지워도 들어가나?")
//	            .param("writer", "test03")
//	    		.param("uuid", "test_uuid")
//	    		.param("uploadpath", "test_uploadpath")
//	    		.param("filename", "test_filename")
//	    		.param("category", "카테고리02")
//	    		.param("content", "가라 피카츄!!"))
//	            .andReturn().getModelAndView().getViewName();
//
//	    log.info("resultpage : " + resultPage);
//	}
//	
	// 수정 테스트
	@Test
	public void testCookingtipUpdate() throws Exception {
		String resultPage =  mockMvc.perform(MockMvcRequestBuilders.post("/cookingtip/modify")
				.param("bno", "1")
	            .param("title", "제목수정합니다")
	    		.param("uuid", "modify_uuid")
	    		.param("uploadpath", "modify_uploadpath")
	    		.param("filename", "modify_filename")
	    		.param("category", "카테고리수정")
	    		.param("content", "내용도 수정을할것이다!"))
	            .andReturn().getModelAndView().getViewName();

	    log.info("resultpage : " + resultPage);
	}
}
