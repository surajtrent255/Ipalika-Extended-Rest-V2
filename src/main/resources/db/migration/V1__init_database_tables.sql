CREATE TABLE IF NOT EXISTS `user` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`full_name` VARCHAR(30) NOT NULL COLLATE 'utf8_general_ci',
	`username` VARCHAR(30) NOT NULL COLLATE 'utf8_general_ci',
	`email` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`password` VARCHAR(60) NOT NULL COLLATE 'utf8_general_ci',
	`mobile_number` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`locked` BIT(1) NOT NULL DEFAULT b'1',
	`first_login` BIT(1) NULL DEFAULT b'1',
	`enabled` BIT(1) NOT NULL DEFAULT b'1',
	`expired` BIT(1) NOT NULL DEFAULT b'1',
	`registered_date` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	`ward_no` INT(11) NOT NULL DEFAULT '1',
	`signature` varchar(200) DEFAULT NULL,
	`stamp` varchar(200) DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `username` (`username`) USING BTREE,
	UNIQUE INDEX `mobile_number` (`mobile_number`) USING BTREE,
	UNIQUE INDEX `email` (`email`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE IF NOT EXISTS `role` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`role` VARCHAR(15) NOT NULL,
	`role_nepali` VARCHAR(15) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `registration_report` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`form_info_id` INT(11) NOT NULL,
	`form_title` VARCHAR(150) NOT NULL,
	 `unverified` INT(11) NOT NULL,
	 `stamped` INT(11) NOT NULL,
	 `registered` INT(11) NOT NULL,
	 `processed` INT(11) NOT NULL,
	 `verified` INT(11) NOT NULL,
	 `total` INT(11) NOT NULL,

	 PRIMARY KEY (`id`),
	 UNIQUE KEY `form_info_id` (`form_info_id`)
);

CREATE TABLE IF NOT EXISTS `form_info` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`form_type` VARCHAR(150) NOT NULL,
	`form_description` VARCHAR(150) NOT NULL,

	PRIMARY KEY (`id`),
	 UNIQUE KEY `form_type` (`form_type`)
);

CREATE TABLE IF NOT EXISTS `user_role` (
	`user_id` INT(11) NOT NULL,
	`role_id` INT(11) NOT NULL,
	PRIMARY KEY (`user_id`, `role_id`)
);

CREATE TABLE IF NOT EXISTS `form` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`form_id` VARCHAR(50) NOT NULL DEFAULT '0',
	`form_name` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE INDEX `form_id` (`form_id`)
);

CREATE TABLE IF NOT EXISTS `differently_abled` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `differently_abled_nep` varchar(200) DEFAULT NULL,
  `differently_abled_eng` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

CREATE TABLE IF NOT EXISTS `gender` (
	`gender_id` INT(11) NOT NULL AUTO_INCREMENT,
	`gender_nepali` VARCHAR(45) DEFAULT NULL,
	`gender_english` VARCHAR(45) DEFAULT NULL,
	PRIMARY KEY (`gender_id`)
);

CREATE TABLE IF NOT EXISTS `academic_qualification` (
  `qualification_id` INT(11) NOT NULL AUTO_INCREMENT,
  `qualification_nep` VARCHAR(50) DEFAULT NULL,
  `qualification_eng` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`qualification_id`)
);

CREATE TABLE IF NOT EXISTS `districts` (
  `district_id` INT(11) NOT NULL AUTO_INCREMENT,
  `district_name_nep` VARCHAR(50) NOT NULL,
  `district_name_eng` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`district_id`)
);

CREATE TABLE IF NOT EXISTS `favourite_place_type` (
  `type_id` INT(11) NOT NULL AUTO_INCREMENT,
  `place_type_nep` VARCHAR(50) NOT NULL,
  `place_type_eng` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`type_id`)
);

CREATE TABLE IF NOT EXISTS `marital_status` (
  `marital_status_id` INT(11) NOT NULL AUTO_INCREMENT,
  `marital_status_nep` VARCHAR(50) NOT NULL,
  `marital_status_eng` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`marital_status_id`)
);

