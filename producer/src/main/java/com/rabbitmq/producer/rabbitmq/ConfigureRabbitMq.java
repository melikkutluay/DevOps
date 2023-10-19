package com.rabbitmq.producer.rabbitmq;

import com.rabbitmq.producer.vault.VaultConfigration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.core.TopicExchange;
import org.springframework.amqp.rabbit.connection.CachingConnectionFactory;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.listener.SimpleMessageListenerContainer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ConfigureRabbitMq {

    private final VaultConfigration vaultConfigration;

    public ConfigureRabbitMq(VaultConfigration vaultConfigration) {

        this.vaultConfigration = vaultConfigration;
    }
    @Value("${rabbitmq.RABBITMQ_HOST}")
    private String RabbitmqHost;
    @Value("${rabbitmq.QUEUE_NAME}")
    private String QueueName;

    public String getRabbitmqHost() {
        return RabbitmqHost;
    }

    public void setRabbitmqHost(String rabbitmqHost) {
        RabbitmqHost = rabbitmqHost;
    }

    @Value("${rabbitmq.EXCHANGE_NAME}")
    private String ExchangeName;
    @Value("${rabbitmq.ROUTING_KEY}")
    private String RoutingKey;

    public String getExchangeName() {
        return ExchangeName;
    }

    public void setExchangeName(String exchangeName) {
        ExchangeName = exchangeName;
    }

    @Bean
    Queue createQueue() {
        return new Queue(QueueName, false);
    }

    @Bean
    TopicExchange exchange() {
        return new TopicExchange(ExchangeName);
    }

    @Bean
    Binding binding(Queue queue, TopicExchange exchange) {
        return BindingBuilder.bind(queue).to(exchange).with(RoutingKey);
    }

    @Bean(name = "container")
    SimpleMessageListenerContainer container() {
        SimpleMessageListenerContainer container = new SimpleMessageListenerContainer();
        container.setConnectionFactory(rabbitConnectionFactory());
        return container;
    }
    @Bean
    public ConnectionFactory rabbitConnectionFactory() {
        CachingConnectionFactory connectionFactory = new CachingConnectionFactory(RabbitmqHost);
        System.out.println("RabbitmqHost:" + RabbitmqHost);
        System.out.println("username:" + vaultConfigration.getUsername());
        connectionFactory.setUsername(vaultConfigration.getUsername());
        connectionFactory.setPassword(vaultConfigration.getPassword());
        return connectionFactory;
    }
}
