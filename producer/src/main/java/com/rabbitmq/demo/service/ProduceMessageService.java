package com.rabbitmq.demo.service;

import com.rabbitmq.demo.rabbitmq.ConfigureRabbitMq;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Service;
@Service
public class ProduceMessageService {
    private final RabbitTemplate rabbitTemplate;
    private ConfigureRabbitMq configureRabbitMq;

    public ProduceMessageService(RabbitTemplate rabbitTemplate, ConfigureRabbitMq configureRabbitMq) {
        this.rabbitTemplate = rabbitTemplate;
        this.configureRabbitMq = configureRabbitMq;
    }

    public String produceMessage(String message) {
        rabbitTemplate.convertAndSend(configureRabbitMq.getExchangeName(), "myRoutingKey.messages",
                message);
        return "Message(" + message + ")" + " has been produced.";
    }
}