CREATE TABLE IF NOT EXISTS `ward` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`ward_number` INT(11) NOT NULL,
	`location` VARCHAR(100) NOT NULL DEFAULT '0',
	`name` VARCHAR(100) NOT NULL DEFAULT '0',
	`ward_description` TEXT,
	`main_person` VARCHAR(5000) NOT NULL DEFAULT '0',
	`contact_no` VARCHAR(50) NOT NULL DEFAULT '0',
	`building_image` VARCHAR(300) DEFAULT '0',
	PRIMARY KEY (`id`),
	UNIQUE KEY `ward_number_UNIQUE` (`ward_number`)
);

-- Dumping structure for table igas.lg_districts
CREATE TABLE IF NOT EXISTS `lg_districts` (
  `district_id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `province_id` int NOT NULL,
  `disabled` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='List of Districts';


-- Dumping structure for table ipalika.lg_municipality
CREATE TABLE IF NOT EXISTS `lg_municipality` (
  `municipality_id` int NOT NULL AUTO_INCREMENT,
  `municipality_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `province_id` int NOT NULL,
  `district_id` int NOT NULL,
  `disabled` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`municipality_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='List of Municipality';


-- Dumping structure for table ipalika.lg_province
CREATE TABLE IF NOT EXISTS `lg_province` (
  `province_id` int NOT NULL AUTO_INCREMENT,
  `province_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `disabled` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`province_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Provinces of Nepal';


-- Dumping structure for table ipalika.lg_ward
CREATE TABLE IF NOT EXISTS `lg_ward` (
  `ward_id` int NOT NULL AUTO_INCREMENT,
  `ward_description` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `municipality_id` int NOT NULL DEFAULT '0',
  `disabled` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ward_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS status_level (
    type_id INT(11) NOT NULL AUTO_INCREMENT,
    type_name VARCHAR(20) NOT NULL DEFAULT '0',
    PRIMARY KEY (type_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='verification status level';

CREATE TABLE IF NOT EXISTS `egovernance_sanrakshyak_sasthagat_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_guardian_institutional_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_personal_detail_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_personal_detail_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_school_shifting_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_school_shifting_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_industry_shifting_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_industry_shifting_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_mohi_lagat_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_mohi_lagat_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_house_land_transfer_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_house_land_transfer_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_homeroad_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_homeroad_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_malpot_bhumikar_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_malpot_bhumikar_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_advertisement_tax_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_advertisement_tax_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_property_tax_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_property_tax_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_reconciliation_paper_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_reconciliation_paper_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_char_killa_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_char_killa_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_institution_register_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_institution_register_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_free_healthcare_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_free_healthcare_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_land_register_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_land_register_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_school_operation_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_school_operation_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_internal_residence_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_internal_residence_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_court_fee_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_court_fee_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_business_closure_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_business_closure_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_angikrit_citizenship_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_angikrit_citizenship_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_citizenship_and_copy_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_citizenship_and_copy_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_resettlement_register_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_resettlement_register_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_business_register_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_business_register_log_table';

CREATE TABLE IF NOT EXISTS `egovernance_quadruped_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_quadruped_log_table';

CREATE TABLE IF NOT EXISTS forms_table(
`form_id` INT(11) NOT NULL AUTO_INCREMENT,
`form_name` VARCHAR(50) NOT NULL,
`form_table` VARCHAR(100) NOT NULL,
PRIMARY KEY (`form_id`),
UNIQUE INDEX `form_name` (`form_name`) USING BTREE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='form table that hold unique id of form and table name ';

CREATE TABLE IF NOT EXISTS forms_details(
`id` INT(11) NOT NULL AUTO_INCREMENT,
`form_id` INT(11) NOT NULL,
`element_id` INT(11) NOT NULL,
`element_name` VARCHAR(100) NOT NULL,
`element_type` VARCHAR(100) NOT NULL,
PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='form details hold garcha';

CREATE TABLE IF NOT EXISTS `element_type` (
`type_id` INT(11) NOT NULL AUTO_INCREMENT,
`type_name` VARCHAR(20) NOT NULL DEFAULT '0',
PRIMARY KEY (`type_id`)
);

-- Dumping structure for table ipalika.egovernance_birth_certificate

CREATE TABLE IF NOT EXISTS `egovernance_birth_certificate`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='birthcertificates';



CREATE TABLE IF NOT EXISTS `egovernance_birth_certificate_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='birthcertificate_log';


-- Dumping structure for table ipalika.egovernance_relationship_living

CREATE TABLE IF NOT EXISTS `egovernance_relationship_living`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_relationship_living';



CREATE TABLE IF NOT EXISTS `egovernance_relationship_living_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_relationship_living';




-- Dumping structure for table ipalika.egovernance_relationship_deceased

CREATE TABLE IF NOT EXISTS `egovernance_relationship_deceased`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_relationship_deceased';



CREATE TABLE IF NOT EXISTS `egovernance_relationship_deceased_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_relationship_deceased';


-- Dumping structure for table ipalika.egovernance_marriage_certificate

CREATE TABLE IF NOT EXISTS `egovernance_marriage_certificate`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_marriage_certificate';



CREATE TABLE IF NOT EXISTS `egovernance_marriage_certificate_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_marriage_certificate_status_table';



-- Dumping structure for table ipalika.egovernance_death_certificate

CREATE TABLE IF NOT EXISTS `egovernance_death_certificate`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_death_certificate';



CREATE TABLE IF NOT EXISTS `egovernance_marriage_certificate_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_death_certificate_status_table';




-- Dumping structure for table ipalika.egovernance_divorce_certificate

CREATE TABLE IF NOT EXISTS `egovernance_divorce_certificate`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_divorce_certificate';



CREATE TABLE IF NOT EXISTS `egovernance_divorce_certificate_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_divorce_certificate_status_table';

-- Dumping structure for table ipalika.egovernance_disabled_certificate

CREATE TABLE IF NOT EXISTS `egovernance_disabled_certificate`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_disabled_certificate';



CREATE TABLE IF NOT EXISTS `egovernance_disabled_certificate_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_disabled_certificate_status_table';




-- Dumping structure for table ipalika.egovernance_marriage_verification

CREATE TABLE IF NOT EXISTS `egovernance_marriage_verification`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_marriage_verification';



CREATE TABLE IF NOT EXISTS `egovernance_marriage_verification_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_marriage_verification_table';



-- Dumping structure for table ipalika.egovernance_marriage_verification

CREATE TABLE IF NOT EXISTS `egovernance_marriage_verification`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_marriage_verification';



CREATE TABLE IF NOT EXISTS `egovernance_marriage_verification_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_marriage_verification_table';


-- Dumping structure for table ipalika.egovernance_alive_certificate

CREATE TABLE IF NOT EXISTS `egovernance_alive_certificate`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_alive_certificate';



CREATE TABLE IF NOT EXISTS `egovernance_alive_certificate_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_alive_certificate_table';



-- Dumping structure for table ipalika.egovernance_minor_certificate

CREATE TABLE IF NOT EXISTS `egovernance_minor_certificate`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_minor_certificate';



CREATE TABLE IF NOT EXISTS `egovernance_minor_certificate_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_minor_certificate_table';

-- Dumping structure for table ipalika.egovernance_scholarship_certificate

CREATE TABLE IF NOT EXISTS `egovernance_scholarship_certificate`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_scholarship_certificate';

CREATE TABLE IF NOT EXISTS `egovernance_scholarship_certificate_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_scholarship_certificate_table';

-- Dumping structure for table ipalika.egovernance_birth_verification

CREATE TABLE IF NOT EXISTS `egovernance_birth_verification`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_birth_verification';

CREATE TABLE IF NOT EXISTS `egovernance_birth_verification_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_birth_verification_table';

-- Dumping structure for table ipalika.egovernance_permanent_residence

CREATE TABLE IF NOT EXISTS `egovernance_permanent_residence`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_permanent_residence';

CREATE TABLE IF NOT EXISTS `egovernance_permanent_residence_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_permanent_residence_table';

-- Dumping structure for table ipalika.egovernance_pipeline_connection

CREATE TABLE IF NOT EXISTS `egovernance_pipeline_connection`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_pipeline_connection';

CREATE TABLE IF NOT EXISTS `egovernance_pipeline_connection_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_pipeline_connection_table';

-- Dumping structure for table ipalika.egovernance_land_marking

CREATE TABLE IF NOT EXISTS `egovernance_land_marking`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_land_marking';

CREATE TABLE IF NOT EXISTS `egovernance_land_marking_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_land_marking_table';



-- Dumping structure for table ipalika.egovernance_bahal_tax

CREATE TABLE IF NOT EXISTS `egovernance_bahal_tax`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_bahal_tax';



CREATE TABLE IF NOT EXISTS `egovernance_bahal_tax_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_bahal_tax_table';



-- Dumping structure for table ipalika.egovernance_house_building

CREATE TABLE IF NOT EXISTS `egovernance_house_building`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_house_building';

CREATE TABLE IF NOT EXISTS `egovernance_house_building_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_house_building_table';


-- Dumping structure for table ipalika.egovernance_ghar_kayam

CREATE TABLE IF NOT EXISTS `egovernance_ghar_kayam`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_ghar_kayam';

CREATE TABLE IF NOT EXISTS `egovernance_ghar_kayam_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_ghar_kayam_table';




-- Dumping structure for table ipalika.egovernance_poor_economy

CREATE TABLE IF NOT EXISTS `egovernance_poor_economy`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_poor_economy';



CREATE TABLE IF NOT EXISTS `egovernance_poor_economy_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_poor_economy_table';


-- Dumping structure for table ipalika.egovernance_english_verification

CREATE TABLE IF NOT EXISTS `egovernance_english_verification`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_english_verification';



CREATE TABLE IF NOT EXISTS `egovernance_english_verification_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_english_verification_table';

-- Dumping structure for table ipalika.egovernance_manjurinama_verification

CREATE TABLE IF NOT EXISTS `egovernance_manjurinama_verification`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_manjurinama_verification';



CREATE TABLE IF NOT EXISTS `egovernance_manjurinama_verification_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_manjurinama_verification_table';














-- Dumping structure for table ipalika.egovernance_ghar_patal

CREATE TABLE IF NOT EXISTS `egovernance_ghar_patal`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_ghar_patal';



CREATE TABLE IF NOT EXISTS `egovernance_ghar_patal_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_ghar_patal_table';




-- Dumping structure for table ipalika.egovernance_strong_economy

CREATE TABLE IF NOT EXISTS `egovernance_strong_economy`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_strong_economy';



CREATE TABLE IF NOT EXISTS `egovernance_strong_economy_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_strong_economy_table';





-- Dumping structure for table ipalika.egovernance_electricity_connection

CREATE TABLE IF NOT EXISTS `egovernance_electricity_connection`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_electricity_connection';



CREATE TABLE IF NOT EXISTS `egovernance_electricity_connection_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_electricity_connection_table';





-- Dumping structure for table ipalika.egovernance_two_names

CREATE TABLE IF NOT EXISTS `egovernance_two_names`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_two_names';



CREATE TABLE IF NOT EXISTS `egovernance_two_names_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_two_names_table';




-- Dumping structure for table ipalika.egovernance_land_valuation

CREATE TABLE IF NOT EXISTS `egovernance_land_valuation`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_land_valuation';



CREATE TABLE IF NOT EXISTS `egovernance_land_valuation_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_land_valuation_table';




-- Dumping structure for table ipalika.egovernance_business_not_operating

CREATE TABLE IF NOT EXISTS `egovernance_business_not_operating`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_business_not_operating';



CREATE TABLE IF NOT EXISTS `egovernance_business_not_operating_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_business_not_operating_table';




-- Dumping structure for table ipalika.egovernance_land_dhanipurja

CREATE TABLE IF NOT EXISTS `egovernance_land_dhanipurja`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_land_dhanipurja';



CREATE TABLE IF NOT EXISTS `egovernance_land_dhanipurja_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_land_dhanipurja_table';




-- Dumping structure for table ipalika.egovernance_rightful_person

CREATE TABLE IF NOT EXISTS `egovernance_rightful_person`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_rightful_person';



CREATE TABLE IF NOT EXISTS `egovernance_rightful_person_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_rightful_person_table';




-- Dumping structure for table ipalika.egovernance_details_disclosure

CREATE TABLE IF NOT EXISTS `egovernance_details_disclosure`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_details_disclosure';



CREATE TABLE IF NOT EXISTS `egovernance_details_disclosure_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_details_disclosure_table';

-- Dumping structure for table ipalika.egovernance_kotha_kholna_karya

CREATE TABLE IF NOT EXISTS `egovernance_kotha_kholna_karya`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_kotha_kholna_karya';

CREATE TABLE IF NOT EXISTS `egovernance_kotha_kholna_karya_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_kotha_kholna_karya_table';

-- Dumping structure for table ipalika.egovernance_bato_kayam

CREATE TABLE IF NOT EXISTS `egovernance_bato_kayam`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_bato_kayam';

CREATE TABLE IF NOT EXISTS `egovernance_bato_kayam_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_bato_kayam_table';

-- Dumping structure for table ipalika.egovernance_sanrakshyak_byaktigat

CREATE TABLE IF NOT EXISTS `egovernance_sanrakshyak_byaktigat`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_sanrakshyak_byaktigat';

CREATE TABLE IF NOT EXISTS `egovernance_sanrakshyak_byaktigat_log`(
`token_id` VARCHAR(50)  NOT NULL,
`status` INT(11) NOT NULL,
`status_1_by` VARCHAR(50) NOT NULL,
`status_1_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_2_by` VARCHAR(50) NOT NULL,
`status_2_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_3_by` VARCHAR(50) NOT NULL,
`status_3_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_4_by` VARCHAR(50) NOT NULL,
`status_4_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_5_by` VARCHAR(50) NOT NULL,
`status_5_in` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(),
`status_6_by` VARCHAR(50) ,
`status_6_in` TIMESTAMP  DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_sanrakshyak_byaktigat_table';

CREATE TABLE IF NOT EXISTS `egovernance_sanrakshyak_sasthagat`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_guardian_institutional';

CREATE TABLE IF NOT EXISTS `egovernance_personal_detail`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_personal_detail';

CREATE TABLE IF NOT EXISTS `egovernance_school_shifting`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_school_shifting';

CREATE TABLE IF NOT EXISTS `egovernance_industry_shifting`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_industry_shifting';

CREATE TABLE IF NOT EXISTS `egovernance_mohi_lagat`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_mohi_lagat';

CREATE TABLE IF NOT EXISTS `egovernance_house_land_transfer`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_house_land_transfer';

CREATE TABLE IF NOT EXISTS `egovernance_homeroad`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_homeroad';

CREATE TABLE IF NOT EXISTS `egovernance_malpot_bhumikar`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_malpot_bhumikar';

CREATE TABLE IF NOT EXISTS `egovernance_advertisement_tax`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_advertisement_tax';

CREATE TABLE IF NOT EXISTS `egovernance_property_tax`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_property_tax';

CREATE TABLE IF NOT EXISTS `egovernance_reconciliation_paper`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_reconciliation_paper';

CREATE TABLE IF NOT EXISTS `egovernance_char_killa`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_char_killa';

CREATE TABLE IF NOT EXISTS `egovernance_institution_register`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_institution_register';

CREATE TABLE IF NOT EXISTS `egovernance_free_healthcare`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_free_healthcare';

CREATE TABLE IF NOT EXISTS `egovernance_land_register`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_land_register';

CREATE TABLE IF NOT EXISTS `egovernance_school_operation`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_school_operation';

CREATE TABLE IF NOT EXISTS `egovernance_internal_residence`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_internal_residence';

CREATE TABLE IF NOT EXISTS `egovernance_court_fee`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_court_fee';

CREATE TABLE IF NOT EXISTS `egovernance_business_closure`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_business_closure';

CREATE TABLE IF NOT EXISTS `egovernance_angikrit_citizenship`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_angikrit_citizenship';

CREATE TABLE IF NOT EXISTS `egovernance_citizenship_and_copy`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_citizenship_and_copy';

CREATE TABLE IF NOT EXISTS `egovernance_resettlement_register`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_resettlement_register';

CREATE TABLE IF NOT EXISTS `egovernance_business_register`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_business_register';

CREATE TABLE IF NOT EXISTS `egovernance_quadruped`(
`form_id` INT NOT NULL ,
`element_id` INT NOT NULL,
`element_data` VARCHAR(50) NOT NULL,
`token_id` VARCHAR(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='egovernance_quadruped';






