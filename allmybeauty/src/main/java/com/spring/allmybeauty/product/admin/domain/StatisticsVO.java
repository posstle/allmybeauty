package com.spring.allmybeauty.product.admin.domain;

import lombok.Data;

@Data
public class StatisticsVO {
	private int todayOrderCount;
	private int todayProductInCount;
	private int todayProductOutCount;
	private int todaySalesTotalPrice;

}
