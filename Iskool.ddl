-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema iskool
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `iskool` ;

-- -----------------------------------------------------
-- Schema iskool
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `iskool` DEFAULT CHARACTER SET utf8 ;
USE `iskool` ;

-- -----------------------------------------------------
-- Table `iskool`.`oauth_client_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`oauth_client_details` ;

CREATE TABLE IF NOT EXISTS `iskool`.`oauth_client_details` (
  `client_id` VARCHAR(256) NOT NULL,
  `resource_ids` VARCHAR(256) NULL DEFAULT NULL,
  `client_secret` VARCHAR(256) NOT NULL,
  `scope` VARCHAR(256) NULL DEFAULT NULL,
  `authorized_grant_types` VARCHAR(256) NULL DEFAULT NULL,
  `web_server_redirect_uri` VARCHAR(256) NULL DEFAULT NULL,
  `authorities` VARCHAR(256) NULL DEFAULT NULL,
  `access_token_validity` INT(11) NULL DEFAULT NULL,
  `refresh_token_validity` INT(11) NULL DEFAULT NULL,
  `additional_information` VARCHAR(4000) NULL DEFAULT NULL,
  `autoapprove` VARCHAR(256) NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `iskool`.`organization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`organization` ;

CREATE TABLE IF NOT EXISTS `iskool`.`organization` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(200) NOT NULL,
  `address` VARCHAR(500) NOT NULL,
  `oauth_client_details_client_id` VARCHAR(256) NOT NULL,
  PRIMARY KEY (`id`, `oauth_client_details_client_id`),
  CONSTRAINT `fk_organization_oauth_client_details1`
    FOREIGN KEY (`oauth_client_details_client_id`)
    REFERENCES `iskool`.`oauth_client_details` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_organization_oauth_client_details1_idx` ON `iskool`.`organization` (`oauth_client_details_client_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `iskool`.`academicyear`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`academicyear` ;

