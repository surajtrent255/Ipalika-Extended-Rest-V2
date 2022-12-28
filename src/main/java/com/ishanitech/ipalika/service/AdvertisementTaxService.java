package com.ishanitech.ipalika.service;

import com.ishanitech.ipalika.dto.AdvertisementTaxDTO;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface AdvertisementTaxService {

    void addAdvertisementRegistration(List<AdvertisementTaxDTO> advertisementRegistrationInfo);

    public void addAllImages(MultipartFile image);

    List<AdvertisementTaxDTO> getAdvertisementRegistrations(HttpServletRequest request);

    List<AdvertisementTaxDTO> getAdvertisementCertificateByTokenId(String tokenId);

    void updateAdvertisementCertificateByTokenId(List<AdvertisementTaxDTO> advertisementRegistrationInfo, String tokenId);

    void updateCertificateStatus(String formId, Integer status, Integer formInfoId);

}
