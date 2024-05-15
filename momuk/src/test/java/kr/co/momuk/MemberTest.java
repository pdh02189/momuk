package kr.co.momuk;

import static org.junit.Assert.assertEquals;

import java.text.SimpleDateFormat;
import java.util.Date;

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
public class MemberTest {

	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testMemberRegister() throws Exception {
		String birthString = "1990-01-01";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birthDate = sdf.parse(birthString);

		int status = mockMvc.perform(MockMvcRequestBuilders.post("/join")
		        .param("id", "testUser")
		        .param("pw", "password123")
		        .param("name", "John Doe")
		        .param("zipcode", "12345")
		        .param("streetAddress", "123 Main Street")
		        .param("detailAddress", "Apt 101")
		        .param("tel", "010-1234-5678")
		        .param("gender", "M")
		        .param("birth", sdf.format(birthDate))) // Date 객체를 문자열로 변환하여 전달
		        .andReturn().getResponse().getStatus();

		assertEquals(200, status);
	}

}
