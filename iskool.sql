-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

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
-- Table `organization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `organization` ;

CREATE TABLE IF NOT EXISTS `organization` (
  `id` INT NOT NULL,
  `name` VARCHAR(200) NOT NULL,
  `address` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `student` ;

CREATE TABLE IF NOT EXISTS `student` (
  `id` INT NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `studentid` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  `organization_id` INT NOT NULL,
  `enabled` INT NOT NULL,
  `expired` INT NOT NULL,
  `locked` VARCHAR(45) NOT NULL,
  `created` DATETIME NOT NULL,
  `lastupdated` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_User_Organization`
    FOREIGN KEY (`organization_id`)
    REFERENCES `organization` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `username_UNIQUE` ON `student` (`studentid` ASC) VISIBLE;

CREATE INDEX `fk_User_Organization_idx` ON `student` (`organization_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `course` ;

CREATE TABLE IF NOT EXISTS `course` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `durationinmonths` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `name_UNIQUE` ON `course` (`name` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `academicyear`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `academicyear` ;

CREATE TABLE IF NOT EXISTS `academicyear` (
  `id` INT NOT NULL,
  `startdate` DATETIME(6) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `enddate` DATETIME(6) NOT NULL,
  `organization_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_AcademicYear_Organization1`
    FOREIGN KEY (`organization_id`)
    REFERENCES `organization` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_AcademicYear_Organization1_idx` ON `academicyear` (`organization_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `subject_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `subject_type` ;

CREATE TABLE IF NOT EXISTS `subject_type` (
  `id` INT NOT NULL,
  `subjecttype` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `subjecttype_UNIQUE` ON `subject_type` (`subjecttype` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `subject` ;

CREATE TABLE IF NOT EXISTS `subject` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(150) NULL,
  `subject_type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Subject_SubjectType1`
    FOREIGN KEY (`subject_type_id`)
    REFERENCES `subject_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE` ON `subject` (`id` ASC) VISIBLE;

CREATE UNIQUE INDEX `name_UNIQUE` ON `subject` (`name` ASC) VISIBLE;

CREATE INDEX `fk_Subject_SubjectType1_idx` ON `subject` (`subject_type_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `course_subject_mapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `course_subject_mapping` ;

CREATE TABLE IF NOT EXISTS `course_subject_mapping` (
  `id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `subject_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_CourseSubjectMapping_Course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CourseSubjectMapping_Subject1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_CourseSubjectMapping_Course1_idx` ON `course_subject_mapping` (`course_id` ASC) VISIBLE;

CREATE INDEX `fk_CourseSubjectMapping_Subject1_idx` ON `course_subject_mapping` (`subject_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `course_student_mapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `course_student_mapping` ;

CREATE TABLE IF NOT EXISTS `course_student_mapping` (
  `id` INT NOT NULL,
  `student_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_CourseUserMapping_User1`
    FOREIGN KEY (`student_id`)
    REFERENCES `student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CourseUserMapping_Course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_CourseUserMapping_User1_idx` ON `course_student_mapping` (`student_id` ASC) VISIBLE;

CREATE INDEX `fk_CourseUserMapping_Course1_idx` ON `course_student_mapping` (`course_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `parent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `parent` ;

CREATE TABLE IF NOT EXISTS `parent` (
  `id` INT NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `mobile` VARCHAR(45) NOT NULL,
  `enabled` INT NOT NULL,
  `expired` INT NOT NULL,
  `created` DATETIME NOT NULL,
  `lastupdated` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employee` ;

CREATE TABLE IF NOT EXISTS `employee` (
  `id` INT NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `primarycontact` VARCHAR(45) NOT NULL,
  `secondarycontact` VARCHAR(45) NULL,
  `organization_id` INT NOT NULL,
  `employee_id` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` INT NOT NULL,
  `expired` INT NOT NULL,
  `created` DATETIME NOT NULL,
  `lastupdated` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Employee_Organization1`
    FOREIGN KEY (`organization_id`)
    REFERENCES `organization` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `lastname_UNIQUE` ON `employee` (`lastname` ASC) VISIBLE;

CREATE UNIQUE INDEX `firstname_UNIQUE` ON `employee` (`firstname` ASC) VISIBLE;

CREATE UNIQUE INDEX `email_UNIQUE` ON `employee` (`email` ASC) VISIBLE;

CREATE INDEX `fk_Employee_Organization1_idx` ON `employee` (`organization_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `department` ;

CREATE TABLE IF NOT EXISTS `department` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL,
  `organization_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Department_Organization1`
    FOREIGN KEY (`organization_id`)
    REFERENCES `organization` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Department_Organization1_idx` ON `department` (`organization_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `department_employee_mapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `department_employee_mapping` ;

CREATE TABLE IF NOT EXISTS `department_employee_mapping` (
  `id` INT NOT NULL,
  `department_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_DepartmentEmployeeMapping_Department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DepartmentEmployeeMapping_Employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_DepartmentEmployeeMapping_Department1_idx` ON `department_employee_mapping` (`department_id` ASC) VISIBLE;

CREATE INDEX `fk_DepartmentEmployeeMapping_Employee1_idx` ON `department_employee_mapping` (`employee_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `user_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_type` ;

CREATE TABLE IF NOT EXISTS `user_type` (
  `id` INT NOT NULL,
  `student` VARCHAR(45) NULL,
  `parent` VARCHAR(45) NULL,
  `employee` VARCHAR(45) NULL,
  `admin` VARCHAR(45) NULL,
  `superadmin` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `employee_subject_mapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employee_subject_mapping` ;

CREATE TABLE IF NOT EXISTS `employee_subject_mapping` (
  `id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  `subject_id` INT NOT NULL,
  `academicyear_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_EmployeeSubjectMapping_Employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EmployeeSubjectMapping_Subject1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EmployeeSubjectMapping_AcademicYear1`
    FOREIGN KEY (`academicyear_id`)
    REFERENCES `academicyear` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_EmployeeSubjectMapping_Employee1_idx` ON `employee_subject_mapping` (`employee_id` ASC) VISIBLE;

CREATE INDEX `fk_EmployeeSubjectMapping_Subject1_idx` ON `employee_subject_mapping` (`subject_id` ASC) VISIBLE;

CREATE INDEX `fk_EmployeeSubjectMapping_AcademicYear1_idx` ON `employee_subject_mapping` (`academicyear_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `section` ;

CREATE TABLE IF NOT EXISTS `section` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL,
  `Course_id` INT NOT NULL,
  `Student_id` INT NOT NULL,
  `class_teacher_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Section_Course1`
    FOREIGN KEY (`Course_id`)
    REFERENCES `course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Section_Student1`
    FOREIGN KEY (`Student_id`)
    REFERENCES `student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Section_Employee1`
    FOREIGN KEY (`class_teacher_id`)
    REFERENCES `employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `name_UNIQUE` ON `section` (`name` ASC) VISIBLE;

CREATE INDEX `fk_Section_Course1_idx` ON `section` (`Course_id` ASC) VISIBLE;

CREATE INDEX `fk_Section_Student1_idx` ON `section` (`Student_id` ASC) VISIBLE;

CREATE INDEX `fk_Section_Employee1_idx` ON `section` (`class_teacher_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `section_academicyear_mapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `section_academicyear_mapping` ;

CREATE TABLE IF NOT EXISTS `section_academicyear_mapping` (
  `id` INT NOT NULL,
  `academicyear_id` INT NOT NULL,
  `section_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_SectionAcademicYearMapping_AcademicYear1`
    FOREIGN KEY (`academicyear_id`)
    REFERENCES `academicyear` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SectionAcademicYearMapping_Section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `section` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SectionAcademicYearMapping_AcademicYear1_idx` ON `section_academicyear_mapping` (`academicyear_id` ASC) VISIBLE;

CREATE INDEX `fk_SectionAcademicYearMapping_Section1_idx` ON `section_academicyear_mapping` (`section_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `student_parent_mapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `student_parent_mapping` ;

CREATE TABLE IF NOT EXISTS `student_parent_mapping` (
  `id` INT NOT NULL,
  `student_id` INT NOT NULL,
  `parent_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_StudentParentMapping_Student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_StudentParentMapping_Parent1`
    FOREIGN KEY (`parent_id`)
    REFERENCES `parent` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_StudentParentMapping_Student1_idx` ON `student_parent_mapping` (`student_id` ASC) VISIBLE;

CREATE INDEX `fk_StudentParentMapping_Parent1_idx` ON `student_parent_mapping` (`parent_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `student_electives_academicyear_mapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `student_electives_academicyear_mapping` ;

CREATE TABLE IF NOT EXISTS `student_electives_academicyear_mapping` (
  `id` INT NOT NULL,
  `Student_id` INT NOT NULL,
  `Subject_id` INT NOT NULL,
  `AcademicYear_id` INT NOT NULL,
  `Employee_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_StudentSubjectAcademicYear_Student1`
    FOREIGN KEY (`Student_id`)
    REFERENCES `student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_StudentSubjectAcademicYear_Subject1`
    FOREIGN KEY (`Subject_id`)
    REFERENCES `subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_StudentSubjectAcademicYear_AcademicYear1`
    FOREIGN KEY (`AcademicYear_id`)
    REFERENCES `academicyear` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_StudentSubjectAcademicYear_Employee1`
    FOREIGN KEY (`Employee_id`)
    REFERENCES `employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_StudentSubjectAcademicYear_Student1_idx` ON `student_electives_academicyear_mapping` (`Student_id` ASC) VISIBLE;

CREATE INDEX `fk_StudentSubjectAcademicYear_Subject1_idx` ON `student_electives_academicyear_mapping` (`Subject_id` ASC) VISIBLE;

CREATE INDEX `fk_StudentSubjectAcademicYear_AcademicYear1_idx` ON `student_electives_academicyear_mapping` (`AcademicYear_id` ASC) VISIBLE;

CREATE INDEX `fk_StudentSubjectAcademicYear_Employee1_idx` ON `student_electives_academicyear_mapping` (`Employee_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `student_subject_employee_mapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `student_subject_employee_mapping` ;

CREATE TABLE IF NOT EXISTS `student_subject_employee_mapping` (
  `id` INT NOT NULL,
  `employee_subject_mapping_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_CourseSubjectFacultyMapping_EmployeeSubjectMapping1`
    FOREIGN KEY (`employee_subject_mapping_id`)
    REFERENCES `employee_subject_mapping` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_StudentSubjectEmployeeMapping_Student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_CourseSubjectFacultyMapping_EmployeeSubjectMapping1_idx` ON `student_subject_employee_mapping` (`employee_subject_mapping_id` ASC) VISIBLE;

CREATE INDEX `fk_StudentSubjectEmployeeMapping_Student1_idx` ON `student_subject_employee_mapping` (`student_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `oauth_client_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oauth_client_details` ;

CREATE TABLE IF NOT EXISTS `oauth_client_details` (
  `id` INT NOT NULL,
  `organization_id` INT NOT NULL,
  `client_id` VARCHAR(256) NOT NULL,
  `client_secret` VARCHAR(256) NOT NULL,
  `web_server_redirect_uri` VARCHAR(256) NULL,
  `authorities` VARCHAR(256) NULL,
  `access_token_validity` INT NULL,
  `refresh_token_validity` INT NULL,
  `additional_information` VARCHAR(500) NULL,
  `autoapprove` VARCHAR(256) NULL,
  `authorized_grant_types` VARCHAR(256) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_oauth_client_details_organization1`
    FOREIGN KEY (`organization_id`)
    REFERENCES `organization` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_oauth_client_details_organization1_idx` ON `oauth_client_details` (`organization_id` ASC) VISIBLE;

CREATE UNIQUE INDEX `client_id_UNIQUE` ON `oauth_client_details` (`client_id` ASC) VISIBLE;

CREATE UNIQUE INDEX `client_secret_UNIQUE` ON `oauth_client_details` (`client_secret` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resource` ;

CREATE TABLE IF NOT EXISTS `resource` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oauth_client_token`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oauth_client_token` ;

CREATE TABLE IF NOT EXISTS `oauth_client_token` (
  `token_id` VARCHAR(256) NULL,
  `oauth_client_tokencol` VARCHAR(45) NULL,
  `token` BLOB NULL,
  `authentication_id` VARCHAR(256) NOT NULL,
  `user` VARCHAR(45) NULL,
  PRIMARY KEY (`authentication_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `org_resource_scope`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `org_resource_scope` ;

CREATE TABLE IF NOT EXISTS `org_resource_scope` (
  `id` INT NOT NULL,
  `oauth_client_details_id` INT NOT NULL,
  `resource_id` INT NOT NULL,
  `scope` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_org_resource_authority_oauth_client_details1`
    FOREIGN KEY (`oauth_client_details_id`)
    REFERENCES `oauth_client_details` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_org_resource_authority_resource1`
    FOREIGN KEY (`resource_id`)
    REFERENCES `resource` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_org_resource_authority_oauth_client_details1_idx` ON `org_resource_scope` (`oauth_client_details_id` ASC) VISIBLE;

CREATE INDEX `fk_org_resource_authority_resource1_idx` ON `org_resource_scope` (`resource_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `role` ;

CREATE TABLE IF NOT EXISTS `role` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(256) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `name_UNIQUE` ON `role` (`name` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `student_role_mapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `student_role_mapping` ;

CREATE TABLE IF NOT EXISTS `student_role_mapping` (
  `id` INT NOT NULL,
  `student_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_student_role_mapping_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_role_mapping_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_student_role_mapping_student1_idx` ON `student_role_mapping` (`student_id` ASC) VISIBLE;

CREATE INDEX `fk_student_role_mapping_role1_idx` ON `student_role_mapping` (`role_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `employee_role_mapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employee_role_mapping` ;

CREATE TABLE IF NOT EXISTS `employee_role_mapping` (
  `id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_employee_role_mapping_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_role_mapping_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_employee_role_mapping_employee1_idx` ON `employee_role_mapping` (`employee_id` ASC) VISIBLE;

CREATE INDEX `fk_employee_role_mapping_role1_idx` ON `employee_role_mapping` (`role_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `parent_role_mapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `parent_role_mapping` ;

CREATE TABLE IF NOT EXISTS `parent_role_mapping` (
  `id` INT NOT NULL,
  `parent_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_parent_role_mapping_parent1`
    FOREIGN KEY (`parent_id`)
    REFERENCES `parent` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_parent_role_mapping_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_parent_role_mapping_parent1_idx` ON `parent_role_mapping` (`parent_id` ASC) VISIBLE;

CREATE INDEX `fk_parent_role_mapping_role1_idx` ON `parent_role_mapping` (`role_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `oauth_access_token`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oauth_access_token` ;

CREATE TABLE IF NOT EXISTS `oauth_access_token` (
  `token_id` VARCHAR(256) NULL,
  `token` BLOB NULL,
  `authentication_id` VARCHAR(256) NULL,
  `user_name` VARCHAR(45) NULL,
  `client_id` VARCHAR(256) NULL,
  `authentication` BLOB NULL,
  `refresh_token` VARCHAR(256) NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oauth_refresh_token`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oauth_refresh_token` ;

CREATE TABLE IF NOT EXISTS `oauth_refresh_token` (
  `token_id` VARCHAR(256) NOT NULL,
  `token` BLOB NULL,
  `authentication` BLOB NULL,
  PRIMARY KEY (`token_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oauth_code`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oauth_code` ;

CREATE TABLE IF NOT EXISTS `oauth_code` (
  `code` VARCHAR(256) NOT NULL,
  `authentication` BLOB NULL,
  PRIMARY KEY (`code`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
