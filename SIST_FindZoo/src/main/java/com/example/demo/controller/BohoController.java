package com.example.demo.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.DealDao;
import com.example.demo.dao.BohoDao;
import com.example.demo.util.Paging;
import com.example.demo.vo.DealVo;
import com.example.demo.vo.BohoVo;
import com.example.demo.vo.MemberVo;

import ch.qos.logback.core.util.FileSize;


@Controller
public class BohoController {
	
	@Autowired
	private BohoDao dao;
	public void setDao(BohoDao dao) {
		this.dao = dao;
	}

	@Autowired
	private Paging paging;
	
	public void setPaging(Paging paging) {
		this.paging = paging;
	}
	
	@Autowired
	private Paging paging_pic;
	
	public void setPaging_pic(Paging paging_pic) {
		this.paging_pic = paging_pic;
	}
	
	@RequestMapping("/boho.do")
	public void boho(HttpServletRequest request, 
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) {

		paging.pageSize = 9;
		
		paging.totalRecord = dao.getTotalRecordBoho();
		paging.totalPage = paging.getTotalPage();
		paging.start = paging.getStart(pageNum);
		paging.end = paging.getEnd(paging.start, pageNum);
		paging.pageNum = pageNum;
		paging.listStart = paging.getListStart(pageNum);
		paging.listEnd = paging.getListEnd();
		
		if(paging.end > paging.totalRecord) {
			paging.end = paging.totalRecord;
		}
		
		HashMap map = new HashMap();
		map.put("start", paging.start);
		map.put("end", paging.end);
		
		paging_pic.pageSize = 27;
		
		paging_pic.totalRecord = dao.getTotalRecordBoho() * 3;
		
		paging_pic.totalPage = paging_pic.getTotalPage();
		paging_pic.start = paging_pic.getStart(pageNum);
		paging_pic.end = paging_pic.getEnd(paging.start, pageNum);
		paging_pic.pageNum = pageNum;
		paging_pic.listStart = paging_pic.getListStart(pageNum);
		paging_pic.listEnd = paging_pic.getListEnd();
		
		if(paging_pic.end > paging_pic.totalRecord) {
			paging_pic.end = paging_pic.totalRecord;
		}
		
		HashMap map_pic = new HashMap();
		map_pic.put("start", paging_pic.start);
		map_pic.put("end", paging_pic.end);
		
		model.addAttribute("list", dao.findAll(map));
		model.addAttribute("p", dao.findAllPicture(map_pic));
		model.addAttribute("totalRecord", paging.totalRecord/3);
		model.addAttribute("totalPage", paging.totalPage);
		model.addAttribute("pageNum", paging.pageNum);
		model.addAttribute("listStart", paging.listStart);
		model.addAttribute("listEnd", paging.listEnd);
		
	}
	
