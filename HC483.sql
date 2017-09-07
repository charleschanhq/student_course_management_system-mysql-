drop schema hc483;
create schema hc483;
use hc483;

Create table Department (
	department_id int(10) primary key not null,
	department_name varchar(50) not null
);


Create table major(
	major_id int(10) not null primary key,
	department_id int(10) not null,
    major_name varchar(30) not null,
	foreign key (department_id) references Department(department_id)
);


Create table nationality(
	nationality_id int(10) not null primary key,
	first_language varchar(20) not null,
    nation_name varchar(20) not null
);


Create table student (
	student_id int Primary Key not null ,
	student_first_name varchar(30) not null,
	student_last_name varchar(30) not null,
    nationality_id int(10) not null,
	gender varchar(1) not null,
#date_of_birth date,
	department_id int(10) not null,
	major_id int(10) not null,

	student_gpa float (3,2),
	foreign key (department_id) references Department(department_id),
	foreign key (major_id) references Major(major_id)
);


Create table instructor(
	faculty_id int(10) Primary Key ,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	gender varchar(1) not null,
	date_of_birth date not null,
    department_id int(10),
    foreign key (department_id) references department(department_id)
);


Create table classroom (
	classroom_id int(10) primary key ,
	max_capacity int not null ,
    department_id int(10) not null,
    foreign key (department_id) references department(department_id)

);


Create table exam( 
	exam_id int (10) primary key ,
	course_id int(10) not null,
    classroom_id int(10) not null
);


Create table course (
	course_id int(10) primary key ,
	course_name varchar(50) not null,
    exam_id int(10) ,
	department_id int(10) not null,
    classroom_id int(10) ,
	credits int(10) not null,
    faculty_id int(10),
	foreign key (department_id) references Department(department_id),
    foreign key (faculty_id) references instructor(faculty_id),
    foreign key (classroom_id) references classroom(classroom_id),
    foreign key (exam_id) references exam(exam_id)
);



create table prerequisite (
	prerequisite_id int(10) primary key,
	course_id int(10) not null,
	prerequisite_course_name varchar (10) not null,
	foreign key (course_id) references course (course_id)
);


create table student_course_taken( 
	student_id int(10),
    course_id int(10),
    grade varchar(1),
    foreign key (student_id) references student(student_id),
    foreign key (course_id) references course(course_id)
	
);

create table section(
	course_id int(10),
    section_id int(10),
    foreign key (course_id) references course(course_id)
);


# insert department instances:
#INSERT INTO `hc483`.`department` (`department_id`, `department_name`) VALUES ('department_id', 'department_name');
INSERT INTO `hc483`.`department` (`department_id`, `department_name`) VALUES ('1', 'College of Engineering');
INSERT INTO `hc483`.`department` (`department_id`, `department_name`) VALUES ('2', 'College of Art ');
INSERT INTO `hc483`.`department` (`department_id`, `department_name`) VALUES ('3', 'College of Science');
INSERT INTO `hc483`.`department` (`department_id`, `department_name`) VALUES ('4', 'College of Education');
INSERT INTO `hc483`.`department` (`department_id`, `department_name`) VALUES ('5', 'College of Business');
INSERT INTO `hc483`.`department` (`department_id`, `department_name`) VALUES ('6', 'College of Medicine');
INSERT INTO `hc483`.`department` (`department_id`, `department_name`) VALUES ('7', 'College of Sports and management');
INSERT INTO `hc483`.`department` (`department_id`, `department_name`) VALUES ('8', 'College of Information and Techinology');

# insert major instances:
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('001', '001', 'computer engineering');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('002', '001', 'civil engineering');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('003', '001', 'electrical engineering');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('004', '001', 'software engineering');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('005', '001', 'biology engineering');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('006', '001', 'medical engineering');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('007', '001', 'chemical engineering');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('008', '001', 'material engineering');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('009', '001', 'general engineering');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('010', '002', 'graphic design');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('011', '002', 'game design');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('012', '002', 'fine arts');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('013', '002', 'liberal arts');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('014', '002', 'theater arts');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('015', '002', 'visual and performing arts');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('016', '002', 'music');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('017', '002', 'fashion design');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('018', '002', 'digital arts');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('019', '003', 'mathematics');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('020', '003', 'physics');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('021', '003', 'chemistry');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('022', '003', 'biology');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('023', '004', 'modern education');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('024', '005', 'general business');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('025', '005', 'accounting');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('026', '005', 'finance');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('027', '005', 'international business');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('028', '005', 'information system');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('029', '005', 'business engineering');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('030', '005', 'marketing');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('031', '005', 'management');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('032', '005', 'economics');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('033', '005', 'entrepreneurship');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('034', '005', 'social innovation');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('035', '005', 'fintech');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('036', '006', 'medical chemistry');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('037', '007', 'sports management');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('038', '008', 'information science');
INSERT INTO `hc483`.`major` (`major_id`, `department_id`, `major_name`) VALUES ('039', '008', 'data science');