CREATE TABLE IF NOT EXISTS `iskool`.`academicyear` (
  `id` INT(11) NOT NULL,
  `startdate` DATETIME(6) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `enddate` DATETIME(6) NOT NULL,
  `organization_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_AcademicYear_Organization1`
    FOREIGN KEY (`organization_id`)
    REFERENCES `iskool`.`organization` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_AcademicYear_Organization1_idx` ON `iskool`.`academicyear` (`organization_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `iskool`.`authorities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`authorities` ;

CREATE TABLE IF NOT EXISTS `iskool`.`authorities` (
  `authority` VARCHAR(256) NOT NULL,
  `username` VARCHAR(256) NOT NULL,
  PRIMARY KEY (`authority`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `iskool`.`course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`course` ;

CREATE TABLE IF NOT EXISTS `iskool`.`course` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `durationinmonths` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `name_UNIQUE` ON `iskool`.`course` (`name` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `iskool`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`users` ;

CREATE TABLE IF NOT EXISTS `iskool`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(256) NOT NULL,
  `password` VARCHAR(256) NOT NULL,
  `enabled` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `unique_username` ON `iskool`.`users` (`username` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `iskool`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`student` ;

CREATE TABLE IF NOT EXISTS `iskool`.`student` (
  `id` INT(11) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `organization_id` INT(11) NOT NULL,
  `created` DATETIME NOT NULL,
  `lastupdated` VARCHAR(45) NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  CONSTRAINT `fk_User_Organization`
    FOREIGN KEY (`organization_id`)
    REFERENCES `iskool`.`organization` (`id`),
  CONSTRAINT `fk_student_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `iskool`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_User_Organization_idx` ON `iskool`.`student` (`organization_id` ASC) VISIBLE;

CREATE INDEX `fk_student_users1_idx` ON `iskool`.`student` (`user_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `iskool`.`course_student_mapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`course_student_mapping` ;

CREATE TABLE IF NOT EXISTS `iskool`.`course_student_mapping` (
  `id` INT(11) NOT NULL,
  `student_id` INT(11) NOT NULL,
  `course_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_CourseUserMapping_Course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `iskool`.`course` (`id`),
  CONSTRAINT `fk_CourseUserMapping_User1`
    FOREIGN KEY (`student_id`)
    REFERENCES `iskool`.`student` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_CourseUserMapping_User1_idx` ON `iskool`.`course_student_mapping` (`student_id` ASC) VISIBLE;

CREATE INDEX `fk_CourseUserMapping_Course1_idx` ON `iskool`.`course_student_mapping` (`course_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `iskool`.`subject_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`subject_type` ;

CREATE TABLE IF NOT EXISTS `iskool`.`subject_type` (
  `id` INT(11) NOT NULL,
  `subjecttype` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `subjecttype_UNIQUE` ON `iskool`.`subject_type` (`subjecttype` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `iskool`.`subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`subject` ;

CREATE TABLE IF NOT EXISTS `iskool`.`subject` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(150) NULL DEFAULT NULL,
  `subject_type_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Subject_SubjectType1`
    FOREIGN KEY (`subject_type_id`)
    REFERENCES `iskool`.`subject_type` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `id_UNIQUE` ON `iskool`.`subject` (`id` ASC) VISIBLE;

CREATE UNIQUE INDEX `name_UNIQUE` ON `iskool`.`subject` (`name` ASC) VISIBLE;

CREATE INDEX `fk_Subject_SubjectType1_idx` ON `iskool`.`subject` (`subject_type_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `iskool`.`course_subject_mapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`course_subject_mapping` ;

CREATE TABLE IF NOT EXISTS `iskool`.`course_subject_mapping` (
  `id` INT(11) NOT NULL,
  `course_id` INT(11) NOT NULL,
  `subject_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_CourseSubjectMapping_Course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `iskool`.`course` (`id`),
  CONSTRAINT `fk_CourseSubjectMapping_Subject1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `iskool`.`subject` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_CourseSubjectMapping_Course1_idx` ON `iskool`.`course_subject_mapping` (`course_id` ASC) VISIBLE;

CREATE INDEX `fk_CourseSubjectMapping_Subject1_idx` ON `iskool`.`course_subject_mapping` (`subject_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `iskool`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`department` ;

CREATE TABLE IF NOT EXISTS `iskool`.`department` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `organization_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Department_Organization1`
    FOREIGN KEY (`organization_id`)
    REFERENCES `iskool`.`organization` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_Department_Organization1_idx` ON `iskool`.`department` (`organization_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `iskool`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`employee` ;

CREATE TABLE IF NOT EXISTS `iskool`.`employee` (
  `id` INT(11) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `primarycontact` VARCHAR(45) NOT NULL,
  `secondarycontact` VARCHAR(45) NULL DEFAULT NULL,
  `organization_id` INT(11) NOT NULL,
  `created` DATETIME NOT NULL,
  `lastupdated` DATETIME NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  CONSTRAINT `fk_Employee_Organization1`
    FOREIGN KEY (`organization_id`)
    REFERENCES `iskool`.`organization` (`id`),
  CONSTRAINT `fk_employee_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `iskool`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `lastname_UNIQUE` ON `iskool`.`employee` (`lastname` ASC) VISIBLE;

CREATE UNIQUE INDEX `firstname_UNIQUE` ON `iskool`.`employee` (`firstname` ASC) VISIBLE;

CREATE UNIQUE INDEX `email_UNIQUE` ON `iskool`.`employee` (`email` ASC) VISIBLE;

CREATE INDEX `fk_Employee_Organization1_idx` ON `iskool`.`employee` (`organization_id` ASC) VISIBLE;

CREATE INDEX `fk_employee_users1_idx` ON `iskool`.`employee` (`user_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `iskool`.`department_employee_mapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`department_employee_mapping` ;

CREATE TABLE IF NOT EXISTS `iskool`.`department_employee_mapping` (
  `id` INT(11) NOT NULL,
  `department_id` INT(11) NOT NULL,
  `employee_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_DepartmentEmployeeMapping_Department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `iskool`.`department` (`id`),
  CONSTRAINT `fk_DepartmentEmployeeMapping_Employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `iskool`.`employee` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_DepartmentEmployeeMapping_Department1_idx` ON `iskool`.`department_employee_mapping` (`department_id` ASC) VISIBLE;

CREATE INDEX `fk_DepartmentEmployeeMapping_Employee1_idx` ON `iskool`.`department_employee_mapping` (`employee_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `iskool`.`employee_subject_mapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`employee_subject_mapping` ;

CREATE TABLE IF NOT EXISTS `iskool`.`employee_subject_mapping` (
  `id` INT(11) NOT NULL,
  `employee_id` INT(11) NOT NULL,
  `subject_id` INT(11) NOT NULL,
  `academicyear_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_EmployeeSubjectMapping_AcademicYear1`
    FOREIGN KEY (`academicyear_id`)
    REFERENCES `iskool`.`academicyear` (`id`),
  CONSTRAINT `fk_EmployeeSubjectMapping_Employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `iskool`.`employee` (`id`),
  CONSTRAINT `fk_EmployeeSubjectMapping_Subject1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `iskool`.`subject` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_EmployeeSubjectMapping_Employee1_idx` ON `iskool`.`employee_subject_mapping` (`employee_id` ASC) VISIBLE;

CREATE INDEX `fk_EmployeeSubjectMapping_Subject1_idx` ON `iskool`.`employee_subject_mapping` (`subject_id` ASC) VISIBLE;

CREATE INDEX `fk_EmployeeSubjectMapping_AcademicYear1_idx` ON `iskool`.`employee_subject_mapping` (`academicyear_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `iskool`.`oauth_access_token`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`oauth_access_token` ;

CREATE TABLE IF NOT EXISTS `iskool`.`oauth_access_token` (
  `token_id` VARCHAR(256) NULL DEFAULT NULL,
  `token` BLOB NULL DEFAULT NULL,
  `authentication_id` VARCHAR(256) NULL DEFAULT NULL,
  `user_name` VARCHAR(256) NULL DEFAULT NULL,
  `client_id` VARCHAR(256) NULL DEFAULT NULL,
  `authentication` BLOB NULL DEFAULT NULL,
  `refresh_token` VARCHAR(256) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `iskool`.`oauth_client_token`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`oauth_client_token` ;

CREATE TABLE IF NOT EXISTS `iskool`.`oauth_client_token` (
  `token_id` VARCHAR(256) NULL DEFAULT NULL,
  `token` BLOB NULL DEFAULT NULL,
  `authentication_id` VARCHAR(256) NOT NULL,
  `user_name` VARCHAR(256) NULL DEFAULT NULL,
  `client_id` VARCHAR(256) NULL DEFAULT NULL,
  PRIMARY KEY (`authentication_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `iskool`.`oauth_code`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`oauth_code` ;

CREATE TABLE IF NOT EXISTS `iskool`.`oauth_code` (
  `code` VARCHAR(256) NULL DEFAULT NULL,
  `authentication` BLOB NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `iskool`.`oauth_refresh_token`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`oauth_refresh_token` ;

CREATE TABLE IF NOT EXISTS `iskool`.`oauth_refresh_token` (
  `token_id` VARCHAR(256) NULL DEFAULT NULL,
  `token` BLOB NULL DEFAULT NULL,
  `authentication` BLOB NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `iskool`.`parent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`parent` ;

CREATE TABLE IF NOT EXISTS `iskool`.`parent` (
  `id` INT(11) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `mobile` VARCHAR(45) NOT NULL,
  `created` DATETIME NOT NULL,
  `lastupdated` DATETIME NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  CONSTRAINT `fk_parent_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `iskool`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_parent_users1_idx` ON `iskool`.`parent` (`user_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `iskool`.`section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`section` ;

CREATE TABLE IF NOT EXISTS `iskool`.`section` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `Course_id` INT(11) NOT NULL,
  `Student_id` INT(11) NOT NULL,
  `class_teacher_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Section_Course1`
    FOREIGN KEY (`Course_id`)
    REFERENCES `iskool`.`course` (`id`),
  CONSTRAINT `fk_Section_Employee1`
    FOREIGN KEY (`class_teacher_id`)
    REFERENCES `iskool`.`employee` (`id`),
  CONSTRAINT `fk_Section_Student1`
    FOREIGN KEY (`Student_id`)
    REFERENCES `iskool`.`student` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `name_UNIQUE` ON `iskool`.`section` (`name` ASC) VISIBLE;

CREATE INDEX `fk_Section_Course1_idx` ON `iskool`.`section` (`Course_id` ASC) VISIBLE;

CREATE INDEX `fk_Section_Student1_idx` ON `iskool`.`section` (`Student_id` ASC) VISIBLE;

CREATE INDEX `fk_Section_Employee1_idx` ON `iskool`.`section` (`class_teacher_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `iskool`.`section_academicyear_mapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`section_academicyear_mapping` ;

CREATE TABLE IF NOT EXISTS `iskool`.`section_academicyear_mapping` (
  `id` INT(11) NOT NULL,
  `academicyear_id` INT(11) NOT NULL,
  `section_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_SectionAcademicYearMapping_AcademicYear1`
    FOREIGN KEY (`academicyear_id`)
    REFERENCES `iskool`.`academicyear` (`id`),
  CONSTRAINT `fk_SectionAcademicYearMapping_Section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `iskool`.`section` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_SectionAcademicYearMapping_AcademicYear1_idx` ON `iskool`.`section_academicyear_mapping` (`academicyear_id` ASC) VISIBLE;

CREATE INDEX `fk_SectionAcademicYearMapping_Section1_idx` ON `iskool`.`section_academicyear_mapping` (`section_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `iskool`.`student_electives_academicyear_mapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`student_electives_academicyear_mapping` ;

CREATE TABLE IF NOT EXISTS `iskool`.`student_electives_academicyear_mapping` (
  `id` INT(11) NOT NULL,
  `Student_id` INT(11) NOT NULL,
  `Subject_id` INT(11) NOT NULL,
  `AcademicYear_id` INT(11) NOT NULL,
  `Employee_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_StudentSubjectAcademicYear_AcademicYear1`
    FOREIGN KEY (`AcademicYear_id`)
    REFERENCES `iskool`.`academicyear` (`id`),
  CONSTRAINT `fk_StudentSubjectAcademicYear_Employee1`
    FOREIGN KEY (`Employee_id`)
    REFERENCES `iskool`.`employee` (`id`),
  CONSTRAINT `fk_StudentSubjectAcademicYear_Student1`
    FOREIGN KEY (`Student_id`)
    REFERENCES `iskool`.`student` (`id`),
  CONSTRAINT `fk_StudentSubjectAcademicYear_Subject1`
    FOREIGN KEY (`Subject_id`)
    REFERENCES `iskool`.`subject` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_StudentSubjectAcademicYear_Student1_idx` ON `iskool`.`student_electives_academicyear_mapping` (`Student_id` ASC) VISIBLE;

CREATE INDEX `fk_StudentSubjectAcademicYear_Subject1_idx` ON `iskool`.`student_electives_academicyear_mapping` (`Subject_id` ASC) VISIBLE;

CREATE INDEX `fk_StudentSubjectAcademicYear_AcademicYear1_idx` ON `iskool`.`student_electives_academicyear_mapping` (`AcademicYear_id` ASC) VISIBLE;

CREATE INDEX `fk_StudentSubjectAcademicYear_Employee1_idx` ON `iskool`.`student_electives_academicyear_mapping` (`Employee_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `iskool`.`student_parent_mapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`student_parent_mapping` ;

CREATE TABLE IF NOT EXISTS `iskool`.`student_parent_mapping` (
  `id` INT(11) NOT NULL,
  `student_id` INT(11) NOT NULL,
  `parent_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_StudentParentMapping_Parent1`
    FOREIGN KEY (`parent_id`)
    REFERENCES `iskool`.`parent` (`id`),
  CONSTRAINT `fk_StudentParentMapping_Student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `iskool`.`student` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_StudentParentMapping_Student1_idx` ON `iskool`.`student_parent_mapping` (`student_id` ASC) VISIBLE;

CREATE INDEX `fk_StudentParentMapping_Parent1_idx` ON `iskool`.`student_parent_mapping` (`parent_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `iskool`.`student_subject_employee_mapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`student_subject_employee_mapping` ;

CREATE TABLE IF NOT EXISTS `iskool`.`student_subject_employee_mapping` (
  `id` INT(11) NOT NULL,
  `employee_subject_mapping_id` INT(11) NOT NULL,
  `student_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_CourseSubjectFacultyMapping_EmployeeSubjectMapping1`
    FOREIGN KEY (`employee_subject_mapping_id`)
    REFERENCES `iskool`.`employee_subject_mapping` (`id`),
  CONSTRAINT `fk_StudentSubjectEmployeeMapping_Student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `iskool`.`student` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_CourseSubjectFacultyMapping_EmployeeSubjectMapping1_idx` ON `iskool`.`student_subject_employee_mapping` (`employee_subject_mapping_id` ASC) VISIBLE;

CREATE INDEX `fk_StudentSubjectEmployeeMapping_Student1_idx` ON `iskool`.`student_subject_employee_mapping` (`student_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `iskool`.`user_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iskool`.`user_type` ;

CREATE TABLE IF NOT EXISTS `iskool`.`user_type` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(256) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
