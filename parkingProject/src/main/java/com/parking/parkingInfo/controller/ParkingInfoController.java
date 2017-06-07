package com.parking.parkingInfo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/info")
public class ParkingInfoController {
	
	@RequestMapping(value = "/parkingInfo")
	public String parkingInfo() {
		return "info/parkingInfo";
	}
}
