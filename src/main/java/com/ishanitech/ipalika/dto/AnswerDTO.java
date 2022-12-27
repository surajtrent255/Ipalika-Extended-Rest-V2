package com.ishanitech.ipalika.dto;

import lombok.Data;

@Data
public class AnswerDTO {
    private int id;
    private int formId ;
    private int elementId ;
    private String elementName;
    private String tokenId;

}
