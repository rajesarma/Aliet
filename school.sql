--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: academic_year; Type: TABLE; Schema: public; Owner: student; Tablespace: 
--

CREATE TABLE academic_year (
    year_id integer NOT NULL,
    year character varying(100)
);


ALTER TABLE academic_year OWNER TO student;

--
-- Name: blood_group; Type: TABLE; Schema: public; Owner: student; Tablespace: 
--

CREATE TABLE blood_group (
    bg_id integer NOT NULL,
    bg_name character varying(100) NOT NULL
);


ALTER TABLE blood_group OWNER TO student;

--
-- Name: branch; Type: TABLE; Schema: public; Owner: student; Tablespace: 
--

CREATE TABLE branch (
    branch_id character varying(100) NOT NULL,
    branch_name character varying(100)
);


ALTER TABLE branch OWNER TO student;

--
-- Name: exam_type; Type: TABLE; Schema: public; Owner: student; Tablespace: 
--

CREATE TABLE exam_type (
    exam_type_id integer NOT NULL,
    exam_type character varying(100),
    max_marks integer
);


ALTER TABLE exam_type OWNER TO student;

--
-- Name: faculty_details; Type: TABLE; Schema: public; Owner: student; Tablespace: 
--

CREATE TABLE faculty_details (
    faculty_id integer NOT NULL,
    faculty_name character varying(100),
    father_name character varying(100),
    dob date,
    doj date,
    photo character varying(500),
    aadhar character varying(50),
    address character varying(500),
    email character varying(100),
    mobile character varying(10),
    blood_group_id integer,
    is_active character(1) DEFAULT 'Y'::bpchar,
    emp_no character varying(25),
    user_id character varying(25),
    subject_id integer,
    qly_id integer,
    branch_id integer
);


ALTER TABLE faculty_details OWNER TO student;

--
-- Name: faculty_details_faculty_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE faculty_details_faculty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE faculty_details_faculty_id_seq OWNER TO student;

--
-- Name: faculty_details_faculty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE faculty_details_faculty_id_seq OWNED BY faculty_details.faculty_id;


--
-- Name: qualifications; Type: TABLE; Schema: public; Owner: student; Tablespace: 
--

CREATE TABLE qualifications (
    qly_id integer NOT NULL,
    qly_name character varying(200)
);


ALTER TABLE qualifications OWNER TO student;

--
-- Name: role_services; Type: TABLE; Schema: public; Owner: student; Tablespace: 
--

CREATE TABLE role_services (
    role_id integer,
    service_id integer
);


ALTER TABLE role_services OWNER TO student;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: student; Tablespace: 
--

CREATE TABLE roles (
    role_id integer NOT NULL,
    role_name character varying(100)
);


ALTER TABLE roles OWNER TO student;

--
-- Name: semester; Type: TABLE; Schema: public; Owner: student; Tablespace: 
--

CREATE TABLE semester (
    semester_id integer NOT NULL,
    semester_name character varying(100),
    year_id integer
);


ALTER TABLE semester OWNER TO student;

--
-- Name: services; Type: TABLE; Schema: public; Owner: student; Tablespace: 
--

CREATE TABLE services (
    service_id integer NOT NULL,
    service_url character varying(100),
    service_name character varying(25),
    is_active character(1),
    parent_id integer,
    dispay_order integer
);


ALTER TABLE services OWNER TO student;

--
-- Name: student_attendance; Type: TABLE; Schema: public; Owner: student; Tablespace: 
--

CREATE TABLE student_attendance (
    id integer NOT NULL,
    student_id integer,
    year_id integer,
    semester_id integer,
    branch_id character varying(25),
    no_of_days integer,
    days_present integer,
    academic_year_id integer
);


ALTER TABLE student_attendance OWNER TO student;

--
-- Name: student_attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE student_attendance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE student_attendance_id_seq OWNER TO student;

--
-- Name: student_attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE student_attendance_id_seq OWNED BY student_attendance.id;


--
-- Name: student_details; Type: TABLE; Schema: public; Owner: student; Tablespace: 
--

CREATE TABLE student_details (
    student_id integer NOT NULL,
    student_name character varying(100),
    father_name character varying(100),
    dob date,
    doj date,
    photo character varying(500),
    aadhar character varying(50),
    address character varying(500),
    email character varying(100),
    guardian_mobile character varying(10),
    blood_group_id integer,
    academic_year_id integer,
    branch_id character varying(50),
    is_active character(1) DEFAULT 'Y'::bpchar,
    roll_no character varying(25),
    mobile_no character varying(10),
    mother_name character varying(100),
    gender character(1),
    mentor_name character varying(100)
);


ALTER TABLE student_details OWNER TO student;

--
-- Name: student_details_student_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE student_details_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE student_details_student_id_seq OWNER TO student;

--
-- Name: student_details_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE student_details_student_id_seq OWNED BY student_details.student_id;


--
-- Name: student_marks; Type: TABLE; Schema: public; Owner: student; Tablespace: 
--

CREATE TABLE student_marks (
    id integer NOT NULL,
    student_id integer,
    year_id integer,
    semester_id integer,
    subject_id integer,
    exam_type_id integer,
    marks integer,
    branch_id character varying(25),
    academic_year_id integer,
    max_marks integer
);


ALTER TABLE student_marks OWNER TO student;

--
-- Name: student_marks_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE student_marks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE student_marks_id_seq OWNER TO student;

--
-- Name: student_marks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE student_marks_id_seq OWNED BY student_marks.id;


--
-- Name: subjects; Type: TABLE; Schema: public; Owner: student; Tablespace: 
--

CREATE TABLE subjects (
    subject_id integer NOT NULL,
    subject_name character varying(100),
    semester_id integer,
    branch_id character varying(100),
    credits integer
);


ALTER TABLE subjects OWNER TO student;

