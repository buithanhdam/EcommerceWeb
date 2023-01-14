

CREATE TABLE USER(
	USER_ID CHAR(30) primary key not null,
	FullName nvarchar(30)   ,
	Username VARCHAR(20) not null,
	Email varchar(40) not null,
	USER_Password VARCHAR(70) not null,
	Phone VARCHAR(10)  ,
	Birth Date ,
	ImageURL VARCHAR(150),
	GioiTinh nvarchar(3)  ,
	CMND VARCHAR(20) ,
	DiaChi Nvarchar(300),
BankCard VARCHAR(20),
	USER_Role int not null default 0
);



CREATE TABLE DIADIEM(
	DiaDiem_ID char(10) primary key not null,
	TenDiaDiem Nvarchar(20)  not null,
	ImageURL VARCHAR(150)
	
)


CREATE TABLE TOUR(
	TOUR_ID char(30) PRIMARY KEY not null,
	
	TourName nvarchar(100)  not null,
	DiaDiem_ID char(10) not null REFERENCES DIADIEM(DiaDiem_ID),
	TrangThai TINYINT not null DEFAULT 1,
	NgayTao date ,
	NgayKhoiHanh date not null,
	NgayKetThuc date not null,
	NoiKhoiHanh nvarchar(30)  not null,
	SoLuong int not null,
	PhuongTienDiChuyen nvarchar(20)  not null,
	ImageURL not null VARCHAR(150),
	Description nvarchar(500)  not null,
	
	TOUR_CATEGORY nvarchar(20)  not null
	
)	

create table TOUR_TYPE(
TOUR_ID char(30) not null REFERENCES TOUR(TOUR_ID),
Type TINYINT not null,
GiaVe float not null
)


CREATE TABLE BOOKING(
BOOKING_ID char(30) not null,
TOUR_ID char(30) not null REFERENCES TOUR(TOUR_ID),
USER_ID CHAR(30) not null REFERENCES USER(USER_ID),
HoTen nvarchar(30) not null,
Email varchar(40) not null,
Phone VARCHAR(10)  not null,
DiaChi Nvarchar(300)  not null,
SOLUONG_VENGUOILON TINYINT,
SOLUONG_VETREEM TINYINT,
SOLUONG TINYINT not null,
TRANGTHAI tinyint not null,
NgayTao date not null,
TongTien float not null,
Description nvarchar(300) ,
CONSTRAINT CHECK_SOLUONG CHECK(SOLUONG = SOLUONG_VENGUOILON +SOLUONG_VETREEM)
)
create table REVIEW(
	TOUR_ID char(30) not null REFERENCES TOUR(TOUR_ID),
USER_ID CHAR(30) not null REFERENCES USER(USER_ID),
Comment nvarchar(200) not null,
NgayTao date not null,
Category nvarchar(20) ,
Stars int not null CHECK(stars <= 5)
)


CREATE TABLE TOUR_DETAIL_PER_DAY(
	TOUR_ID char(30) not null REFERENCES TOUR(TOUR_ID),
	Title nvarchar(50)  not null,
	Ngay TINYINT not null,
	
	Description nvarchar(500)  not null
)



create table TOUR_DETAIL_IMAGE(
TOUR_ID char(30) not null REFERENCES TOUR(TOUR_ID),
ImageURL VARCHAR(150)
)

CREATE TABLE VOUCHER(
VOUCHER_ID char(30) PRIMARY KEY not null,
VOUCHER_VALUE int not null,
NgayBatDau date not null,
NgayKetThuc date not null,
TRANGTHAI tinyint not null,
CONSTRAINT CHECK_DATE CHECK (NgayKetThuc > NgayBatDau)
)



CREATE TABLE TOUR_VOUCHER(
TOUR_ID char(30) not null REFERENCES TOUR(TOUR_ID),
VOUCHER_ID char(30) not null REFERENCES VOUCHER(VOUCHER_ID)
)


CREATE table TOUR_GUIDE(
TOUR_ID char(30) not null REFERENCES TOUR(TOUR_ID),
USER_ID CHAR(30) not null REFERENCES USER(USER_ID)

)

CREATE TABLE BLOG(
BLOG_ID char(30) primary key not null,
USER_ID CHAR(30) not null REFERENCES USER(USER_ID),
DiaDiem_ID char(10) not null REFERENCES DIADIEM(DiaDiem_ID),
BLOG_TITLE nvarchar(100) not null,
Description nvarchar(1000)  not null,
NgayVietBai date not null ,
ImageURL VARCHAR(150),
blog_category nvarchar(25) not null

)

create table BLOG_IMAGE(
BLOG_ID char(30) not null REFERENCES BLOG(BLOG_ID),
ImageURL VARCHAR(150)


)


CREATE TABLE BLOG_COMMENT(
BLOG_ID char(30) not null REFERENCES BLOG(BLOG_ID ),
USER_ID CHAR(30) not null REFERENCES USER(USER_ID),
Comment nvarchar(300) not null,
NgayTao date not null,
Stars int not null CHECK(stars <= 5)
)



CREATE TABLE LIKE_TOUR(
TOUR_ID char(30) not null REFERENCES TOUR(TOUR_ID),
USER_ID CHAR(30) not null REFERENCES USER(USER_ID)

)

create table aboutus(
Aboutus_id char(30) not null,
aboutus_title nvarchar(100) not null,
aboutus_image char(150) ,
aboutus_description nvarchar(10000) not null

)

create table aboutus_detail(
Aboutus_id char(30) not null REFERENCES aboutus(Aboutus_id),
aboutus_title nvarchar(100) not null,
aboutus_image char(150) ,
aboutus_description nvarchar(10000) not null
)


