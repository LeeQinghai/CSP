
DROP TABLE IF EXISTS users;
create table users(
	user_id  		char(12) not null primary key COMMENT '用户ID',
	user_name   char(30) COMMENT '用户名',
	phone       char(11) COMMENT '手机号',
	password    char(50) COMMENT '密码',
	email       char(50) COMMENT '邮箱地址',
	pic_url			text	COMMENT '头像链接地址',
	state       int(1) not null default 0 COMMENT '有效用户与否 0: 未登录过 1:是',
	create_dt   datetime not null COMMENT '创建日期',
	update_dt   datetime COMMENT '修改日期',
	create_id   char(12) not null COMMENT '创建人',
	update_id   char(12) COMMENT '修改人'
);

DROP TABLE IF EXISTS teacher;
create table teacher(
	teacher_id    char(12) not null primary key COMMENT '老师ID',    	
	teacher_name  CHAR(30) COMMENT '老师名称',        
	job_no        CHAR(12) COMMENT '工号',            
	phone         CHAR(11) COMMENT '手机号',          
	sex           CHAR(1) COMMENT '性别',             
	birth         datetime COMMENT '出生日期',        
	address       CHAR(255) COMMENT '住址',  
	job_postion		CHAR(10)	COMMENT '职位。基础表',
	title					CHAR(10)	COMMENT '职称。基础表',
	teach_group		CHAR(10)	COMMENT '所属教研组。基础表',    
	id_card           char(30)  COMMENT '身份证号'  ,                             
	ethnic            char(10)  COMMENT '民族代码,基础表',                                                
	rpr               char(10)  COMMENT '户籍所在地registered residence,基础表',  
	rrt               char(10)  COMMENT '户籍类型,基础表',                        
	political_status  char(10)  COMMENT '政治面貌,基础表',      
	hire_dt       datetime COMMENT '入职日期',        
	leave_dt      datetime COMMENT '离职日期',        
	user_id       char(12) COMMENT '用户ID',   
	state         int(1) not null default 1 COMMENT '状态 1:工作 2：离职',              
	create_dt     datetime not null COMMENT '创建日期',        
	upadte_dt     datetime COMMENT '修改日期',        
	create_id     char(12) not null  COMMENT '创建人',   
	update_id     char(12) COMMENT '修改人' 
);

DROP TABLE IF EXISTS course;
create table course(
	course_id     char(12) not null auto_increment primary key COMMENT '课程ID',    
	course_name   char(30)        COMMENT '课程名',    
	school_level  char(10)         COMMENT '学校级别。基础表',  
	state         int(1)          not null default 1 COMMENT '状态 1：正常 2：废弃',      
	create_dt     datetime        not null COMMENT '创建日期',  
	upadte_dt     datetime        COMMENT '修改日期',  
	create_id     char(12) not null COMMENT '创建人',    
	update_id     char(12) COMMENT '修改人'  
); 

DROP TABLE IF EXISTS teacher_course;
create table teacher_course(
	teacher_id char(12) COMMENT '老师ID' ,                                  
	course_id  char(12) COMMENT '课程ID' ,                                  
	state      int(1)       not null default 1 COMMENT '状态 1：正常 2：废弃'  ,   
	create_dt     datetime        not null COMMENT '创建日期',  
	upadte_dt     datetime        COMMENT '修改日期',  
	create_id     char(12) not null COMMENT '创建人',    
	update_id     char(12) COMMENT '修改人',
	primary key(teacher_id,course_id)                                   
);

DROP TABLE IF EXISTS student;
create table student(
	student_id    char(12) not null auto_increment primary key COMMENT '学生ID',  
	student_name  CHAR(30)        COMMENT '学生姓名',
	student_code  CHAR(30)        COMMENT '学号',    
	class_id      char(12) COMMENT '班级ID',  
	phone         CHAR(11)        COMMENT '手机号',  
	email         CHAR(50)        COMMENT '邮箱',    
	sex           CHAR(1)         COMMENT '性别',    
	birth         datetime        COMMENT '出生日期',
	address       CHAR(255)       COMMENT '住址',  
	family_status     char(10)  COMMENT '家庭状况,基础表', 
	id_card           char(30)  COMMENT '身份证号'  ,                             
	ethnic            char(10)  COMMENT '民族代码,基础表',                        
	academic          char(10)  COMMENT '学籍,基础表',                            
	rpr               char(10)  COMMENT '户籍所在地registered residence,基础表',  
	rrt               char(10)  COMMENT '户籍类型,基础表',                        
	political_status  char(10)  COMMENT '政治面貌,基础表',                        
	user_id       char(12) COMMENT '用户ID',  
	state         int(1)          not null default 1 COMMENT '状态 1：正常 2：废弃',
	enter_date    datetime        COMMENT '入学日期',
	leave_date    datetime        COMMENT '离开日期',
	create_dt     datetime       not null  COMMENT '创建日期',
	upadte_dt     datetime        COMMENT '修改日期',
	create_id     char(12)  not null COMMENT '创建人',  
	update_id     char(12) COMMENT '修改人' 
);

