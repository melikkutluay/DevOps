package com.example.consumer.rabbitmq;

import com.example.consumer.service.ConsumeMessageService;
import com.example.consumer.vault.VaultConfigration;
import org.springframework.amqp.rabbit.connection.CachingConnectionFactory;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.listener.SimpleMessageListenerContainer;
import org.springframework.amqp.rabbit.listener.adapter.MessageListenerAdapter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.beans.factory.annotation.Value;

@Configuration
public class ConfigureRabbitMq {
    private final VaultConfigration vaultConfigration;
    public ConfigureRabbitMq(VaultConfigration vaultConfigration) {
        this.vaultConfigration = vaultConfigration;
    }

    public String getRabbitmqHost() {
        return RabbitmqHost;
    }

    public void setRabbitmqHost(String rabbitmqHost) {
        RabbitmqHost = rabbitmqHost;
    }

    @Value("${rabbitmq.RABBITMQ_HOST}")
    private String RabbitmqHost;

    public Integer getRabbitmqPort() {
        return RabbitmqPort;
    }

    public void setRabbitmqPort(Integer rabbitmqPort) {
        RabbitmqPort = rabbitmqPort;
    }

    @Value("${rabbitmq.RABBITMQ_PORT}")
    private Integer RabbitmqPort;

    @Value("${rabbitmq.QUEUE_NAME}")
    private String QueueName;

    @Bean(name = "container")
    SimpleMessageListenerContainer container(MessageListenerAdapter messageListenerAdapter) {
        SimpleMessageListenerContainer container = new SimpleMessageListenerContainer();
        container.setConnectionFactory(rabbitConnectionFactory());
        container.setQueueNames(QueueName);
        container.setMessageListener(messageListenerAdapter);
        return container;
    }
    @Bean
    MessageListenerAdapter messageListenerAdapter(ConsumeMessageService consumeMessageService) {
        return new MessageListenerAdapter(consumeMessageService, "consumeMessage");
    }
    @Bean
    public ConnectionFactory rabbitConnectionFactory() {
        CachingConnectionFactory connectionFactory = new CachingConnectionFactory(RabbitmqHost);
        connectionFactory.setPort(RabbitmqPort);
        connectionFactory.setUsername(vaultConfigration.getUsername());
        connectionFactory.setPassword(vaultConfigration.getPassword());
        return connectionFactory;
    }
}
