package com.kh.fantimate.store.model.service;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

public class FanStoreServiceImplTest {
	private FanStoreServiceImpl fService = new FanStoreServiceImpl();
	
	@Test
	public void test() {
		
		List<String> dupTagName = new ArrayList<>();
		
		List<String> tagName = new ArrayList<>(); 
		tagName.add("싱글");
		tagName.add("밤편지");
		tagName.add("다이어리");
		
		List<String> tagResult = new ArrayList<>();
		
		for(String d : tagResult) {
			for(int i = 0; i < tagName.size(); i++) {
				if(tagName.get(i).equals(d)) {
					dupTagName.add(tagName.get(i));
					tagName.remove(i);
				}
			}
		}
		
		assertTrue(dupTagName.size() < 1);
		
	}

}