DROP TABLE IF EXISTS class;
create table class(
	class_id			char(12) not null auto_increment primary key COMMENT '班级ID',
	enter_year    char(4)    not null COMMENT '入学年份 几届：2010、2011。。。',        
	class_number  char(2)    not null COMMENT '班 几班：1、2、3。。。',                 
	school_level  char(1)    not null COMMENT '级别 S:高中 J:初中',       
	class_type		char(10)	 COMMENT '班级类型。基础表',              
	teacher_id    char(12) COMMENT '老师ID 班主任',   
	parent_id    char(12) COMMENT '家长ID 家长主任',                            
	state         int(1)     not null default 1 COMMENT '状态 1:正常 2：废弃 3：毕业',            
	create_dt     datetime   not null COMMENT '创建日期',                               
	upadte_dt     datetime COMMENT '修改日期',                                          
	create_id     char(12) not null COMMENT '创建人',                            
	update_id     char(12) COMMENT '修改人'                                    
);

DROP TABLE IF EXISTS class_student;
create table class_student(
	id        			char(12) not null auto_increment primary key COMMENT 'ID',
	class_id        char(12) COMMENT '班级ID',                         
	student_id      char(12) COMMENT '学生ID',                          
	student_role_id char(12) COMMENT '学生职务',                       
	state           int(1)       not null default 1   COMMENT '状态 1:正常 2：无效',    
	create_dt       datetime   not null     COMMENT  '创建日期',              
	upadte_dt       datetime        COMMENT '修改日期',                       
	create_id       char(12) not null COMMENT '创建人',                 
	update_id       char(12) COMMENT '修改人'   
);

DROP TABLE IF EXISTS class_course;
create table class_course(
	class_id    char(12) COMMENT '班级ID',             
	semester_id char(12) COMMENT '学期ID',             
	course_id   char(12) COMMENT '课程ID',             
	teacher_id  char(12) COMMENT '老师ID',             
	state           int(1)       not null default 1   COMMENT '状态 1:正常 2：无效',    
	create_dt       datetime  not null      COMMENT  '创建日期',              
	upadte_dt       datetime        COMMENT '修改日期',                       
	create_id       char(12) not null COMMENT '创建人',                 
	update_id       char(12) COMMENT '修改人',  
  primary key(class_id,semester_id,course_id)           
);

DROP TABLE IF EXISTS parent;
create table parent(
parent_id     char(12) not null auto_increment primary key COMMENT '家长ID',       
parent_name   CHAR(30)        COMMENT '家长姓名',                                         
occupation    CHAR(50)        COMMENT '职业',                                             
organization  CHAR(100)       COMMENT '所属单位/公司',    
organization_type	CHAR(10)		COMMENT '单位性质。 基础表',                                
job_position  CHAR(50)        COMMENT '职位',                                             
phone         CHAR(11)        COMMENT '手机号',                                           
sex           CHAR(1)         COMMENT '性别',                                             
birth         datetime        COMMENT '出生日期',                                         
address       CHAR(255)       COMMENT '住址',                                             
user_id       char(12) COMMENT '用户ID',                                            
state         int(1)       not null default 1   COMMENT '状态 1:正常 2：无效',          
create_dt     datetime    not null    COMMENT '创建日期',                              
upadte_dt     datetime        COMMENT '修改日期',                                       
create_id     char(12) not null COMMENT '创建人',                                 
update_id     char(12) COMMENT '修改人'                                          
);

DROP TABLE IF EXISTS parent_student;
create table parent_student(
	parent_id     char(12) COMMENT '家长ID',  
	student_id    char(12) COMMENT '学生ID',  
	relationship  CHAR(10)        COMMENT '关系.基础表',    
	state         int(1)       not null default 1   COMMENT '状态 1:正常 2：无效',          
	create_dt     datetime   not null     COMMENT  '创建日期',                              
	upadte_dt     datetime        COMMENT '修改日期',                                       
	create_id     char(12) not null COMMENT '创建人',                                 
	update_id     char(12) COMMENT '修改人', 
	primary key(parent_id,student_id)                                               
);

