package com.ishanitech.ipalika.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AliveCertificateDTO {

    private int id;
    private int formId ;
    private int elementId ;
    private String elementName;
    private String tokenId;
}
