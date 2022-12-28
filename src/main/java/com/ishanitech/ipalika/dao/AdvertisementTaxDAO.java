package com.ishanitech.ipalika.dao;

import com.ishanitech.ipalika.dto.AdvertisementTaxDTO;
import com.ishanitech.ipalika.utils.FormInfoUtil;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.SqlBatch;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.transaction.Transaction;

import java.util.List;

public interface AdvertisementTaxDAO extends CommonDAO{
    @SqlQuery("SELECT * FROM egovernance_advertisement_tax")
    @RegisterBeanMapper(AdvertisementTaxDTO.class)
    List<AdvertisementTaxDTO> getAdvertisementRegistrations();

    @SqlBatch("INSERT INTO egovernance_advertisement_tax (form_id, element_id,element_data, token_id) VALUES(:formId, :elementId, :elementData,:tokenId)")
    void addAdvertisementRegistration(@BindBean List<AdvertisementTaxDTO> advertisementRegistrationInfo);
    @Transaction
    default void addNewEntity(List<AdvertisementTaxDTO> advertisementRegistrationInfo) {
         addAdvertisementRegistration(advertisementRegistrationInfo);
        updateRegistrationReportForm(1, FormInfoUtil.ADVERTISEMENT_TAX.getFormId());
    }

    @SqlQuery("SELECT * FROM egovernance_advertisement_tax WHERE form_id = :formId")
    @RegisterBeanMapper(AdvertisementTaxDTO.class)
    List<AdvertisementTaxDTO> getAdvertisementCertificateByTokenId(@Bind("formId") String formId);

    @SqlBatch("UPDATE egovernance_advertisement_tax SET   element_data =:elementData WHERE form_id =:formId and element_id =:elementId and token_id =:tokenId" )
    void updateAdvertisementRegistrationByTokenId(@BindBean List<AdvertisementTaxDTO> advertisementRegistrationInfo, @Bind("formId") String formId);

    @SqlUpdate("UPDATE egovernance_advertisement_tax_log SET status = 1 WHERE token_id =:tokenId")
    void approveAdvertisementRegistration(@Bind("tokenId") String tokenId);

    @SqlUpdate("UPDATE egovernance_advertisement_tax_log SET status =:status WHERE token_id =:tokenId")
    void updateEntityStatus(@Bind("tokenId") String tokenId, @Bind("status") Integer status);

    @Transaction
    default	void updateStatus(String tokenId, Integer status, Integer formInfoId){
        updateEntityStatus(tokenId, status);
        updateRegistrationReportForm(status, formInfoId) ;
    }
}