	@RequestMapping("/searchBoho.do")
	public void searchBoho(HttpServletRequest request, 
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value = "search_option", defaultValue = "title") String search_option, 
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			Model model) {
		
		HashMap num_map = new HashMap();
		num_map.put("keyword", keyword);
		num_map.put("search_option", search_option);
		
		paging.searchRecord = dao.getSearchRecordBoho(num_map);
		paging.searchPage = paging.getSearchPage();
		paging.start = paging.getStart(pageNum);
		paging.end = paging.getEnd(paging.start, pageNum);
		paging.pageNum = pageNum;
		paging.s_listStart = paging.getS_ListStart(pageNum);
		paging.s_listEnd = paging.getS_ListEnd();
		
		if(paging.end > paging.searchRecord) {
			paging.end = paging.searchRecord;
		}
		
		HashMap map = new HashMap();
		map.put("start", paging.start);
		map.put("end", paging.end);
		map.put("keyword", keyword);
		map.put("search_option", search_option);
		
		paging_pic.pageSize = 27;
		
		paging_pic.totalRecord = dao.getTotalRecordBoho() * 3;
		
		paging_pic.totalPage = paging_pic.getTotalPage();
		paging_pic.start = paging_pic.getStart(pageNum);
		paging_pic.end = paging_pic.getEnd(paging.start, pageNum);
		paging_pic.pageNum = pageNum;
		paging_pic.listStart = paging_pic.getListStart(pageNum);
		paging_pic.listEnd = paging_pic.getListEnd();
		
		if(paging_pic.end > paging_pic.totalRecord) {
			paging_pic.end = paging_pic.totalRecord;
		}
		
		HashMap map_pic = new HashMap();
		map_pic.put("start", paging_pic.start);
		map_pic.put("end", paging_pic.end);
		map_pic.put("keyword", keyword);
		map_pic.put("search_option", search_option);
		
		model.addAttribute("list",dao.searchBoho(map));
		model.addAttribute("p",dao.searchBohoPicture(map_pic));
		model.addAttribute("searchPage", paging.searchPage);
		model.addAttribute("searchRecord", paging.searchRecord/3);
		model.addAttribute("pageNum", paging.pageNum);
		model.addAttribute("s_listStart", paging.s_listStart);
		model.addAttribute("s_listEnd", paging.s_listEnd);
		model.addAttribute("search_option", search_option);		
		model.addAttribute("keyword", keyword);
	}
	
	
	@RequestMapping("/detailBoho.do")
	public void detail(HttpServletRequest request, Model model, HttpSession session, int board_num) {
		dao.updateViewsBoho(board_num);
		int member_num = 0;
		if(((MemberVo)session.getAttribute("loginM")) != null) {
			member_num = ((MemberVo)session.getAttribute("loginM")).getMember_num();
		}
		model.addAttribute("bh", dao.getBoho(board_num));
		model.addAttribute("p", dao.getBohoPicture(board_num));
		model.addAttribute("member_num", member_num);
	}
	
	
		@RequestMapping(value = "/member/insertBoho.do", method = RequestMethod.GET)
		public void form(HttpServletRequest request, HttpSession session) {
			
		}
		
		@RequestMapping(value = "/member/insertBoho.do" , method = RequestMethod.POST)
		public ModelAndView submit(HttpServletRequest request, HttpSession session, BohoVo bh) {
			ModelAndView mav = new ModelAndView("redirect:/boho.do");
			int member_num = ((MemberVo)session.getAttribute("loginM")).getMember_num();
			bh.setMember_num(member_num);
			String picture_fname1 = null;
			String picture_fname2 = null;
			String picture_fname3 = null;
			int fsize1 = 0;
			int fsize2 = 0;
			int fsize3 = 0;
			
			MultipartFile picture_file1 = bh.getPicture_file1();
			MultipartFile picture_file2 = bh.getPicture_file2();
			MultipartFile picture_file3 = bh.getPicture_file3();
			picture_fname1 = picture_file1.getOriginalFilename();
			picture_fname2 = picture_file2.getOriginalFilename();
			picture_fname3 = picture_file3.getOriginalFilename();
			
			int pic_re1 = -1;
			int pic_re2 = -1;
			int pic_re3 = -1;
			
			String path = request.getRealPath("resources/img");
			Calendar cal = Calendar.getInstance();
			Date date = cal.getTime();
			
			if(picture_fname1 != null && !picture_fname1.equals("")) {
				try {
					picture_fname1 = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date))+"_"+picture_fname1;
					byte[] data1 = picture_file1.getBytes();
					fsize1 = data1.length;
					bh.setPicture_fname1(picture_fname1);
					FileOutputStream fos1 = new FileOutputStream(path+"/"+picture_fname1);
					fos1.write(data1);
					fos1.close();
					System.out.println(path);
					pic_re1 = 1;
					
					if(picture_fname2 != null && !picture_fname2.equals("")) {
						try {
							path = request.getRealPath("resources/img");
							cal = Calendar.getInstance();
							date = cal.getTime();
							picture_fname2 = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date))+"_"+picture_fname2;
							byte[] data2 = picture_file2.getBytes();
							fsize2 = data2.length;
							bh.setPicture_fname2(picture_fname2);
							FileOutputStream fos2 = new FileOutputStream(path+"/"+picture_fname2);
							fos2.write(data2);
							fos2.close();
							System.out.println(path);
							pic_re2 = 1;
							
							if(picture_fname3 != null && !picture_fname3.equals("")) {
								try {
									path = request.getRealPath("resources/img");
									cal = Calendar.getInstance();
									date = cal.getTime();
									picture_fname3 = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date))+"_"+picture_fname3;
									byte[] data3 = picture_file3.getBytes();
									fsize3 = data3.length;
									bh.setPicture_fname3(picture_fname3);
									FileOutputStream fos3 = new FileOutputStream(path+"/"+picture_fname3);
									fos3.write(data3);
									fos3.close();
									System.out.println(path);
									pic_re3 = 1;
								} catch (Exception e) {
									// TODO: handle exception
								}
							}else {
								try {
									path = request.getRealPath("resources/systems");
									byte[] data3 = picture_file3.getBytes();
									picture_fname3 = "default.jpg";
									fsize3 = data3.length;
									bh.setPicture_fname3(picture_fname3);
									System.out.println(path);
									pic_re3 = 1;
								} catch (Exception e) {
									// TODO: handle exception
								}
							}
						} catch (Exception e) {
							// TODO: handle exception
						}
					}else {
						try {
							path = request.getRealPath("resources/systems");
							byte[] data2 = picture_file2.getBytes();
							picture_fname2 = "default.jpg";
							fsize2 = data2.length;
							bh.setPicture_fname2(picture_fname2);
							System.out.println(path);
							pic_re2 = 1;
							
							if(picture_fname3 != null && !picture_fname3.equals("")) {
								try {
									path = request.getRealPath("resources/img");
									cal = Calendar.getInstance();
									date = cal.getTime();
									picture_fname3 = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date))+"_"+picture_fname3;
									byte[] data3 = picture_file3.getBytes();
									fsize3 = data3.length;
									bh.setPicture_fname3(picture_fname3);
									FileOutputStream fos3 = new FileOutputStream(path+"/"+picture_fname3);
									fos3.write(data3);
									fos3.close();
									System.out.println(path);
									pic_re3 = 1;
								} catch (Exception e) {
									// TODO: handle exception
								}
							}else {
								try {
									path = request.getRealPath("resources/systems");
									byte[] data3 = picture_file3.getBytes();
									picture_fname3 = "default.jpg";
									fsize3 = data3.length;
									bh.setPicture_fname3(picture_fname3);
									System.out.println(path);
									pic_re3 = 1;
								} catch (Exception e) {
									// TODO: handle exception
								}
							}
						} catch (Exception e) {
							// TODO: handle exception
						}
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
			}else {
				try {
					path = request.getRealPath("resources/systems");
					byte[] data1 = picture_file1.getBytes();
					picture_fname1 = "default.jpg";
					fsize1 = data1.length;
					bh.setPicture_fname1(picture_fname1);
					System.out.println(path);
					pic_re1 = 1;
					
					if(picture_fname2 != null && !picture_fname2.equals("")) {
						try {
							path = request.getRealPath("resources/img");
							cal = Calendar.getInstance();
							date = cal.getTime();
							picture_fname2 = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date))+"_"+picture_fname2;
							byte[] data2 = picture_file2.getBytes();
							fsize2 = data2.length;
							bh.setPicture_fname2(picture_fname2);
							FileOutputStream fos2 = new FileOutputStream(path+"/"+picture_fname2);
							fos2.write(data2);
							fos2.close();
							System.out.println(path);
							pic_re2 = 1;
							
							
						} catch (Exception e) {
							// TODO: handle exception
						}
						
						if(picture_fname3 != null && !picture_fname3.equals("")) {
							try {
								path = request.getRealPath("resources/img");
								cal = Calendar.getInstance();
								date = cal.getTime();
								picture_fname3 = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date))+"_"+picture_fname3;
								byte[] data3 = picture_file3.getBytes();
								fsize3 = data3.length;
								bh.setPicture_fname3(picture_fname3);
								FileOutputStream fos3 = new FileOutputStream(path+"/"+picture_fname3);
								fos3.write(data3);
								fos3.close();
								System.out.println(path);
								pic_re3 = 1;
							} catch (Exception e) {
								// TODO: handle exception
							}
						}else {
							try {
								path = request.getRealPath("resources/systems");
								byte[] data3 = picture_file3.getBytes();
								picture_fname3 = "default.jpg";
								fsize3 = data3.length;
								bh.setPicture_fname3(picture_fname3);
								System.out.println(path);
								pic_re3 = 1;
							} catch (Exception e) {
								// TODO: handle exception
							}
						}
					}else {
						try {
							path = request.getRealPath("resources/systems");
							byte[] data2 = picture_file2.getBytes();
							picture_fname2 = "default.jpg";
							fsize2 = data2.length;
							bh.setPicture_fname2(picture_fname2);
							System.out.println(path);
							pic_re2 = 1;
						} catch (Exception e) {
							// TODO: handle exception
						}
						
						if(picture_fname3 != null && !picture_fname3.equals("")) {
							try {
								path = request.getRealPath("resources/img");
								cal = Calendar.getInstance();
								date = cal.getTime();
								picture_fname3 = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date))+"_"+picture_fname3;
								byte[] data3 = picture_file3.getBytes();
								fsize3 = data3.length;
								bh.setPicture_fname3(picture_fname3);
								FileOutputStream fos3 = new FileOutputStream(path+"/"+picture_fname3);
								fos3.write(data3);
								fos3.close();
								System.out.println(path);
								pic_re3 = 1;
							} catch (Exception e) {
								// TODO: handle exception
							}
						}else {
							try {
								path = request.getRealPath("resources/systems");
								byte[] data3 = picture_file3.getBytes();
								picture_fname3 = "default.jpg";
								fsize3 = data3.length;
								bh.setPicture_fname3(picture_fname3);
								System.out.println(path);
								pic_re3 = 1;
							} catch (Exception e) {
								// TODO: handle exception
							}
						}
						
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			
			if(pic_re1 == 1 && pic_re2 == 1 && pic_re3 == 1) {
				int re = dao.insertBoho(bh);
				
				if(re != 1) {
					mav.addObject("msg","게시물 등록에 실패하였습니다.");
					mav.setViewName("redirect:/boho.do");
				}
			}
			return mav;
		}
	

	@RequestMapping(value = "/member/updateBoho.do", method = RequestMethod.GET)
	public void bohoUpdateForm(HttpServletRequest request, Model model, int board_num) {
		model.addAttribute("bh", dao.getBoho(board_num));
		model.addAttribute("p", dao.getBohoPicture(board_num));
	}
	
	@RequestMapping(value = "/member/updateBoho.do", method = RequestMethod.POST)
	public ModelAndView bohoUpdateSubmit(HttpServletRequest request, BohoVo bh) {
		ModelAndView mav = new ModelAndView("redirect:/detailBoho.do?board_num="+bh.getBoard_num());
		
		int pic_re1 = -1;
		int pic_re2 = -1;
		int pic_re3 = -1;
		
		String path = request.getRealPath("/resources/img");
		String oldFname1 = bh.getPicture_fname1();
		String oldFname2 = bh.getPicture_fname2();
		String oldFname3 = bh.getPicture_fname3();
		
		String picture_fname1 = null;
		String picture_fname2 = null;
		String picture_fname3 = null;
		int fsize1 = 0;
		int fsize2 = 0;
		int fsize3 = 0;
		
		MultipartFile picture_file1 = bh.getPicture_file1();
		MultipartFile picture_file2 = bh.getPicture_file2();
		MultipartFile picture_file3 = bh.getPicture_file3();
		picture_fname1 = picture_file1.getOriginalFilename();
		picture_fname2 = picture_file2.getOriginalFilename();
		picture_fname3 = picture_file3.getOriginalFilename();
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		
		if(picture_fname1 != null && !picture_fname1.equals("")) {
			try {
				picture_fname1 = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date))+"_"+picture_fname1;
				byte[] data1 = picture_file1.getBytes();
				fsize1 = data1.length;
				bh.setPicture_fname1(picture_fname1);
				FileOutputStream fos1 = new FileOutputStream(path+"/"+picture_fname1);
				fos1.write(data1);
				fos1.close();
				System.out.println(path);
				pic_re1 = 1;
				
				if(picture_fname2 != null && !picture_fname2.equals("")) {
					try {
						path = request.getRealPath("resources/img");
						cal = Calendar.getInstance();
						date = cal.getTime();
						picture_fname2 = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date))+"_"+picture_fname2;
						byte[] data2 = picture_file2.getBytes();
						fsize2 = data2.length;
						bh.setPicture_fname2(picture_fname2);
						FileOutputStream fos2 = new FileOutputStream(path+"/"+picture_fname2);
						fos2.write(data2);
						fos2.close();
						System.out.println(path);
						pic_re2 = 1;
						
						if(picture_fname3 != null && !picture_fname3.equals("")) {
							try {
								path = request.getRealPath("resources/img");
								cal = Calendar.getInstance();
								date = cal.getTime();
								picture_fname3 = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date))+"_"+picture_fname3;
								byte[] data3 = picture_file3.getBytes();
								fsize3 = data3.length;
								bh.setPicture_fname3(picture_fname3);
								FileOutputStream fos3 = new FileOutputStream(path+"/"+picture_fname3);
								fos3.write(data3);
								fos3.close();
								System.out.println(path);
								pic_re3 = 1;
							} catch (Exception e) {
								// TODO: handle exception
							}
						}else {
							try {
								path = request.getRealPath("resources/systems");
								byte[] data3 = picture_file3.getBytes();
								picture_fname3 = oldFname3;
								fsize3 = data3.length;
								bh.setPicture_fname3(picture_fname3);
								System.out.println(path);
								pic_re3 = 1;
							} catch (Exception e) {
								// TODO: handle exception
							}
						}
					} catch (Exception e) {
						// TODO: handle exception
					}
				}else {
					try {
						path = request.getRealPath("resources/systems");
						byte[] data2 = picture_file2.getBytes();
						picture_fname2 = oldFname2;
						fsize2 = data2.length;
						bh.setPicture_fname2(picture_fname2);
						System.out.println(path);
						pic_re2 = 1;
						
						if(picture_fname3 != null && !picture_fname3.equals("")) {
							try {
								path = request.getRealPath("resources/img");
								cal = Calendar.getInstance();
								date = cal.getTime();
								picture_fname3 = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date))+"_"+picture_fname3;
								byte[] data3 = picture_file3.getBytes();
								fsize3 = data3.length;
								bh.setPicture_fname3(picture_fname3);
								FileOutputStream fos3 = new FileOutputStream(path+"/"+picture_fname3);
								fos3.write(data3);
								fos3.close();
								System.out.println(path);
								pic_re3 = 1;
							} catch (Exception e) {
								// TODO: handle exception
							}
						}else {
							try {
								path = request.getRealPath("resources/systems");
								byte[] data3 = picture_file3.getBytes();
								picture_fname3 = oldFname3;
								fsize3 = data3.length;
								bh.setPicture_fname3(picture_fname3);
								System.out.println(path);
								pic_re3 = 1;
							} catch (Exception e) {
								// TODO: handle exception
							}
						}
					} catch (Exception e) {
						// TODO: handle exception
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}else {
			try {
				path = request.getRealPath("resources/systems");
				byte[] data1 = picture_file1.getBytes();
				picture_fname1 = oldFname1;
				fsize1 = data1.length;
				bh.setPicture_fname1(picture_fname1);
				System.out.println(path);
				pic_re1 = 1;
				
				if(picture_fname2 != null && !picture_fname2.equals("")) {
					try {
						path = request.getRealPath("resources/img");
						cal = Calendar.getInstance();
						date = cal.getTime();
						picture_fname2 = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date))+"_"+picture_fname2;
						byte[] data2 = picture_file2.getBytes();
						fsize2 = data2.length;
						bh.setPicture_fname2(picture_fname2);
						FileOutputStream fos2 = new FileOutputStream(path+"/"+picture_fname2);
						fos2.write(data2);
						fos2.close();
						System.out.println(path);
						pic_re2 = 1;
						
						
					} catch (Exception e) {
						// TODO: handle exception
					}
					
					if(picture_fname3 != null && !picture_fname3.equals("")) {
						try {
							path = request.getRealPath("resources/img");
							cal = Calendar.getInstance();
							date = cal.getTime();
							picture_fname3 = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date))+"_"+picture_fname3;
							byte[] data3 = picture_file3.getBytes();
							fsize3 = data3.length;
							bh.setPicture_fname3(picture_fname3);
							FileOutputStream fos3 = new FileOutputStream(path+"/"+picture_fname3);
							fos3.write(data3);
							fos3.close();
							System.out.println(path);
							pic_re3 = 1;
						} catch (Exception e) {
							// TODO: handle exception
						}
					}else {
						try {
							path = request.getRealPath("resources/systems");
							byte[] data3 = picture_file3.getBytes();
							picture_fname3 = oldFname3;
							fsize3 = data3.length;
							bh.setPicture_fname3(picture_fname3);
							System.out.println(path);
							pic_re3 = 1;
						} catch (Exception e) {
							// TODO: handle exception
						}
					}
				}else {
					try {
						path = request.getRealPath("resources/systems");
						byte[] data2 = picture_file2.getBytes();
						picture_fname2 = oldFname2;
						fsize2 = data2.length;
						bh.setPicture_fname2(picture_fname2);
						System.out.println(path);
						pic_re2 = 1;
					} catch (Exception e) {
						// TODO: handle exception
					}
					
					if(picture_fname3 != null && !picture_fname3.equals("")) {
						try {
							path = request.getRealPath("resources/img");
							cal = Calendar.getInstance();
							date = cal.getTime();
							picture_fname3 = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date))+"_"+picture_fname3;
							byte[] data3 = picture_file3.getBytes();
							fsize3 = data3.length;
							bh.setPicture_fname3(picture_fname3);
							FileOutputStream fos3 = new FileOutputStream(path+"/"+picture_fname3);
							fos3.write(data3);
							fos3.close();
							System.out.println(path);
							pic_re3 = 1;
						} catch (Exception e) {
							// TODO: handle exception
						}
					}else {
						try {
							path = request.getRealPath("resources/systems");
							byte[] data3 = picture_file3.getBytes();
							picture_fname3 = oldFname3;
							fsize3 = data3.length;
							bh.setPicture_fname3(picture_fname3);
							System.out.println(path);
							pic_re3 = 1;
						} catch (Exception e) {
							// TODO: handle exception
						}
					}
					
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		
		if(pic_re1 == 1 && pic_re2 == 1 && pic_re3 == 1) {
			int re = dao.updateBoho(bh);
			
			if(re != 1) {
				mav.addObject("msg", "게시물 수정에 실패하였습니다.");
				mav.setViewName("/boho.do");
				
			}else {
				if(fsize1 != 0 && fsize2 != 0 && fsize3 != 0)	{
				File file1 = new File(path + "/" + oldFname1);
				File file2 = new File(path + "/" + oldFname2);
				File file3 = new File(path + "/" + oldFname3);
					file1.delete();
					file2.delete();
					file3.delete();
				}
			}
		}
		return mav;
	}

	@RequestMapping("/deleteBoho.do")
	public ModelAndView bohoDeleteSubmit(HttpServletRequest request, int board_num) {
		String path = request.getRealPath("/resources/img");
		ModelAndView mav = new ModelAndView("redirect:/boho.do");
		String picture_fname1 = dao.getBoho(board_num).getPicture_fname1();
		String picture_fname2 = dao.getBoho(board_num).getPicture_fname2();
		String picture_fname3 = dao.getBoho(board_num).getPicture_fname3();
		System.out.println(picture_fname1);
		System.out.println(picture_fname2);
		System.out.println(picture_fname3);
		
		int re = dao.deleteBoho(board_num);
		System.out.println(re);
		if(re == 1) {
			File file1 = new File(path + "/" + picture_fname1);
			File file2 = new File(path + "/" + picture_fname2);
			File file3 = new File(path + "/" + picture_fname3);
			file1.delete();
			file2.delete();
			file3.delete();
		}else {
			mav.addObject("msg","게시물 삭제에 실패하였습니다.");
			mav.setViewName("boho.do");
		}
		return mav;
	}
}