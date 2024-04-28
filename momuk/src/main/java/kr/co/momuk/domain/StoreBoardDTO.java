package kr.co.momuk.domain;

import lombok.Data;

@Data
public class StoreBoardDTO {
	private int bno;
	private String productId;
	private String category;
	private int price;
	private int shippingFee;
	private String content;
}
