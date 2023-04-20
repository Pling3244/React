package com.example.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.example.config.RootConfig.class})
@Log4j
public class MemberMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(member -> log.info(member));
	}
}