DROP TABLE IF EXISTS exam;
create table exam(
  exam_id     char(12) not null auto_increment primary key COMMENT '考试ID',
exam_name   char(50)        COMMENT '考试名称',
exam_type   char(10)        COMMENT '考试类型',
  course_id   char(12) COMMENT '课程ID',
  semester_id char(12) COMMENT '学期ID',
exam_time   datetime        COMMENT '考试时间',
    state       int(1)  NOT NULL default 1   COMMENT '状态.1:正常 2：无效',
create_dt   datetime    NOT NULL    COMMENT '创建日期',
upadte_dt   datetime        COMMENT '修改日期',
  create_id   char(12) NOT NULL COMMENT '创建人',
  update_id   char(12) COMMENT '修改人'
)

DROP TABLE IF EXISTS exam_invigilator;
create table exam_invigilator(
exam_id     char(12) COMMENT '考试ID',                
teacher_id  char(12) COMMENT '老师ID  监考老师',      
state       int(1)          COMMENT '状态    1:正常 2：无效',
create_dt   datetime        COMMENT '创建日期',              
upadte_dt   datetime        COMMENT '修改日期',              
create_id   char(12) COMMENT '创建人',                
update_id   char(12) COMMENT '修改人' ,
primary key(exam_id, teacher_id)               
)

DROP TABLE IF EXISTS score;
create table score(
	exam_id     char(12) not null	COMMENT '考试ID',
	student_id    char(12) COMMENT '学生ID',
	score           int(4) unsigned COMMENT '分数',
	class_average   int(4) unsigned COMMENT '班级平均分',
	class_ranking   int(5) unsigned COMMENT '班级排名',
	grade_average   int(4) unsigned COMMENT '年纪平均分',
	grade_ranking   int(5) unsigned COMMENT '年级排名',
	score_date      datetime        COMMENT '考试日期',
	state       int(1)  NOT NULL default 1   COMMENT '状态.1:正常 2：无效',
	primary key(exam_id, student_id)   
);

DROP TABLE IF EXISTS semester;
create table semester(
    semester_id   char(12) not null auto_increment primary key   COMMENT '学期ID',
semester_name char(100)         COMMENT '学期中文名',
  start_date    datetime          COMMENT '开始日期',
  end_date      datetime          COMMENT '结束日期',
      state         int(1)    not null default 1   COMMENT '状态',
  create_dt     datetime     not null     COMMENT '创建日期',
  upadte_dt     datetime          COMMENT '修改日期',
    create_id     char(12)  not null COMMENT '创建人',
    update_id     char(12)   COMMENT '修改人'
);

DROP TABLE IF EXISTS common;
create table common(
class       char(5) COMMENT '分类',                         
class_cd    char(5) COMMENT '代码',                         
name        char(100) COMMENT '名称',                       
discription char(100) COMMENT '描述',                       
value1      char(100) COMMENT '值1',                        
value2      char(100) COMMENT '值2',                        
value3      char(100) COMMENT '值3',                        
state       int(1)      not null COMMENT '状态',            
create_dt   datetime     not null COMMENT '创建日期',       
upadte_dt   datetime COMMENT '修改日期',                    
create_id   char(12)   not null COMMENT '创建人',    
update_id   char(12) COMMENT '修改人',               
primary key(class,class_cd)             
);

DROP TABLE IF EXISTS groups;
create table groups(
	group_id    char(12)  not null auto_increment primary key  COMMENT '群组ID',
	group_name  char(50)          COMMENT '群组名称',
	class_id		char(12) 	COMMENT '对映班级',
	state       int(1)        not null default 1   COMMENT '状态 1:正常 2：废弃', 
	create_dt   datetime      not null    COMMENT '创建日期',
	upadte_dt   datetime          COMMENT '修改日期',
	create_id   char(12)  not null COMMENT '创建人',
	update_id   char(12)   COMMENT '修改人'
);

DROP TABLE IF EXISTS group_member;
create table group_member(
	group_id    char(12)  COMMENT '群组ID',                           
	user_id     char(12)  COMMENT '用户ID', 
	role_cd			char(10) COMMENT '群中权限角色。基础表',                          
	state       int(1)       not null default 1     COMMENT '状态 1:已加入 2:已邀请 3：未加入', 
	create_dt   datetime      not null   COMMENT '创建日期',                         
	upadte_dt   datetime         COMMENT '修改日期',                         
	create_id   char(12) not null COMMENT '创建人',                           
	update_id   char(12)  COMMENT '修改人' ,
	primary key(group_id,user_id)                           
);

