package com.kh.fantimate.pay.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.pay.model.service.PaymentService;
import com.kh.fantimate.pay.model.vo.CartCollection;
import com.kh.fantimate.store.model.vo.StoreCollection;

@Controller
@RequestMapping("/pay")
public class PaymentController {
	@Autowired
	private PaymentService pService;
	
	@GetMapping("/cart")
	public ModelAndView cartPage(ModelAndView mv,
								 HttpServletRequest request) {
		String userId = "";
		if(((Member)request.getSession().getAttribute("loginUser")) == null) {
			mv.setViewName(request.getHeader("referer"));
		} else {
			userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
		}
		
		List<CartCollection> cartList = pService.selectCartList(userId);
		System.out.println(cartList);
		mv.addObject("cartList", cartList);
		mv.setViewName("pay/cart");
		return mv;
	}
	
	@GetMapping("/deleteStoreByCart")
	public String deleteStoreByCart(Model model,
								    @RequestParam(value="cartCode") int cartCode) {
		int result = pService.deleteStoreByCart(cartCode);
		if(result > 0) {
			model.addAttribute("msg", "상품이 정상적으로 삭제되었습니다");
			return "redirect:/pay/cart";
		}
		else {
			model.addAttribute("msg", "상품이 삭제되지 않았습니다");
			return "redirect:/pay/cart";
		}
	}
	
	@GetMapping("/deleteChooseByCart")
	public String deleteChooseByCart(Model model, int[] cartCodes) {
		
		for(int i = 0; i <cartCodes.length; i++) {
			System.out.println(cartCodes[i]);
		}
		
		int result = pService.deleteChooseByCart(cartCodes);
		if(result > 0) {
			model.addAttribute("msg", "상품이 정상적으로 삭제되었습니다");
			return "redirect:/pay/cart";
		}
		else {
			model.addAttribute("msg", "상품이 삭제되지 않았습니다");
			return "redirect:/pay/cart";
		}
	}
	
	@GetMapping("/updateQuantity")
	public String updateQuantity(Model model,
								 @RequestParam(value="cartCode") int cartCode,
								 @RequestParam(value="price") int price,
								 @RequestParam(value="flag") String flag) {
		
		int result = pService.updateQuantity(cartCode, price, flag);
		if(result > 0) {
			return "redirect:/pay/cart";
		}
		else {
			model.addAttribute("msg", "상품 수량변경에 문제가 생겼습니다");
			return "redirect:/pay/cart";
		}
	}
}