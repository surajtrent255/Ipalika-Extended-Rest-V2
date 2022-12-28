package com.ishanitech.ipalika.controller;

import com.ishanitech.ipalika.dto.AdvertisementTaxDTO;
import com.ishanitech.ipalika.dto.ResponseDTO;
import com.ishanitech.ipalika.exception.CustomSqlException;
import com.ishanitech.ipalika.exception.EntityNotFoundException;
import com.ishanitech.ipalika.exception.FileStorageException;
import com.ishanitech.ipalika.service.AdvertisementTaxService;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Slf4j
@RequestMapping("/e-governance")
@RestController
public class AdvertisementTaxController {

    private final AdvertisementTaxService advertisementTaxService;

    private AdvertisementTaxController(AdvertisementTaxService advertisementTaxService){this.advertisementTaxService = advertisementTaxService;}


    @ResponseStatus(HttpStatus.OK)
    @GetMapping("/advertisement")
    public ResponseDTO<List<AdvertisementTaxDTO>> getAdvertisementRegistrations(HttpServletRequest request) {
        return new ResponseDTO<>(advertisementTaxService.getAdvertisementRegistrations(request));
    }


    @ResponseStatus(HttpStatus.OK)
    @GetMapping("/advertisement/{tokenId}")
    public ResponseDTO<List<AdvertisementTaxDTO>> getAdvertisementCertificateByTokenId(@PathVariable("tokenId") String tokenId)
            throws EntityNotFoundException {
        return new ResponseDTO<List<AdvertisementTaxDTO>>(advertisementTaxService.getAdvertisementCertificateByTokenId(tokenId));
    }


    @ResponseStatus(HttpStatus.OK)
    @PutMapping("/advertisement/{tokenId}")
    public void updateAdvertisementCertificateByTokenId(@RequestBody List<AdvertisementTaxDTO> advertisementRegistrationInfo, @PathVariable("tokenId") String tokenId)
            throws CustomSqlException {
        log.info("tokenId " + tokenId);
        advertisementTaxService.updateAdvertisementCertificateByTokenId(advertisementRegistrationInfo, tokenId);
    }


    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/advertisement")
    @ApiOperation("Add Advertisement Tax Registration")
    public void addAdvertisementRegistration(HttpServletResponse http, @RequestBody List<AdvertisementTaxDTO> advertisementRegistrationInfo)
            throws CustomSqlException {
        advertisementTaxService.addAdvertisementRegistration(advertisementRegistrationInfo);
    }


    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/advertisement/image")
    public void addAllImages(@RequestParam("picture") MultipartFile image) throws FileStorageException {
        advertisementTaxService.addAllImages(image);
    }


    @ResponseStatus(HttpStatus.OK)
    @PutMapping("/advertisement/status/{tokenId}/{status}/{formInfoId}")
    public void updateCertificateStatusByTokenId(@PathVariable("tokenId") String tokenId,
                                                         @PathVariable("status") Integer status,
                                                         @PathVariable("formInfoId") Integer formInfoId)
            throws EntityNotFoundException {
        advertisementTaxService.updateCertificateStatus(tokenId, status, formInfoId);
    }
}
