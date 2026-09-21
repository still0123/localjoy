package com.lexiang.mq;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderPayMessage implements Serializable {

    private Long orderId;

    private Integer payType;
}
