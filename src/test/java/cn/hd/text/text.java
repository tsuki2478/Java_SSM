package cn.hd.text;

import static org.junit.Assert.*;


import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.hd.model.Userbean;
import cn.hd.service.IUserService;

public class text {

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testSave() {
		Userbean user = new Userbean();
		user.setUsername("月");
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
		IUserService service=(IUserService) ac.getBean("userServiceImpl");
		service.save(user);
	}

	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}

	@Test
	public void testDelete() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindById() {
		fail("Not yet implemented");
	}

	@Test
	public void testQuery() {
		fail("Not yet implemented");
	}

}