# insert nationality instance:

INSERT INTO `hc483`.`nationality` (`nationality_id`, `first_language`, `nation_name`) VALUES ('2', 'Mandarin', 'Taiwan');
INSERT INTO `hc483`.`nationality` (`nationality_id`, `first_language`, `nation_name`) VALUES ('3', 'Spanish', 'Spain');
INSERT INTO `hc483`.`nationality` (`nationality_id`, `first_language`, `nation_name`) VALUES ('4', 'Spanish', 'Puerto Rico');
INSERT INTO `hc483`.`nationality` (`nationality_id`, `first_language`, `nation_name`) VALUES ('5', 'Spanish', 'Bolivia');
INSERT INTO `hc483`.`nationality` (`nationality_id`, `first_language`, `nation_name`) VALUES ('6', 'Spanish', 'Colombia');
INSERT INTO `hc483`.`nationality` (`nationality_id`, `first_language`, `nation_name`) VALUES ('7', 'Spanish', 'Cuba');
INSERT INTO `hc483`.`nationality` (`nationality_id`, `first_language`, `nation_name`) VALUES ('8', 'Spanish', 'Peru');
INSERT INTO `hc483`.`nationality` (`nationality_id`, `first_language`, `nation_name`) VALUES ('9', 'Spanish', 'Mexico');
INSERT INTO `hc483`.`nationality` (`nationality_id`, `first_language`, `nation_name`) VALUES ('10', 'Hindi', 'India');
INSERT INTO `hc483`.`nationality` (`nationality_id`, `first_language`, `nation_name`) VALUES ('11', 'Russian', 'Russia');
INSERT INTO `hc483`.`nationality` (`nationality_id`, `first_language`, `nation_name`) VALUES ('12', 'Japanese', 'Japan');
INSERT INTO `hc483`.`nationality` (`nationality_id`, `first_language`, `nation_name`) VALUES ('13', 'French', 'France');
INSERT INTO `hc483`.`nationality` (`nationality_id`, `first_language`, `nation_name`) VALUES ('14', 'English', 'Canada');
INSERT INTO `hc483`.`nationality` (`nationality_id`, `first_language`, `nation_name`) VALUES ('15', 'English', 'UK');
INSERT INTO `hc483`.`nationality` (`nationality_id`, `first_language`, `nation_name`) VALUES ('16', 'English', 'USA');
INSERT INTO `hc483`.`nationality` (`nationality_id`, `first_language`, `nation_name`) VALUES ('17', 'Mandarin', 'China');


# insert classroom instance:
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('1', '30', '1');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('2', '40', '3');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('3', '50', '4');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('4', '49', '5');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('5', '45', '4');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('6', '65', '5');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('7', '34', '6');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('8', '45', '7');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('9', '55', '5');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('10', '43', '4');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('11', '43', '1');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('12', '23', '2');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('13', '34', '5');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('14', '42', '6');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('15', '13', '7');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('16', '40', '4');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('17', '40', '3');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('18', '30', '4');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('19', '30', '5');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('20', '30', '4');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('21', '50', '5');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('22', '45', '1');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('23', '40', '5');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('24', '56', '1');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('25', '60', '5');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('26', '90', '4');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('27', '100', '2');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('28', '30', '6');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('29', '40', '7');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('30', '50', '4');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('31', '50', '2');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('32', '60', '3');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('33', '70', '4');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('34', '80', '5');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('35', '90', '1');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('36', '100', '2');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('37', '30', '3');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('38', '10', '1');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('39', '34', '4');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('40', '34', '5');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('41', '34', '4');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('42', '56', '5');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('43', '63', '4');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('44', '45', '5');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('45', '34', '5');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('46', '24', '5');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('47', '56', '5');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('48', '34', '1');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('49', '23', '2');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('50', '45', '1');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('51', '23', '3');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('52', '78', '4');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('53', '96', '5');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('54', '90', '5');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('55', '43', '6');
INSERT INTO `hc483`.`classroom` (`classroom_id`, `max_capacity`, `department_id`) VALUES ('56', '78', '4');


