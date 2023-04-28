package com.example.mapper;

import java.util.List;

import com.example.domain.CarVO;
import com.example.domain.Criteria;
import com.example.domain.ImageVO;

public interface CarMapper {

	/* 차량 등록 */
	public void insert(CarVO car);
	
	/* 이미지 등록 */
	public void imageEnroll(ImageVO vo);

	/* 차량 리스트 */
	public List<CarVO> goodsGetList(Criteria cri);
	
	/* 차량 총 대수 */
	public int goodsGetTotal(Criteria cri);
	
	/* 상품 정보 */
	public CarVO getGoodsInfo(int num);
	
}
