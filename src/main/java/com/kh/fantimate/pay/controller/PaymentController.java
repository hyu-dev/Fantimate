package com.kh.fantimate.pay.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.pay.model.service.PaymentService;
import com.kh.fantimate.pay.model.vo.CartCollection;
import com.kh.fantimate.pay.model.vo.PayCollection;
import com.kh.fantimate.pay.model.vo.Payment;
import com.kh.fantimate.pay.model.vo.ProductBuy;

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
	
	@PostMapping("/storeOne/payment")
	@ResponseBody
	public Map<String, String> insertStoreOnePayment(Payment payment, ProductBuy pbuy) {
		
		PayCollection paycoll = new PayCollection();
		paycoll.setPayment(payment);
		paycoll.setPbuy(pbuy);
		
		String msg = pService.insertStoreOnePayment(paycoll) > 0 ? "결제가 완료되었습니다" : "결제가 취소되었습니다";
		
		Map<String, String> map = new HashMap<>();
		map.put("msg", msg);
		return map;
	}
	
	@PostMapping("/cart/payment")
	@ResponseBody
	public Map<String, String> insertCartPayment(HttpServletRequest request,
												 Payment payment, 
												 @RequestParam(value="pcode[]") List<Integer> pcode,
												 @RequestParam(value="productQ[]") List<Integer> productQ,
												 @RequestParam(value="cartCodes[]") List<Integer> cartCodes) {
		List<ProductBuy> pbuyList = new ArrayList<>();
		ProductBuy pbuy = null;
		String msg = "";
		if(pcode.get(0) != 0 && productQ.get(0) != 0) {
			for(int i = 0; i < pcode.size(); i++) {
				pbuy = new ProductBuy();
				pbuy.setPayCode(payment.getPayCode());
				pbuy.setPcode(pcode.get(i));
				pbuy.setProductQ(productQ.get(i));
				pbuy.setId(((Member)request.getSession().getAttribute("loginUser")).getId());
				pbuyList.add(pbuy);
			}
		}
		
		msg = pService.insertCartPayment(payment, pbuyList, cartCodes) > 0 ? "결제가 완료되었습니다" : "결제가 취소되었습니다";
		
		Map<String, String> map = new HashMap<>();
		map.put("msg", msg);
		return map;
	}
	
	@GetMapping("/collectionMedia")
	@ResponseBody
	public List<CartCollection> selectCollectionMedia(HttpServletRequest request) {
		
		List<CartCollection> list = null;
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
		// 미디어 리스트 호출
		list = pService.selectCollectionMedia(userId);
		
		HttpSession session = request.getSession();
		if(list != null && !list.isEmpty()) {
			session.setAttribute("collection", list);
		} else {
			session.setAttribute("msg", "구입한 상품이 없습니다.");
			session.setAttribute("referer", request.getHeader("Referer"));
		}
		return list;
	}
}
