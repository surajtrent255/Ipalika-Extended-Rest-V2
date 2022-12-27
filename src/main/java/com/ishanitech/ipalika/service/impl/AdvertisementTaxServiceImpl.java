package com.ishanitech.ipalika.service.impl;

import com.ishanitech.ipalika.config.properties.RestBaseProperty;
import com.ishanitech.ipalika.dao.AdvertisementTaxDAO;
//import com.ishanitech.ipalika.dao.EGovernanceDAO;
import com.ishanitech.ipalika.dto.AdvertisementTaxDTO;
import com.ishanitech.ipalika.exception.CustomSqlException;
import com.ishanitech.ipalika.service.AdvertisementTaxService;
import com.ishanitech.ipalika.service.DbService;
import com.ishanitech.ipalika.service.MailService;
import com.ishanitech.ipalika.utils.FileUtilService;
import org.jdbi.v3.core.JdbiException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Service
public class AdvertisementTaxServiceImpl implements AdvertisementTaxService {

    private final DbService dbService;
    private final MailService mailService;
    private final FileUtilService fileUtilService;

    @Autowired
    private RestBaseProperty restUrlProperty;

    public AdvertisementTaxServiceImpl(DbService dbService, MailService mailService, FileUtilService fileUtilService){
        this.dbService = dbService;
        this.mailService = mailService;
        this.fileUtilService = fileUtilService;
    }


    @Override
    public void addAdvertisementRegistration(AdvertisementTaxDTO advertisementRegistrationInfo) {
        try {
            dbService.getDao(AdvertisementTaxDAO.class).addNewEntity(advertisementRegistrationInfo);

//            String message = "";
//
//            message = "Your request for Advertisement Tax Registration Certificate has been successfully created and is awaiting verification. <br>"
//                    + " Please wait for admin to verify your account and bring this token to track the record..<br>"
//                    + " Your unique token id is " + advertisementRegistrationInfo.getTokenId() + ".";
//            mailService.sendEmail(message, advertisementRegistrationInfo.getEmail());
        } catch (JdbiException jex) {
            throw new CustomSqlException("Exception :" + jex.getLocalizedMessage());
        }
    }


    @Override
    public void addAllImages(MultipartFile image){
        fileUtilService.storeFile(image);
    }


    @Override
    public List<AdvertisementTaxDTO> getAdvertisementRegistrations(HttpServletRequest request) {
        List<AdvertisementTaxDTO> advertisementReg;
        try {
            advertisementReg = dbService.getDao(AdvertisementTaxDAO.class).getAdvertisementRegistrations();

            return advertisementReg;

        } catch (JdbiException jex) {
            throw new CustomSqlException("Exception: " + jex.getLocalizedMessage());
        }
    }


    @Override
    public List<AdvertisementTaxDTO> getAdvertisementCertificateByTokenId(String formId) {
        List<AdvertisementTaxDTO> advertisementInfo ;
//    = (List<AdvertisementTaxDTO>) new AdvertisementTaxDTO() error class java loader
        advertisementInfo = dbService.getDao(AdvertisementTaxDAO.class).getAdvertisementCertificateByTokenId(formId);


        return advertisementInfo;
    }


    @Override
    public void updateAdvertisementCertificateByTokenId(AdvertisementTaxDTO advertisementRegistrationInfo, String tokenId) {
        try {
            dbService.getDao(AdvertisementTaxDAO.class).updateAdvertisementRegistrationByTokenId(advertisementRegistrationInfo, tokenId);
            dbService.getDao(AdvertisementTaxDAO.class).approveAdvertisementRegistration(tokenId);
        } catch (JdbiException jex) {
            throw new CustomSqlException("Exception :" + jex.getLocalizedMessage());
        }
    }

    @Override
    public void updateCertificateStatus(String tokenId, Integer status, Integer formInfoId) {
        try {
            dbService.getDao(AdvertisementTaxDAO.class).updateStatus(tokenId, status, formInfoId);
        } catch (JdbiException jex) {
            throw new CustomSqlException("Exception : " + jex.getLocalizedMessage());
        }
    }
}
