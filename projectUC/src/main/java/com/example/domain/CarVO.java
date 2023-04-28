package com.example.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class CarVO {

	private String cop_name;
	private String br_name;
	private String car_name;
	private String price;
	private int mileage;
	private int model_year;
	private String fuel_type;
	private String color;
	private String region;
	private int number_p;
	private String seller;
	private Date regdate;
	private String regdate1;
	private Date updatedate;
	private String updatedate1;
	private int num;
	private String uc_text;
	private List<ImageVO> imageList;
//	private MultipartFile[] car_img;
	private String owner;
	
}