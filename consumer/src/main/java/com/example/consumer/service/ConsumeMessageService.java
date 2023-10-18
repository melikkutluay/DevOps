package com.example.consumer.service;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
@Service
@Slf4j
public class ConsumeMessageService {
    public static Logger log = LoggerFactory.getLogger(ConsumeMessageService.class);
    public void consumeMessage(String messageBody) {
        //System.out.println("Consumed Message: " + messageBody);
        log.info("Consumed Message: " + messageBody);
    }
}