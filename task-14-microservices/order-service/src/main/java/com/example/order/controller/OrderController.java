package com.example.order.controller;

import com.example.order.client.UserClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    private UserClient userClient;

    @GetMapping("/{orderId}/{userId}")
    public String getOrder(@PathVariable String orderId,
                           @PathVariable String userId) {
        String userInfo = userClient.getUserInfo(userId);
        return "Order #" + orderId + " placed by " + userInfo;
    }
}