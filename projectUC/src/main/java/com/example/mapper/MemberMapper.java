package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.example.domain.MemberVO;

public interface MemberMapper {

	@Select("select * from uc_member")
	public List<MemberVO> getList();
}
