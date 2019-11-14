package com.ch.podo.board.model.vo;

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
public class Board {
	
	private int id;					// 게시글번호
	private String title;			// 제목
	private String content;			// 내용
	private int viewCount;			// 조회수
	private int inappropriateCount;	// 부적절한내용 신고 개수
	private int spoilerCount;		// 스포일러 신고 개수
	private int likeCount;			// 좋아요 개수
	private Date modifyDate;		// 최종수정일
	private Date createDate;		// 최초작성일
	private String status;			// 상태
	private int memberId;			// 작성자
	private int imageId;			// 이미지번호

}