DROP TABLE IF EXISTS bulletin;
create table bulletin(
	bulletin_id char(12) not null auto_increment primary key   COMMENT '公告ID', 
	level 	int(1) unsigned not null default 1 COMMENT '基础表 。1:群级别2：年级3：学校级4:家长5:老师6:学生',
	group_id    char(12) COMMENT '群组ID', 
	content     text      COMMENT '内容', 
	top					char(1)		COMMENT '置顶与否。置顶：1',
	state       int(1)       not null default 1     COMMENT '状态 1:正常 2：废弃', 
	create_dt   datetime      not null   COMMENT '创建日期',                         
	upadte_dt   datetime         COMMENT '修改日期',                         
	create_id   char(12) not null COMMENT '创建人',                           
	update_id   char(12)  COMMENT '修改人' 
);

DROP TABLE IF EXISTS bulletin_reply;
create table bulletin_reply(
	bulletin_reply_id char(12) not null auto_increment primary key   COMMENT '回复ID', 
	bulletin_id       char(12)  COMMENT '公告ID', 
	content           text       COMMENT '内容', 
	anonymous     char(1)      not null default 'N'  COMMENT '匿名与否',
	state       int(1)       not null default 1     COMMENT '状态 1:正常 2：废弃', 
	create_dt   datetime      not null   COMMENT '创建日期',                         
	upadte_dt   datetime         COMMENT '修改日期',                         
	create_id   char(12) not null COMMENT '创建人',                           
	update_id   char(12)  COMMENT '修改人' 
);

DROP TABLE IF EXISTS bulletin_user_read;
create table bulletin_user_read(
	bulletin_id char(12)  COMMENT '公告ID', 
	user_id		char(12)	COMMENT '用户ID', 
	readable		char(1) COMMENT '阅读与否。已阅：Y',
	praise		char(1)	COMMENT '点赞与否。赞：Y',
	state       int(1)       not null default 1     COMMENT '状态 1:有效 2：无效', 
	create_dt   datetime      not null   COMMENT '创建日期',                         
	upadte_dt   datetime         COMMENT '修改日期',                         
	create_id   char(12) not null COMMENT '创建人',                           
	update_id   char(12)  COMMENT '修改人' 
);

DROP TABLE IF EXISTS survey;
create table survey(
survey_id       char(12) not null auto_increment primary key   COMMENT '投票ID',  
level 	int(1) unsigned not null default 1 COMMENT '基础表 。1:群级别2：年级3：学校级4:家长5:老师6:学生',
group_id      char(12)   COMMENT '群组ID',  
create_id     char(12)   COMMENT '发起人',  
content  text         COMMENT '内容',    
deadline      datetime          COMMENT '截至日期',
anonymous     char(1)      not null default 'N'  COMMENT '匿名与否',
state         int(1)        not null  default 1  COMMENT '状态 1:进行中 2：已结束 3：废弃',    
create_dt     datetime      not null     COMMENT '创建日期',
upadte_dt     datetime          COMMENT '修改日期',
update_id     char(12)   COMMENT '修改人'   
);

DROP TABLE IF EXISTS survey_question;
create table survey_question(
question_id     char(12) not null auto_increment primary key COMMENT '问题ID',
question_order  int(3) unsigned COMMENT '排序',
survey_id       char(12) COMMENT '投票ID',
content         text            COMMENT '内容',
question_type			char(10)				COMMENT '类型，多选、单选。基础表',
state           int(1)          COMMENT '状态. 1：有效 2：废弃',
create_dt       datetime        COMMENT '创建日期',
upadte_dt       datetime        COMMENT '修改日期',
update_id       char(12) COMMENT '修改人'
);

DROP TABLE IF EXISTS survey_question_option;
create table survey_question_option(
question_id     char(12)  COMMENT '问题ID',
option_seq      int(2) unsigned  COMMENT '选项序号',
content  text         COMMENT '内容',
state           int(1)     not null  default 1   COMMENT '状态 1：正常 2：废弃',
primary key(question_id,option_seq )
);

DROP TABLE IF EXISTS survey_result;
create table survey_result(
	question_id     char(12)  COMMENT '问题ID',
	option_seq      int(2) unsigned  COMMENT '选项序号',
	user_id     char(12)  not null COMMENT '用户ID',
	content  text         COMMENT '内容',
	state       int(1)    not null    default 1  COMMENT '状态 1：正常 2：废弃',
	create_dt   datetime    not null    COMMENT '创建日期',
	upadte_dt   datetime        COMMENT '修改日期',
	update_id   char(12) COMMENT '修改人',
primary key(question_id,option_seq ,user_id)  
);