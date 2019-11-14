package com.ch.podo.notice.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Notice {
	
	private int id;			// 공지번호
	private String title;	// 공지제목
	private String content;	// 공지내용
	private int viewCount;	// 조회수
	private Date createDate; // 최초작성일
	private Date modifyDate; // 최종수정일
	private int imageId;	 // 이미지번호
	private int adminId;	 // 회원번호


}