--
-- Name: users; Type: TABLE; Schema: public; Owner: student; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    user_name character varying(100),
    password character varying(100),
    is_active character varying(5),
    role_id integer,
    user_desc character varying(100),
    student_id integer,
    faculty_id integer
);


ALTER TABLE users OWNER TO student;

--
-- Name: years; Type: TABLE; Schema: public; Owner: student; Tablespace: 
--

CREATE TABLE years (
    year_no integer NOT NULL,
    year_name character varying(100)
);


ALTER TABLE years OWNER TO student;

--
-- Name: faculty_id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY faculty_details ALTER COLUMN faculty_id SET DEFAULT nextval('faculty_details_faculty_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY student_attendance ALTER COLUMN id SET DEFAULT nextval('student_attendance_id_seq'::regclass);


--
-- Name: student_id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY student_details ALTER COLUMN student_id SET DEFAULT nextval('student_details_student_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY student_marks ALTER COLUMN id SET DEFAULT nextval('student_marks_id_seq'::regclass);


--
-- Data for Name: academic_year; Type: TABLE DATA; Schema: public; Owner: student
--

COPY academic_year (year_id, year) FROM stdin;
1	2014-2015
2	2015-2016
3	2016-2017
4	2017-2018
\.


--
-- Data for Name: blood_group; Type: TABLE DATA; Schema: public; Owner: student
--

COPY blood_group (bg_id, bg_name) FROM stdin;
1	A Positive
2	A Negative
3	B Positive
4	B Negative
5	AB Positive
6	AB Negative
7	O Positive
8	O Negative
\.


--
-- Data for Name: branch; Type: TABLE DATA; Schema: public; Owner: student
--

COPY branch (branch_id, branch_name) FROM stdin;
05	B.Tech - CSE
12	B.Tech - IT
01	B.Tech - Civil
03	B.Tech - Mech
02	B.Tech - EEE
04	B.Tech - ECE
\.


--
-- Data for Name: exam_type; Type: TABLE DATA; Schema: public; Owner: student
--

COPY exam_type (exam_type_id, exam_type, max_marks) FROM stdin;
1	Internal - 1	25
2	Internal - 2	25
3	Assignment	5
4	External Descriptive	70
5	External Lab	50
\.


--
-- Data for Name: faculty_details; Type: TABLE DATA; Schema: public; Owner: student
--

COPY faculty_details (faculty_id, faculty_name, father_name, dob, doj, photo, aadhar, address, email, mobile, blood_group_id, is_active, emp_no, user_id, subject_id, qly_id, branch_id) FROM stdin;
10	Faculty	Father	2018-06-03	2018-05-02	ALIET_10_download.jpg	1234567812	Address	faculty@gmail.com	9440906389	\N	Y	4125	\N	\N	1	\N
13	Faculty Physics	Father	2018-07-03	2018-07-03	ALIET_13_download.jpg	99999999999999999999	Faculty Address	physics@gmail.com	3333333333	\N	Y	888	\N	\N	2	\N
18	ghgh	dgdfg	0006-09-08	0007-09-08		34534	dfhdfgh	sdfg4@sdf.ngh	2345	1	Y	2345	\N	199	3	\N
16	sdf	sdf	0006-09-08	0012-09-07		2341234	sdfafsd	sd34	1234	1	Y	234	\N	199	5	\N
15	New Facul	Kasi Viswanath	2016-02-01	2016-02-02	ALIET_15_student_er_diag1.jpg	423534	dfgtdfg	chooseraje@gmail.com	56456555	\N	Y	234345	\N	199	6	\N
11	Faculty	Father	2018-06-03	2018-05-02	ALIET_11_download.jpg	1234567812	Address	faculty@gmail.com	9440906389	\N	Y	4125	\N	\N	2	\N
17	ff gg	ss dd	0006-09-08	0007-09-08		3234	dfg	sdf2@sd.gg	3455555555	1	Y	34545	\N	196	2	\N
5	Ramu	Father	2019-03-13	2018-05-02	ALIET_5_download.jpg	1234567812	Address	a@gmail.com	9440906389	\N	Y	4125	147852	\N	4	\N
12	Ramu	Father	2019-03-13	2018-05-02	ALIET_12_download.jpg	1234567812345678	Address	faculty@gmail.com	3333333333	\N	Y	4125	\N	\N	3	\N
19	fg	jhgj	0007-09-08	0008-09-07		345	dfgsdg	chooseraje@gmail.com	345	1	Y	345	\N	164	1	\N
6	Ramu	Father	2019-03-13	2018-05-02	ALIET_6_download.jpg	1234567812	Address	a@gmail.com	9440906389	\N	Y	4125	147852	\N	3	\N
1	Raj	Prasad	\N	\N	\N	\N	\N	\N	\N	\N	Y	\N	fac01	\N	1	\N
21	New Facul	Kasi Viswanath	0006-09-08	0007-09-08		234234	sadfsdf	chooseraje@gmail.com	5645655555	1	Y	234345	\N	\N	1	5
\.


--
-- Name: faculty_details_faculty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('faculty_details_faculty_id_seq', 21, true);


--
-- Data for Name: qualifications; Type: TABLE DATA; Schema: public; Owner: student
--

COPY qualifications (qly_id, qly_name) FROM stdin;
1	M.Sc
2	MBA
3	B.Tech
4	MCA
5	PGDPA
6	BA
7	M Phil
8	B.Com
9	MA
10	Pre Ph. D
11	M.E/M.Tech
12	M.Com
13	Polytechnic 
14	B.E
15	SCJP
16	B.Sc
17	PGDBM
18	B.Plan
19	SSC
20	ML
21	PGDHRM
22	BCA
23	CA
24	ICWA
25	CS
26	Ph. D
28	MS
29	M.Pharm
30	MDS
31	BL/LLB
32	BBA
33	BS
34	MBBS
35	B.Pharm
36	BDS
37	DBA
38	PGDIT 
39	PMP 
40	M.LI.Sc
\.


--
-- Data for Name: role_services; Type: TABLE DATA; Schema: public; Owner: student
--

COPY role_services (role_id, service_id) FROM stdin;
1	1
1	10
1	9
1	8
1	6
1	5
1	4
1	3
1	2
1	11
1	12
1	13
1	14
1	7
1	15
1	16
1	17
1	18
3	1
3	14
3	15
3	18
3	19
3	20
3	21
2	21
2	19
2	14
2	20
2	10
2	13
2	18
4	22
4	23
1	24
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: student
--

COPY roles (role_id, role_name) FROM stdin;
2	Faculty
1	Admin
3	Student
4	Management
\.


--
-- Data for Name: semester; Type: TABLE DATA; Schema: public; Owner: student
--

COPY semester (semester_id, semester_name, year_id) FROM stdin;
1	1-1	1
2	1-2	1
3	2-1	2
4	2-2	2
5	3-1	3
6	3-2	3
7	4-1	4
8	4-2	4
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: student
--

COPY services (service_id, service_url, service_name, is_active, parent_id, dispay_order) FROM stdin;
4	searchStudent.do	Search Student	Y	14	52
7	studentAttendanceReport.do	Student Attendance Report	Y	14	51
8	studentProgressReport.do	Student Progress Report	Y	14	53
10	facultyReport.do	Faculty Report	Y	13	41
6	addStudentMarks.do	Add Student Marks	Y	12	33
5	addStudentAttendance.do	Add Student Attendance	Y	12	32
3	addStudent.do	Add Student	Y	12	31
9	addFaculty.do	Add Faculty	Y	11	21
11	home.do	Faculty Related	Y	0	2
1	home.do	Home	Y	0	1
14	home.do	Student Reports	Y	0	5
12	home.do	Student Related	Y	0	4
13	home.do	Faculty Reports	Y	0	3
16	home.do	Admin Services	Y	0	6
17	userCreation.do	User Creation	Y	16	1
18	changePassword.do	Change Password	Y	16	2
15	logout.do	Log Out	Y	0	10
19	studentPerAttReport.do	Student Attendance Report	Y	14	54
20	studentPerMarksReport.do	Student Marks Report	Y	14	55
21	studentDisplay.do	Student Display	Y	14	56
2	studentReport.do	Student List	Y	12	34
22	managementReport.do	Management Report	Y	23	41
23	home.do	Management Reports	Y	0	6
24	studentExcelUpload.do	Student Excel Upload	Y	12	34
\.


--
-- Data for Name: student_attendance; Type: TABLE DATA; Schema: public; Owner: student
--

COPY student_attendance (id, student_id, year_id, semester_id, branch_id, no_of_days, days_present, academic_year_id) FROM stdin;
5	8	1	1	12	41	40	1
29	2	1	2	12	45	44	1
31	4	1	2	05	78	45	1
32	1	1	2	05	44	23	1
38	4	1	1	05	45	21	1
39	1	1	1	05	43	22	1
\.


--
-- Name: student_attendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('student_attendance_id_seq', 40, true);


--
-- Data for Name: student_details; Type: TABLE DATA; Schema: public; Owner: student
--

COPY student_details (student_id, student_name, father_name, dob, doj, photo, aadhar, address, email, guardian_mobile, blood_group_id, academic_year_id, branch_id, is_active, roll_no, mobile_no, mother_name, gender, mentor_name) FROM stdin;
19	fgfg	sdfgdg	0006-09-08	0007-09-08		324234	asdfg	chooseraje@gmail.com	2234	1	1	05	Y	334	234	dg	M	dsfgdfg
10	TESTER	TEST1	1989-02-19	2018-02-19	G:/aliet_pics/18TESTER.png	123456789011	test	tester@gmail.com	9164678515	3	2	05	Y	18TESTER	9876543210	TEST2	M	Raj
6	aditya	ram	1998-09-07	2018-02-09	testing	946481064846	kakinada	adi.pavan.devil@gmail.com	9434618164	7	2	01	Y	14GAVSHBW	9464818164	prasanna	M	Raj
8	JALLA  BALARAM	chinnarao	1998-08-15	2018-02-16	G:/aliet_pics/14008-EE-004.png	904460584817	ampolu	jbalaram25@gmail.com	9160646215	5	1	12	Y	14008-EE-004	9160646215	JALLA karuvamma	M	Raj
5	balu	chinna	1998-02-17	2018-02-08	testing	904460521875	ampolu	balu@gmail.com	9989050547	4	4	01	Y	14008-EE-0006	9160646215	amma	M	Raj
1	Raj	Prasad	0007-04-05	0007-04-05		2342344234234	Hyderabad	raje.sarma@gmail.com	9866489944	2	1	05	Y	14HP1A1217	9059128803	Satya	M	Rajesh
17	Test	Kasi Viswanath	0006-09-08	0007-09-08		\N	dfgdfg	chooseraje@gmail.com	234	8	1	05	Y	DFG	234234	Lakshmi	M	dfgdfg
14	Student	Father	2018-06-03	2018-06-03	ALIET_14_download.jpg	1234567812	Student Address	student@gmail.com	1234567890	6	\N	05	Y	S123	0987675432	Mother	M	Mentor
2	Karthik	Ramu	1998-11-07	2017-11-07	No	355407205900	Kakinada	karthikchatla1@gmail.com	9440314327	2	1	12	Y	14HP1A1218	9110345579	Prasanna	M	Raj
16	sdf	zxcv	0006-09-08	0007-09-08		\N	sdfsadf	chooseraje@gmail.com	234	5	1	12	Y	SDF	234234	fdg	M	ssdf
4	jalla balaram	jalla chinnarao	0021-01-18	0012-08-10	ALIET_4_download.jpg	904460584817	ampolu	jbalaram25@gmail.com	9160646215	4	1	05	Y	14008-EE-006	9989050517	jalla karuvammma	M	Raj
23	Phani	Prasad	2016-04-11	2016-04-11	\N	841455448844	TS12EF4646	tej@gmail.com	9866489947	1	1	05	Y	2234	9866489944	Sujatha	F	Srinivas
24	Muthy	Sai	2016-04-11	2016-04-11	\N	841455448845	TS12EF4647	2106_B. Sujatha	9866489948	2	1	05	Y	2235	9866489945	Sailaja	M	Pradeep
25	Manaswi	Kumar	2016-04-11	2016-04-11	\N	841455448846	TS12EF4648	2106_B. Sujatha	9866489949	3	1	05	Y	2236	9866489946	Sathyavathi	F	Sunitha
\.


--
-- Name: student_details_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('student_details_student_id_seq', 25, true);


--
-- Data for Name: student_marks; Type: TABLE DATA; Schema: public; Owner: student
--

COPY student_marks (id, student_id, year_id, semester_id, subject_id, exam_type_id, marks, branch_id, academic_year_id, max_marks) FROM stdin;
8	4	1	1	1	1	23	05	1	25
9	1	1	1	1	1	20	05	1	25
10	4	1	1	2	4	65	05	1	70
11	1	1	1	2	4	63	05	1	70
12	4	1	1	1	2	15	05	1	25
13	1	1	1	1	2	18	05	1	25
14	4	1	1	1	3	4	05	1	5
15	1	1	1	1	3	4	05	1	5
16	4	1	1	1	4	56	05	1	70
17	1	1	1	1	4	61	05	1	70
18	4	1	1	1	5	40	05	1	50
19	1	1	1	1	5	42	05	1	50
25	4	1	1	4	1	23	05	1	25
26	1	1	1	4	1	21	05	1	25
27	4	1	1	69	1	22	05	1	25
28	1	1	1	69	1	21	05	1	25
33	4	1	1	70	1	14	05	1	25
34	1	1	1	70	1	16	05	1	25
35	4	1	1	71	1	24	05	1	25
36	1	1	1	71	1	23	05	1	25
37	4	1	1	72	1	23	05	1	25
40	6	2	3	223	1	25	01	2	25
\.


--
-- Name: student_marks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('student_marks_id_seq', 5, true);


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: student
--

COPY subjects (subject_id, subject_name, semester_id, branch_id, credits) FROM stdin;
199	elective-3	8	04	\N
196	Microwave Engg lab	7	04	\N
164	Management Science	4	04	\N
200	elective-4	8	04	\N
149	Engineering Mechanics	2	04	\N
198	Electronic Measurements and Instrumentation	8	04	\N
179	IPR & patents	5	04	\N
163	Electronic Circuit Analysis	4	04	\N
146	English-2	2	04	\N
8	English Comm. Lab	1	12	2
2	Maths-1	1	12	3
5	Computer Programming	1	12	3
1	English	1	12	3
3	Engineering Chemistry	1	12	3
6	Environmental Studies	1	12	2
9	Computer Programming lab	1	12	2
4	Engineering Mechanics	1	12	3
7	Chemistry Lab	1	12	3
10	English-2	2	12	3
11	Mathematics-2	2	12	3
12	Mathematics-3	2	12	3
13	Engineering Physics	2	12	3
14	Professional Ethics & Human Values	2	12	3
15	Engineering Drawing	2	12	3
16	English Communication Skills lab-2	2	12	2
17	Engineering Physics lab	2	12	2
18	Engg. Workshop & IT Workshop	2	12	2
19	Managerial Economics & Financial Analysis	3	12	3
20	Object Oriented Programming through C++	3	12	3
21	Mathematical Foundations of Computer Science	3	12	3
22	Digital Logic Design	3	12	3
23	Data Structures	3	12	3
24	Object Oriented Programming lab	3	12	2
25	Data Structures lab	3	12	2
26	Digital Logic Design Lab	3	12	2
27	Seminar	3	12	1
28	Probability and Statistics	4	12	3
29	Java Programming	4	12	3
30	Advanced Data Structures	4	12	3
31	Computer Organization	4	12	3
32	Language Processors	4	12	3
33	Advanced Data Structures lab	4	12	2
34	Java Programming lab	4	12	2
35	Free Open Source Software lab	4	12	2
36	Software Engineering	5	12	3
37	Data Communication	5	12	3
38	Advanced JAVA	5	12	3
39	Database Management System	5	12	3
40	Operating Systems	5	12	3
41	Advanced JAVA lab	5	12	3
42	Operating System lab	5	12	2
43	Database Management System lab	5	12	2
44	Linux Programming lab	5	12	2
45	Seminar	5	12	1
46	Computer Networks	6	12	3
47	Data Ware housing and Mining	6	12	3
48	Design and Analysis of Algorithms	6	12	3
49	Software Testing	6	12	3
50	Web Technologies	6	12	3
51	Computer Networks lab	6	12	2
52	Software Testing lab	6	12	2
53	Web Technologies lab	6	12	2
54	IPR and Patents	6	12	3
55	Cryptography and Network Security	7	12	3
56	UML & Design Patterns	7	12	3
57	Mobile Compting	7	12	3
58	Multimedia Computing(Elective-1)	7	12	3
59	Hadoop & BigData (Elective-2)	7	12	3
60	UML & Design Patterns lab	7	12	2
61	Mobile Applicatin Development Lab	7	12	2
62	Software Testing Lab	7	12	2
63	Hadoop & BigData Lab	7	12	2
64	Human Computer Interaction	8	12	3
65	Distributed Systems(Elective-3)	8	12	3
66	Mathematical Optimization	8	12	3
67	Management Science	8	12	3
68	Project	8	12	9
69	English-1	1	05	3
70	Mathematics-1	1	05	3
71	Engineering Chemistry	1	05	3
72	Engineering Mechanics	1	05	3
73	Computer Programing	1	05	3
74	Environmental Studies	1	05	3
75	Engineering Chemistry laboratory	1	05	2
76	English communcation skills lab-1	1	05	2
77	C Programming lab	1	05	2
78	English-2	2	05	3
79	Mathematics-2	2	05	3
80	Mathematics-3	2	05	3
81	Engineering Physics	2	05	3
82	Professional Ethics & Human Values	2	05	3
83	Engineering Drawing	2	05	3
84	English Communication Skills lab-2	2	05	2
85	Engineering Physics lab	2	05	2
86	Engg. Workshop & IT Workshop	2	05	2
87	Managerial Economics & Financial Analysis	3	05	3
88	Object Oriented Programming through C++	3	05	3
89	Mathematical Foundations of Computer Science	3	05	3
90	Digital Logic Design	3	05	3
91	Data Structures	3	05	3
92	Object Oriented Programming lab	3	05	2
93	Data Structures lab	3	05	2
94	Digital Logic Design Lab	3	05	2
95	Seminar	3	05	1
96	Probability and Statistics	4	05	3
97	Java Programming	4	05	3
98	Advanced Data Structures	4	05	3
99	Computer Organization	4	05	3
159	Signals & Systems	3	04	\N
156	Electronic Devices and Circuits	3	04	\N
176	pulse & Digital circuits lab	5	04	\N
193	elective-1	7	04	\N
180	Microprocessors and Microcontrollers	6	04	\N
191	Digital Image Processing	7	04	\N
202	English-1	1	01	3
203	Mathematics-1	1	01	3
100	Formal Languages and Automata Theory	4	05	3
101	Advanced Data Structures lab	4	05	2
102	Java Programming lab	4	05	2
103	Free Open Source Software lab	4	05	2
104	Compiler Design	5	05	3
105	Data Communication	5	05	3
106	Principles of programming languages	5	05	3
107	Database Management System	5	05	3
108	Operating Systems	5	05	3
109	Compiler Design lab	5	05	3
110	Operating System lab	5	05	2
111	Database Management System lab	5	05	2
112	Linux Programming lab	5	05	2
113	Seminar	5	05	1
114	Computer Networks	6	05	3
115	Data Ware housing and Mining	6	05	3
116	Design and Analysis of Algorithms	6	05	3
117	Software Engineering	6	05	3
118	Web Technologies	6	05	3
119	Computer Networks lab	6	05	2
120	Software Engineering lab	6	05	2
121	Web Technologies lab	6	05	2
122	IPR and Patents	6	05	3
123	Cryptography and Network Security	7	05	3
124	UML & Design Patterns	7	05	3
125	Mobile Compting	7	05	3
126	Multimedia Computing(Elective-1)	7	05	3
127	Hadoop & BigData (Elective-2)	7	05	3
128	UML & Design Patterns lab	7	05	2
129	Mobile Applicatin Development Lab	7	05	2
130	Software Testing Lab	7	05	2
131	Hadoop & BigData Lab	7	05	2
133	Elective-4	8	05	3
135	Management Science	8	05	3
132	Elective-3	8	05	3
134	Mathematical Optimization	8	05	3
136	Project	8	05	9
137	English-1	1	04	\N
138	Mathematics-1	1	04	\N
139	Mathematics-2	1	04	\N
140	Engineering physics	1	04	\N
141	Professional Ethics and Human Values	1	04	\N
142	Engineering Drawing	1	04	\N
143	English-Communication Skills lab-1	1	04	\N
144	Engg physics lab	1	04	\N
145	Engg Workshop & IT Workshop	1	04	\N
152	Engg Chemistry lab	2	04	\N
175	Antennas and wave propagation	5	04	\N
151	Network Analysis	2	04	\N
188	Seminar	6	04	\N
197	Cellular Mobile Communication	8	04	\N
181	Digital Signal Processing	6	04	\N
166	Switching Theory & Logic Design	4	04	\N
186	Digital Communications lab	6	04	\N
150	Computer Programming	2	04	\N
165	Random Variables & Stochastic processes	4	04	\N
158	Environmental Studies	3	04	\N
178	Digital System Design & DICA lab	5	04	\N
160	Electrical Technology	3	04	\N
167	EM Waves and Transmission Lines	4	04	\N
162	Network & Electrical Technology lab	3	04	\N
161	Electronic Devices and Circuits lab	3	04	\N
173	Control Systems	5	04	\N
183	Microwave Engineering	6	04	\N
154	Computer Programming Lab	2	04	\N
190	Computer Networks	7	04	\N
171	Pulse and Digital Circuits	5	04	\N
192	Computer Architecture & Organization	7	04	\N
148	Engineering Chemistry	2	04	\N
174	Digital System Design & Digital IC Applications	5	04	\N
170	Analog Communications lab	4	04	\N
147	Mathematics-2	2	04	\N
177	LIC Applications lab	5	04	\N
182	Digital Communications	6	04	\N
155	Managerial Economics & Financial Analysis	3	04	\N
157	Data Structures	3	04	\N
189	VLSI Design	7	04	\N
184	open elective	6	04	\N
195	VLSI lab	7	04	\N
153	English Communication Skills lab-2	2	04	\N
194	elective-2	7	04	\N
187	Digital Signal Processing lab	6	04	\N
172	Linear IC Applications	5	04	\N
169	Electronic Circuit Analysis lab	4	04	\N
185	Microprocessors and Microcontrollers lab	6	04	\N
201	project	8	04	\N
168	Analog Communications	4	04	\N
204	Engineering Chemistry	1	01	3
205	Engineering Mechanics	1	01	3
206	Computer Programing	1	01	3
207	Environmental Studies	1	01	3
208	Engineering Chemistry laboratory	1	01	2
209	English communcation skills lab-1	1	01	2
210	C Programming lab	1	01	2
211	English-2	2	01	3
212	Mathematics-2	2	01	3
213	Mathematics-3	2	01	3
214	Engineering Physics	2	01	3
215	Professional Ethics & Human Values	2	01	3
216	Engineering Drawing	2	01	3
217	English Communication Skills lab-2	2	01	2
218	Engineering Physics lab	2	01	2
219	Engg. Workshop & IT Workshop	2	01	2
220	Electrical & Electronics Engineering	3	01	3
221	Probability & Statistics	3	01	3
222	Strength of Materials-1	3	01	3
223	Building Materials and Construction	3	01	3
224	Surveying	3	01	3
225	Fluid Mechanics	3	01	3
226	Surveying Field work-1	3	01	2
227	Strength of Materials lab	3	01	2
228	Building Planning & Drawing	4	01	3
229	Managerial Economics & Financial Analysis	4	01	3
230	Strength of Materials-2	4	01	3
231	Hydraulics and Hydraulic Machinery	4	01	3
232	Concrete Technology	4	01	3
233	Structural Analysis-1	4	01	3
234	Fluid Mechanics & Hydraulic Machinery lab	4	01	2
235	Concrete Technology lab	4	01	2
236	Sryveying Field work-2	4	01	2
237	Engineering Geology	5	01	\N
238	Structural Analysis-2	5	01	\N
239	Design & Drawing of Reinforced Concrete Structures	5	01	\N
240	Geotechnical Engineering-1	5	01	\N
241	Transportation Engineering-1	5	01	\N
242	IPR & patents	5	01	\N
243	Geotechnical Engineering lab	5	01	\N
244	Engineering Geology lab	5	01	\N
245	Design & Drawing of steel structures 	6	01	\N
246	Geotechnical Engineering-2	6	01	\N
247	Water Resources Engineering	6	01	\N
248	EnvironmentalEngineering-1	6	01	\N
249	Transportation Engineering-2	6	01	\N
250	Open Elective	6	01	\N
251	Computer Aided Engineering Drawing	6	01	\N
252	Transporation Engineering lab	6	01	\N
253	Environmental Engineering-2	7	01	\N
254	Prestressed Concrete	7	01	\N
255	Contructive Technology and Management	7	01	\N
256	Water Resources Engg-2	7	01	\N
257	Remote Sensing and GIS Applications	7	01	\N
258	elective-1	7	01	\N
259	Environmental Engineering lab	7	01	\N
260	GIS & CAD lab	7	01	\N
261	Estimating,Specifications & contrcats	8	01	3
262	elective-2	8	01	3
263	elective-3	8	01	3
264	elective-4	8	01	3
265	Project work	8	01	9
266	English-1	1	02	\N
267	Mathematics-1	1	02	\N
268	Mathematics-2	1	02	\N
269	Engineering physics	1	02	\N
270	Professional Ethics and Human Values	1	02	\N
271	Engineering Drawing	1	02	\N
272	English-Communication Skills lab-1	1	02	\N
273	Engg physics lab	1	02	\N
274	Engg Workshop & IT Workshop	1	02	\N
275	English-2	2	02	\N
276	Mathematics-2	2	02	\N
277	Engineering Chemistry	2	02	\N
278	Engineering Mechanics	2	02	\N
279	Computer Programming	2	02	\N
280	Network Analysis	2	02	\N
281	Engg Chemistry lab	2	02	\N
282	English Communication Skills lab-2	2	02	\N
283	Computer Programming Lab	2	02	\N
284	Electrical Circuit Analysis-2	3	02	\N
285	Thermal & Hydro Prime movers	3	02	\N
286	Basic Electronics and devices	3	02	\N
287	Complex variables and statistical methods	3	02	\N
288	Electro Magnetic Fields	3	02	\N
289	Electrical Machines-1	3	02	\N
290	Thermal and Hydro lab	3	02	\N
291	Electrical Circuits lab	3	02	\N
292	Environmental Studies	4	02	\N
293	Switching Theory and logic design	4	02	\N
294	Pulse & Digital Circuits	4	02	\N
295	Power Systems-1	4	02	\N
296	Electrical Machines-2	4	02	\N
297	Control Systems	4	02	\N
298	Electrical Machines-1 lab	4	02	\N
299	Electronic Devices & Circuit lab	4	02	\N
300	Managerial Economics and Financial Analysis	5	02	\N
301	Electrical Measurements	5	02	\N
302	power Systems-2	5	02	\N
303	Electrical Machines-3	5	02	\N
304	Power Electronics	5	02	\N
305	Linear & Digital IC Applications	5	02	\N
306	Electrical Machines-2 lab	5	02	\N
307	Control Systems lab	5	02	\N
308	IPR & Patents	5	02	\N
309	Switch gear and Protection	6	02	\N
310	Microprocessors & Microcontrollers	6	02	\N
311	Utilization of electrical energy	6	02	\N
312	power system analysis	6	02	\N
313	power semiconductor Drives	6	02	\N
314	Management Science	6	02	\N
315	Power Electronics lab	6	02	\N
316	Electrical Measurements lab	6	02	\N
317	Renewable Energy sourcesand systems	7	02	\N
318	HVAC & DC Transmission	7	02	\N
319	power system operation & control	7	02	\N
320	open elective	7	02	\N
321	elective-1	7	02	\N
322	Microprocessors & Microcontrollers lab	7	02	\N
323	Electrical Simulation lab	7	02	\N
324	Power systems lab	7	02	\N
325	Digital Control Systems	8	02	\N
326	elective-2	8	02	\N
327	elective-3	8	02	\N
328	elective-4	8	02	\N
329	Project	8	02	\N
330	English-1	1	03	3
331	Mathematics-1	1	03	3
332	Engineering Chemistry	1	03	3
333	Engineering Mechanics	1	03	3
334	Computer Programing	1	03	3
335	Environmental Studies	1	03	3
336	Engineering Chemistry laboratory	1	03	2
337	English communcation skills lab-1	1	03	2
338	C Programming lab	1	03	2
339	English-2	2	03	3
340	Mathematics-2	2	03	3
341	Mathematics-3	2	03	3
342	Engineering Physics	2	03	3
343	Professional Ethics & Human Values	2	03	3
344	Engineering Drawing	2	03	3
345	English Communication Skills lab-2	2	03	2
346	Engineering Physics lab	2	03	2
347	Engg. Workshop & IT Workshop	2	03	2
348	Metallurgy & Material Science	3	03	3
349	Mechanics of solids	3	03	3
350	Thermodynamics	3	03	3
351	Managerial Economics & Financial Analysis	3	03	3
352	Basic Electrical & Electronics Engg	3	03	3
353	Computer aided Engg Drawing practice	3	03	2
354	Basic Electrical & Electronics Engg lab	3	03	2
355	Mechanics of solids & Metallurgy lab	3	03	2
356	Kinematics of Machinery	4	03	3
357	Thermal Engg-1	4	03	3
358	Production Technology	4	03	3
359	Fluid Mechanics & Hydraulic Machinery	4	03	3
360	Machine Drawing	4	03	3
361	Fluid Mechanics & Hydraulic Machinery lab	4	03	2
362	Production Technology lab	4	03	2
363	Thermal Engg lab	4	03	2
364	Dynamics of manchinery	5	03	3
365	Metal cutting & machine tools	5	03	3
366	Design of machine members-1	5	03	3
367	Instrumentation & Control systems	5	03	3
368	Thermal engg-2	5	03	3
369	Metrology	5	03	3
370	Metrology & Instrumentation lab	5	03	2
371	Machine tools lab	5	03	2
372	IPR & Patents	5	03	2
373	Operations Research	6	03	3
374	Interactive Computer Graphics	6	03	3
375	Design of machine Memebrs-2	6	03	3
376	Robotics	6	03	3
377	Heat Transfer	6	03	3
378	Industrial Engg Management	6	03	2
379	Departmental elective-1	6	03	2
380	Heat Transfer lab	6	03	2
381	Automobile Engineering	7	03	3
382	CAD/CAM	7	03	3
383	Finite Element Methods	7	03	3
384	Unconventional Machining Processes	7	03	3
385	open elective	7	03	3
386	Departmental elective-2	7	03	2
387	Simulation lab	7	03	2
388	Design/Fabrication project	7	03	2
389	Elective-3	8	03	3
390	Elective-4	8	03	3
391	Production planning and control	8	03	3
392	Green Engineering systems	8	03	3
393	Project	8	03	9
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: student
--

COPY users (id, user_name, password, is_active, role_id, user_desc, student_id, faculty_id) FROM stdin;
3	rajeswar	rajeswar	Y	2	Rajeswara Sarma	\N	\N
2	Balu	balu	Y	3	Jalla Balaram	\N	\N
4	karthik	karthik	Y	3	Karthik	\N	\N
1	admin	guest	Y	1	Admin	\N	\N
5	ALI_STU_51	guest	Y	3	Raj User	1	\N
6	ALI_FAC_61	guest	Y	2	Raj Faculty	\N	1
7	ALI_FAC_75	guest	Y	2	Ramu User1	\N	5
8	management	guest	Y	4	Management	\N	\N
\.


--
-- Data for Name: years; Type: TABLE DATA; Schema: public; Owner: student
--

COPY years (year_no, year_name) FROM stdin;
1	I Year
2	2 Year
3	3 Year
4	4 Year
\.


--
-- Name: academic_year_pkey; Type: CONSTRAINT; Schema: public; Owner: student; Tablespace: 
--

ALTER TABLE ONLY academic_year
    ADD CONSTRAINT academic_year_pkey PRIMARY KEY (year_id);


--
-- Name: blood_group_pkey; Type: CONSTRAINT; Schema: public; Owner: student; Tablespace: 
--

ALTER TABLE ONLY blood_group
    ADD CONSTRAINT blood_group_pkey PRIMARY KEY (bg_id);


--
-- Name: branch_pkey; Type: CONSTRAINT; Schema: public; Owner: student; Tablespace: 
--

ALTER TABLE ONLY branch
    ADD CONSTRAINT branch_pkey PRIMARY KEY (branch_id);


--
-- Name: exam_type_pkey; Type: CONSTRAINT; Schema: public; Owner: student; Tablespace: 
--

ALTER TABLE ONLY exam_type
    ADD CONSTRAINT exam_type_pkey PRIMARY KEY (exam_type_id);


--
-- Name: faculty_details_pkey; Type: CONSTRAINT; Schema: public; Owner: student; Tablespace: 
--

ALTER TABLE ONLY faculty_details
    ADD CONSTRAINT faculty_details_pkey PRIMARY KEY (faculty_id);


--
-- Name: qualifications_pkey; Type: CONSTRAINT; Schema: public; Owner: student; Tablespace: 
--

ALTER TABLE ONLY qualifications
    ADD CONSTRAINT qualifications_pkey PRIMARY KEY (qly_id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: student; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- Name: semester_pkey; Type: CONSTRAINT; Schema: public; Owner: student; Tablespace: 
--

ALTER TABLE ONLY semester
    ADD CONSTRAINT semester_pkey PRIMARY KEY (semester_id);


--
-- Name: services_pkey; Type: CONSTRAINT; Schema: public; Owner: student; Tablespace: 
--

ALTER TABLE ONLY services
    ADD CONSTRAINT services_pkey PRIMARY KEY (service_id);


--
-- Name: st_id_roll_no_unique; Type: CONSTRAINT; Schema: public; Owner: student; Tablespace: 
--

ALTER TABLE ONLY student_details
    ADD CONSTRAINT st_id_roll_no_unique UNIQUE (roll_no);


--
-- Name: student_attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: student; Tablespace: 
--

ALTER TABLE ONLY student_attendance
    ADD CONSTRAINT student_attendance_pkey PRIMARY KEY (id);


--
-- Name: student_attendance_unique; Type: CONSTRAINT; Schema: public; Owner: student; Tablespace: 
--

ALTER TABLE ONLY student_attendance
    ADD CONSTRAINT student_attendance_unique UNIQUE (student_id, year_id, semester_id, branch_id, academic_year_id);


--
-- Name: student_details_pkey; Type: CONSTRAINT; Schema: public; Owner: student; Tablespace: 
--

ALTER TABLE ONLY student_details
    ADD CONSTRAINT student_details_pkey PRIMARY KEY (student_id);


--
-- Name: student_marks_pkey; Type: CONSTRAINT; Schema: public; Owner: student; Tablespace: 
--

ALTER TABLE ONLY student_marks
    ADD CONSTRAINT student_marks_pkey PRIMARY KEY (id);


--
-- Name: student_marks_unique; Type: CONSTRAINT; Schema: public; Owner: student; Tablespace: 
--

ALTER TABLE ONLY student_marks
    ADD CONSTRAINT student_marks_unique UNIQUE (student_id, year_id, semester_id, subject_id, exam_type_id, branch_id, academic_year_id);


--
-- Name: subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: student; Tablespace: 
--

ALTER TABLE ONLY subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (subject_id);


--
-- Name: user_id_pkey; Type: CONSTRAINT; Schema: public; Owner: student; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT user_id_pkey PRIMARY KEY (id);


--
-- Name: years_pkey; Type: CONSTRAINT; Schema: public; Owner: student; Tablespace: 
--

ALTER TABLE ONLY years
    ADD CONSTRAINT years_pkey PRIMARY KEY (year_no);


--
-- Name: blood_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY student_details
    ADD CONSTRAINT blood_group_id_fkey FOREIGN KEY (blood_group_id) REFERENCES blood_group(bg_id);


--
-- Name: fac_qly_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY faculty_details
    ADD CONSTRAINT fac_qly_id_fkey FOREIGN KEY (qly_id) REFERENCES qualifications(qly_id);


--
-- Name: faculty_sub_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY faculty_details
    ADD CONSTRAINT faculty_sub_id_fkey FOREIGN KEY (subject_id) REFERENCES subjects(subject_id);


--
-- Name: role_services_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY role_services
    ADD CONSTRAINT role_services_role_id_fkey FOREIGN KEY (role_id) REFERENCES roles(role_id);


--
-- Name: role_services_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY role_services
    ADD CONSTRAINT role_services_service_id_fkey FOREIGN KEY (service_id) REFERENCES services(service_id);


--
-- Name: sa_br_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY student_attendance
    ADD CONSTRAINT sa_br_id_fkey FOREIGN KEY (branch_id) REFERENCES branch(branch_id);


--
-- Name: semester_year_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY semester
    ADD CONSTRAINT semester_year_id_fkey FOREIGN KEY (year_id) REFERENCES years(year_no);


--
-- Name: st_ac_yr_id; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY student_details
    ADD CONSTRAINT st_ac_yr_id FOREIGN KEY (academic_year_id) REFERENCES academic_year(year_id);


--
-- Name: st_branch_id; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY student_details
    ADD CONSTRAINT st_branch_id FOREIGN KEY (branch_id) REFERENCES branch(branch_id);


--
-- Name: student_attendance_batch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY student_attendance
    ADD CONSTRAINT student_attendance_batch_id_fkey FOREIGN KEY (academic_year_id) REFERENCES academic_year(year_id);


--
-- Name: student_attendance_semester_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY student_attendance
    ADD CONSTRAINT student_attendance_semester_id_fkey FOREIGN KEY (semester_id) REFERENCES semester(semester_id);


--
-- Name: student_attendance_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY student_attendance
    ADD CONSTRAINT student_attendance_student_id_fkey FOREIGN KEY (student_id) REFERENCES student_details(student_id);


--
-- Name: student_attendance_year_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY student_attendance
    ADD CONSTRAINT student_attendance_year_id_fkey FOREIGN KEY (year_id) REFERENCES years(year_no);


--
-- Name: student_marks_academic_year_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY student_marks
    ADD CONSTRAINT student_marks_academic_year_fkey FOREIGN KEY (academic_year_id) REFERENCES academic_year(year_id);


--
-- Name: student_marks_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY student_marks
    ADD CONSTRAINT student_marks_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES branch(branch_id);


--
-- Name: student_marks_exaam_type_fkey	; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY student_marks
    ADD CONSTRAINT "student_marks_exaam_type_fkey	" FOREIGN KEY (exam_type_id) REFERENCES exam_type(exam_type_id);


--
-- Name: student_marks_sem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY student_marks
    ADD CONSTRAINT student_marks_sem_id_fkey FOREIGN KEY (semester_id) REFERENCES semester(semester_id);


--
-- Name: student_marks_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY student_marks
    ADD CONSTRAINT student_marks_student_id_fkey FOREIGN KEY (student_id) REFERENCES student_details(student_id);


--
-- Name: student_marks_year_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY student_marks
    ADD CONSTRAINT student_marks_year_id_fkey FOREIGN KEY (year_id) REFERENCES years(year_no);


--
-- Name: student_msrks_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY student_marks
    ADD CONSTRAINT student_msrks_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES subjects(subject_id);


--
-- Name: sub_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY subjects
    ADD CONSTRAINT sub_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES branch(branch_id);


--
-- Name: sub_sem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY subjects
    ADD CONSTRAINT sub_sem_id_fkey FOREIGN KEY (semester_id) REFERENCES semester(semester_id);


--
-- Name: user_faculty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY users
    ADD CONSTRAINT user_faculty_id_fkey FOREIGN KEY (faculty_id) REFERENCES faculty_details(faculty_id);


--
-- Name: user_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY users
    ADD CONSTRAINT user_role_id_fkey FOREIGN KEY (role_id) REFERENCES roles(role_id);


--
-- Name: user_std_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY users
    ADD CONSTRAINT user_std_id_fkey FOREIGN KEY (student_id) REFERENCES student_details(student_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

