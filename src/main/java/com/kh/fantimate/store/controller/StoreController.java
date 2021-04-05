package com.kh.fantimate.store.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.fantimate.store.model.service.StoreService;
import com.kh.fantimate.store.model.vo.StoreCollection;

@Controller
public class StoreController {
	@Autowired
	private StoreService sService;

	@GetMapping("/test")
	public String test() {
		int cateCode = 1;
		List<StoreCollection> arr = (ArrayList<StoreCollection>)sService.selectStoreList(cateCode);
		System.out.println(arr);
		return null;
	}
	
	
}