#insert instructor instances:
INSERT INTO `hc483`.`instructor`
 (`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('1', 'Hill', 'John Peattie', 'f', '1943/7/21', '3');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('2', 'Stewart', 'Rajagopalan', 'f', '1944/3/3', '4');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('3', 'Griffin', 'Frankfeldt', 'm', '1944/8/31', '5');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('4', 'Murphy', 'Hanks', 'm', '1946/3/15', '4');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('5', 'Foster', 'Verbic', 'm', '1947/3/31', '5');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('6', 'Torres', 'Chartas', 'm', '1951/1/19', '3');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('7', 'Woods', 'Bok', 'm', '1951/7/6', '4');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('8', 'Hill', 'Velez', 'm', '1952/8/11', '5');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('9', 'Bennett', 'Fayers', 'f', '1953/8/26', '6');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('10', 'Jordan', 'Matthies', 'm', '1953/9/30', '3');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('11', 'Torres', 'Kerr', 'm', '1954/11/11', '7');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('12', 'Woods', 'Ratner', 'f', '1955/2/4', '8');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('13', 'Hill', 'Jeanneret', 'm', '1957/4/12', '7');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('14', 'Bennett', 'Butler-evans', 'm', '1960/5/6', '8');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('15', 'Jordan', 'Chamoun', 'f', '1961/11/22', '1');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('16', 'Hayes', 'Rammelkamp', 'f', '1964/7/24', '2');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('17', 'Campbell', 'Mannello', 'f', '1966/2/2', '3');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('18', 'Simmons', 'Chalek', 'm', '1967/1/9', '4');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('19', 'Owens', 'Schad', 'm', '1967/3/2', '6');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('20', 'Reed', 'Spiegelhalter', 'm', '1967/8/29', '3');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('21', 'Collins', 'Hannon', 'm', '1968/8/30', '1');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('22', 'Smith', 'Heatherton', 'f', '1970/10/23', '4');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('23', 'Gray', 'Salisbury-rowswell', 'f', '1971/10/22', '5');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('24', 'Wood', 'Monger', 'm', '1972/9/28', '6');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('25', 'Sanders', 'Memisoglu', 'm', '1974/5/22', '3');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('26', 'Young', 'Mantegazza', 'm', '1943/7/21', '4');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('27', 'Washington', 'Adame', 'm', '1944/3/3', '5');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('28', 'Wallace', 'Hopson', 'm', '1944/8/31', '3');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('29', 'Evans', 'Alongi', 'm', '1946/3/15', '4');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('30', 'Alexander', 'Tollestrup', 'f', '1947/3/31', '5');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('31', 'Rogers', 'Wolbach', 'm', '1951/1/19', '6');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('32', 'Collins', 'Zorich', 'm', '1951/7/6', '7');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('33', 'Fisher', 'Rorty', 'f', '1952/8/11', '8');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('34', 'Brown', 'Simkovich', 'm', '1953/8/26', '3');
INSERT INTO `hc483`.`instructor`
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('35', 'Diaz', 'Arbia', 'm', '1953/9/30', '4');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('36', 'Baker', 'Samuelson', 'f', '1954/11/11', '1');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('37', 'Foster', 'Wiatrowsky', 'f', '1955/2/4', '2');
INSERT INTO `hc483`.`instructor`
 (`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('38', 'King', 'Hanrieder', 'f', '1957/4/12', '5');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('39', 'Cox', 'Newsweek', 'm', '1960/5/6', '5');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('40', 'Graham', 'Ferruzza', 'm', '1961/11/22', '2');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('41', 'Perez', 'Kuntz', 'm', '1964/7/24', '3');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('42', 'Hill', 'Knack', 'm', '1966/2/2', '5');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`) 
VALUES ('43', 'Gonzalez', 'Boss', 'f', '1967/1/9', '1');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('44', 'Peterson', 'Choo', 'f', '1967/3/2', '3');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('45', 'Edwards', 'Andrews', 'm', '1967/8/29', '4');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('46', 'Bell', 'Hoss', 'm', '1968/8/30', '5');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('47', 'Anderson', 'O\'hara', 'm', '1970/10/23', '6');
INSERT INTO `hc483`.`instructor`
 (`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('48', 'Green', 'Lemessurier', 'm', '1971/10/22', '3');
INSERT INTO `hc483`.`instructor`
 (`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('49', 'Jones', 'Herold', 'm', '1972/9/28', '4');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('50', 'Peterson', 'Osorio', 'm', '1974/5/22', '5');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('51', 'Powell', 'Freyman', 'f', '1946/1/29', '3');
INSERT INTO `hc483`.`instructor`
 (`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('52', 'Powell', 'Rhea', 'm', '1947/7/3', '5');
INSERT INTO `hc483`.`instructor`
 (`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('53', 'Barnes', 'Miri', 'm', '1948/4/19', '6');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('54', 'Lopez', 'Havel', 'f', '1949/2/3', '3');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('55', 'Morris', 'Donlon', 'm', '1950/11/24', '4');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('56', 'Flores', 'Boniface', 'm', '1958/7/4', '1');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('57', 'Simmons', 'Knox', 'f', '1959/8/11', '5');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('58', 'Scott', 'Chien', 'f', '1959/10/14', '4');
INSERT INTO `hc483`.`instructor`
 (`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('59', 'Barnes', 'Guyton', 'f', '1960/12/27', '2');
INSERT INTO `hc483`.`instructor`
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('60', 'Powell', 'Dell\'atti', 'm', '1961/11/1', '1');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('61', 'Harris', 'Bosch', 'm', '1964/3/23', '3');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('62', 'Foster', 'Kuensch', 'm', '1965/11/24', '4');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('63', 'Fisher', 'Robison', 'm', '1967/3/17', '1');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('64', 'Hughes', 'Curley', 'f', '1968/7/30', '2');
INSERT INTO `hc483`.`instructor`
 (`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('65', 'Richardson', 'Papele', 'f', '1969/5/15', '4');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('66', 'Gonzalez', 'Tchimbembe', 'm', '1970/11/9', '5');
INSERT INTO `hc483`.`instructor`
 (`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('67', 'Martin', 'Foss', 'm', '1971/5/12', '6');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('68', 'Davis', 'Sigalot', 'm', '1972/3/21', '7');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('69', 'Harris', 'Lacasse', 'm', '1972/4/17', '3');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('70', 'Griffin', 'Neustadt', 'm', '1972/10/16', '4');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('71', 'Long', 'Mullin', 'm', '1977/8/30', '2');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('72', 'Patterson', 'De niro', 'f', '1980/5/22', '3');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('73', 'Williams', 'Encinas', 'm', '1981/7/22', '4');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('74', 'Carter', 'Nascimento', 'm', '1981/7/31', '5');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('75', 'Sanders', 'Altshuler', 'f', '1982/3/8', '6');
INSERT INTO `hc483`.`instructor`
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('76', 'Edwards', 'Kalinowski', 'm', '1950/8/15', '1');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('77', 'Jackson', 'Gullahorn', 'm', '1951/6/11', '2');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('78', 'Gonzalez', 'Heydarpour', 'f', '1951/7/31', '3');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('79', 'Barnes', 'Neumann', 'f', '1951/10/25', '4');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
 VALUES ('80', 'Walker', 'Crescimanni', 'f', '1953/1/21', '5');
INSERT INTO `hc483`.`instructor` 
(`faculty_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `department_id`)
VALUES ('81', 'Water', 'Shah', 'm', '1953/5/5', '6');



#insert exams instances:
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511001', '1001', '59');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511002', '1002', '4');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511003', '1003', '31');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511004', '1004', '61');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511005', '1005', '64');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511006', '1006', '34');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511007', '1007', '68');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511008', '1008', '12');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511009', '1009', '8');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511010', '1010', '46');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511011', '1011', '32');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511012', '1012', '35');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511013', '1013', '41');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511014', '1014', '68');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511015', '1015', '26');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511016', '1016', '46');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511017', '1017', '30');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511018', '1018', '57');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511019', '1019', '56');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511020', '1020', '4');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511021', '1021', '15');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511022', '1022', '11');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511023', '1023', '32');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511024', '1024', '53');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511025', '1025', '38');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511026', '1026', '60');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511027', '1027', '2');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511028', '1028', '62');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511029', '1029', '52');
INSERT INTO `hc483`.`exam` (`exam_id`, `course_id`, `classroom_id`) VALUES ('511030', '1030', '64');



#insert course instances:
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1001', 'MATH201', '511001', '3', '16', '3', '1');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1002', 'PYS101', '511002', '3', '13', '4', '47');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1003', 'ECON201', '511003', '5', '56', '3', '39');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1004', 'ECON301', '511004', '5', '45', '2', '68');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1005', 'CS171', '511005', '1', '5', '2', '26');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1006', 'CS161', '511006', '1', '42', '4', '70');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1007', 'CS141', '511007', '1', '50', '2', '70');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1008', 'ENG333', '511008', '2', '28', '2', '22');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1009', 'MIS300', '511009', '5', '21', '4', '72');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1010', 'MIS344', '511010', '5', '15', '3', '19');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1011', 'MIS347', '511011', '5', '43', '4', '4');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1012', 'ARTH401', '511012', '2', '40', '4', '55');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1013', 'FIN301', '511013', '5', '26', '2', '74');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1014', 'STAT401', '511014', '3', '55', '3', '38');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1015', 'STAT201', '511015', '3', '33', '4', '62');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1016', 'HIST201', '511016', '2', '37', '2', '36');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1017', 'SPO101', '511017', '7', '31', '4', '42');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1018', 'EDU101', '511018', '4', '24', '3', '7');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1019', 'MED301', '511019', '6', '17', '2', '65');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1020', 'ART101', '511020', '2', '6', '2', '40');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1021', 'EDU330', '511021', '4', '47', '3', '20');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1022', 'IT201', '511022', '8', '2', '3', '47');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1023', 'ENGR103', '511023', '1', '18', '3', '79');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1024', 'ENGR101', '511024', '1', '2', '2', '75');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES
 ('1025', 'CHEM103', '511025', '3', '56', '3', '11');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1026', 'SPAN101', '511026', '2', '32', '4', '40');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1027', 'SPAN102', '511027', '2', '30', '2', '48');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1028', 'MED330', '511028', '6', '28', '3', '63');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1029', 'FIN445', '511029', '5', '52', '4', '48');
INSERT INTO `hc483`.`course` (`course_id`, `course_name`, `exam_id`, `department_id`, `classroom_id`, `credits`, `faculty_id`) VALUES 
('1030', 'BUS440', '511030', '5', '42', '4', '70');


# insert prerequisite instances:
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61001', '1001', 'MATH101');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61002', '1002', 'NONE');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61003', '1003', 'NONE');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61004', '1004', 'ECOPN201');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61005', '1005', 'CS161');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61006', '1006', 'CS141');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61007', '1007', 'CS101');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61008', '1008', 'ENG100');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61009', '1009', 'MIS101');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61010', '1010', 'MIS343');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61011', '1011', 'MIS346');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61012', '1012', 'ARTH301');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61013', '1013', 'NONE');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61014', '1014', 'STAT201');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61015', '1015', 'NONE');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61016', '1016', 'HIST101');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61017', '1017', 'NONE');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61018', '1018', 'NONE');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61019', '1019', 'MED201');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61020', '1020', 'NONE');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61021', '1021', 'NONE');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61022', '1022', 'NONE');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61023', '1023', 'ENGR101');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61024', '1024', 'NONE');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61025', '1025', 'CHEM102');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61026', '1026', 'NONE');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61027', '1027', 'SPAN101');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61028', '1028', 'MED320');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61029', '1029', 'FIN301');
INSERT INTO `hc483`.`prerequisite` (`prerequisite_id`, `course_id`, `prerequisite_course_name`) VALUES ('61030', '1030', 'BUS430');


#insert student_instance:

INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164198', 'Mitchell', 'Golledge', '16', 'f', '1', '1', '3.9');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164199', 'Brooks', 'Rudolfer', '16', 'm', '1', '2', '2.7');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164200', 'Myers', 'Defeciani', '16', 'm', '1', '4', '3.1');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164201', 'Scott', 'Trichopoulos', '17', 'f', '1', '3', '3.4');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164202', 'Cooper', 'Pineda', '17', 'm', '1', '2', '3.6');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164203', 'Jones', 'Nkwah', '16', 'm', '1', '6', '3.1');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164204', 'Campbell', 'Holway', '16', 'm', '1', '6', '3.6');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164205', 'Hughes', 'Tabors', '16', 'm', '1', '2', '3.9');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164206', 'Adams', 'Wahba', '17', 'f', '1', '8', '2.4');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164207', 'Brooks', 'Kane', '17', 'f', '2', '10', '3.1');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164208', 'Flores', 'Gledhill', '16', 'm', '2', '11', '3.4');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164209', 'Woods', 'Hajda', '16', 'm', '2', '15', '3.9');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164210', 'Thompson', 'Ladetto', '17', 'f', '2', '16', '2.7');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164211', 'Taylor', 'Torpey', '16', 'm', '2', '17', '3.1');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164212', 'Price', 'Kac', '1', 'm', '2', '12', '3.4');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164213', 'Bryant', 'Toner', '16', 'm', '2', '13', '3.6');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164214', 'Garcia', 'Merad', '16', 'm', '2', '11', '3.1');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164215', 'Hughes', 'Crosby', '16', 'f', '2', '11', '3.6');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164216', 'Torres', 'Maclin', '16', 'f', '2', '11', '3.9');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164217', 'Washington', 'Colditz', '16', 'm', '2', '14', '2.4');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164218', 'Flores', 'Laguardia', '16', 'm', '3', '20', '3.1');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164219', 'Morgan', 'Grout', '16', 'f', '3', '19', '3.4');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164220', 'Torres', 'Waller', '16', 'm', '3', '19', '3.9');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164221', 'Hayes', 'Peres', '17', 'm', '4', '23', '2.7');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164222', 'Anderson', 'Ackerly', '17', 'm', '5', '24', '3.1');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164223', 'Morris', 'Rollins', '16', 'm', '5', '28', '3.4');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164224', 'Bailey', 'Hablitz', '16', 'f', '5', '29', '3.6');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164225', 'Ward', 'Weisshart', '16', 'f', '5', '30', '3.1');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164226', 'White', 'Tham', '15', 'm', '5', '34', '3.6');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164227', 'Myers', 'Bakwin', '15', 'm', '5', '31', '3.9');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164228', 'Cooper', 'Magnani', '16', 'f', '5', '30', '2.4');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164229', 'Woods', 'Tolls', '16', 'm', '5', '30', '3.1');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164230', 'Robinson', 'Mines', '13', 'm', '5', '33', '3.4');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164231', 'Cox', 'Grein', '16', 'm', '5', '32', '3.9');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164232', 'Foster', 'Bakanowsky', '14', 'm', '5', '33', '2.7');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164233', 'Johnson', 'Meleedy', '9', 'f', '5', '34', '3.1');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164234', 'Alexander', 'Brainard', '16', 'f', '6', '36', '3.4');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164235', 'Smith', 'Ayoub', '16', 'm', '6', '36', '3.6');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164236', 'Rivera', 'Chekov', '16', 'm', '6', '36', '3.1');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164237', 'Hernandez', 'Spezzaferri', '16', 'f', '7', '37', '3.6');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164238', 'Watson', 'Freundlich', '16', 'm', '7', '37', '3.9');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164239', 'Diaz', 'Owen', '16', 'm', '8', '38', '2.4');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164240', 'Morgan', 'Ely', '16', 'm', '8', '38', '3.1');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164241', 'Collins', 'Musil', '12', 'm', '8', '38', '3.4');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164242', 'Campbell', 'Fadden', '17', 'f', '8', '38', '3.9');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164243', 'Brown', 'Juster', '16', 'f', '8', '38', '2.7');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164244', 'Barnes', 'Ries', '16', 'm', '8', '38', '3.1');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164245', 'Perry', 'Quan', '16', 'm', '5', '24', '3.4');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164246', 'Hughes', 'Wrangham', '12', 'f', '5', '23', '3.6');
INSERT INTO `hc483`.`student` (`student_id`, `student_first_name`, `student_last_name`, `nationality_id`, `gender`, `department_id`, `major_id`, `student_gpa`) VALUES ('13164247', 'Chen', 'Barrowman', '13', 'f', '1', '1', '2.8');


# insert student_course_taken instances:
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`)
 VALUES ('13164198', '1001', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164198', '1002', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164198', '1003', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164198', '1004', 'D');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164198', '1005', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164198', '1006', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164198', '1007', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164198', '1008', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164198', '1009', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164198', '1010', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164199', '1004', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164199', '1025', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164199', '1007', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164199', '1026', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164199', '1020', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164199', '1010', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164199', '1013', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164199', '1014', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164199', '1022', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164199', '1028', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164200', '1022', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164200', '1013', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164200', '1010', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164201', '1027', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164201', '1021', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164201', '1020', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164201', '1028', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164202', '1023', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164202', '1013', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164202', '1023', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164202', '1001', 'D');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164203', '1024', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164203', '1001', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164203', '1006', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164203', '1020', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164204', '1026', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164204', '1011', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164204', '1015', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164204', '1019', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164205', '1013', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164206', '1021', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164207', '1018', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164208', '1004', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164209', '1018', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164209', '1027', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164209', '1017', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164209', '1014', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164210', '1014', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164210', '1025', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164210', '1026', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164210', '1007', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164211', '1008', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164211', '1016', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164212', '1012', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164213', '1028', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164214', '1018', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164214', '1015', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164214', '1026', 'D');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164215', '1029', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164215', '1008', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164215', '1025', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164216', '1003', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164216', '1025', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164216', '1004', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164216', '1017', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164216', '1025', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164217', '1028', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164218', '1011', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164219', '1010', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164219', '1019', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164219', '1006', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164219', '1026', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164219', '1012', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164219', '1009', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164220', '1004', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164221', '1023', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164222', '1012', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164222', '1029', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164222', '1015', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164222', '1024', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164222', '1017', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164222', '1027', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164223', '1024', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164224', '1010', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164225', '1023', 'D');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164226', '1019', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164226', '1018', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164226', '1013', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164226', '1030', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164226', '1014', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164227', '1015', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164227', '1030', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164227', '1028', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164228', '1003', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164228', '1020', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164228', '1007', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164228', '1020', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164229', '1019', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164230', '1018', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164230', '1001', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164230', '1014', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164231', '1018', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164232', '1028', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164233', '1005', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164233', '1021', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164233', '1030', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164233', '1020', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164234', '1022', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164235', '1013', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164235', '1011', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164235', '1018', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164235', '1026', 'D');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164236', '1017', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164237', '1029', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164238', '1026', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164238', '1022', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164238', '1011', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164238', '1028', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164238', '1016', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164239', '1012', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164240', '1010', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164241', '1024', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164242', '1010', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164242', '1026', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164242', '1020', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164242', '1028', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164242', '1019', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164243', '1030', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164243', '1015', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164243', '1029', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164244', '1012', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164244', '1029', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164244', '1030', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164244', '1011', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164244', '1003', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164244', '1003', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164245', '1017', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164246', '1021', 'C');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164247', '1003', 'D');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164247', '1010', 'B');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164247', '1025', 'A');
INSERT INTO `hc483`.`student_course_taken` (`student_id`, `course_id`, `grade`) VALUES
 ('13164247', '1028', 'B');

#insert section instance:
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1001', '41001');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1001', '41002');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1002', '41003');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1003', '41004');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1004', '41005');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1004', '41006');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1004', '41007');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1005', '41008');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1005', '41009');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1006', '41010');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1006', '41011');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1007', '41012');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1007', '41013');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1008', '41014');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1008', '41015');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1009', '41016');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1009', '41017');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1010', '41018');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1010', '41019');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1011', '41020');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1011', '41021');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1011', '41022');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1012', '41023');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1012', '41024');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1012', '41025');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1013', '41026');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1013', '41027');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1014', '41028');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1014', '41029');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1015', '41030');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1016', '41031');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1017', '41032');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1018', '41033');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1019', '41034');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1020', '41035');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1021', '41036');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1022', '41037');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1023', '41038');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1024', '41039');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1025', '41040');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1026', '41041');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1027', '41042');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1028', '41043');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1029', '41044');
INSERT INTO `hc483`.`section` (`course_id`, `section_id`) VALUES ('1030', '41045');

