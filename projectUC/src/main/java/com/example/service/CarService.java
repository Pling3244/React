package com.example.service;

import java.util.List;

import com.example.domain.CarVO;
import com.example.domain.Criteria;

public interface CarService {

	/* 차량 등록 */
	public void register(CarVO car);	
	
	/* 상품 리스트 */
	public List<CarVO> goodsGetList(Criteria cri);
	
	/* 상품 총 개수 */
	public int goodsGetTotal(Criteria cri);	
	
	/* 상품 정보 */
	public CarVO getGoodsInfo(int num);
}
