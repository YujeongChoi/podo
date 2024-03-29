package com.ch.podo.board.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ch.podo.board.model.service.BoardService;
import com.ch.podo.board.model.vo.Board;
import com.ch.podo.board.model.vo.PageInfo;
import com.ch.podo.common.Pagination;
import com.ch.podo.image.model.vo.Image;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	
	@RequestMapping("blist.do")
	public ModelAndView boardList(ModelAndView mv,
								  @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int listCount = boardService.getBoardCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = boardService.selectBoardList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/boardListView");
		
		return mv;		
		
	}
	
	
	@RequestMapping("binsertForm.do")
	public String boardInsertView() {
		return "board/boardInsertForm";
	}
	
	
	@RequestMapping("binsert.do")
	public String insertBoard(Board b, Image i, HttpServletRequest request, Model model, 
								@RequestParam(value="", required=false) MultipartFile file) {
		
		if(!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file, request);
			
			i.setOriginalName(file.getOriginalFilename());
			i.setChangeName(renameFileName);
		}
		
		int result = boardService.insertBoard(b);
		
		if(result > 0) {
			return "redirect:";
		}else {
			model.addAttribute("", "");
			return "common/";
		}
		
	}
	
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/boardFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		String originalFileName = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "." + originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		
		String renamePath = savePath + "/" + renameFileName;
		
		try {
			
			file.transferTo(new File(renamePath));
			
		} catch (IllegalStateException | IOException e) {
			
			e.printStackTrace();
			
		}
		
		return renameFileName;
		
	}
	
	
	@RequestMapping("bdetail.do")
	public ModelAndView boardDetail(int id, ModelAndView mv) {
		Board b = boardService.selectBoard(id);
		
		if(b != null) {
			mv.addObject("b", b).setViewName("board/");
		}else {
			mv.addObject("", "");
			mv.setViewName("");
		}
		
		return mv;
		
	}
	
	

}
