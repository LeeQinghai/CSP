
DROP TABLE IF EXISTS users;
create table users(
	user_id  		char(12) not null primary key COMMENT '�û�ID',
	user_name   char(30) COMMENT '�û���',
	phone       char(11) COMMENT '�ֻ���',
	password    char(50) COMMENT '����',
	email       char(50) COMMENT '�����ַ',
	pic_url			text	COMMENT 'ͷ�����ӵ�ַ',
	state       int(1) not null default 0 COMMENT '��Ч�û���� 0: δ��¼�� 1:��',
	create_dt   datetime not null COMMENT '��������',
	update_dt   datetime COMMENT '�޸�����',
	create_id   char(12) not null COMMENT '������',
	update_id   char(12) COMMENT '�޸���'
);

DROP TABLE IF EXISTS teacher;
create table teacher(
	teacher_id    char(12) not null primary key COMMENT '��ʦID',    	
	teacher_name  CHAR(30) COMMENT '��ʦ����',        
	job_no        CHAR(12) COMMENT '����',            
	phone         CHAR(11) COMMENT '�ֻ���',          
	sex           CHAR(1) COMMENT '�Ա�',             
	birth         datetime COMMENT '��������',        
	address       CHAR(255) COMMENT 'סַ',  
	job_postion		CHAR(10)	COMMENT 'ְλ��������',
	title					CHAR(10)	COMMENT 'ְ�ơ�������',
	teach_group		CHAR(10)	COMMENT '���������顣������',    
	id_card           char(30)  COMMENT '���֤��'  ,                             
	ethnic            char(10)  COMMENT '�������,������',                                                
	rpr               char(10)  COMMENT '�������ڵ�registered residence,������',  
	rrt               char(10)  COMMENT '��������,������',                        
	political_status  char(10)  COMMENT '������ò,������',      
	hire_dt       datetime COMMENT '��ְ����',        
	leave_dt      datetime COMMENT '��ְ����',        
	user_id       char(12) COMMENT '�û�ID',   
	state         int(1) not null default 1 COMMENT '״̬ 1:���� 2����ְ',              
	create_dt     datetime not null COMMENT '��������',        
	upadte_dt     datetime COMMENT '�޸�����',        
	create_id     char(12) not null  COMMENT '������',   
	update_id     char(12) COMMENT '�޸���' 
);

DROP TABLE IF EXISTS course;
create table course(
	course_id     char(12) not null auto_increment primary key COMMENT '�γ�ID',    
	course_name   char(30)        COMMENT '�γ���',    
	school_level  char(10)         COMMENT 'ѧУ���𡣻�����',  
	state         int(1)          not null default 1 COMMENT '״̬ 1������ 2������',      
	create_dt     datetime        not null COMMENT '��������',  
	upadte_dt     datetime        COMMENT '�޸�����',  
	create_id     char(12) not null COMMENT '������',    
	update_id     char(12) COMMENT '�޸���'  
); 

DROP TABLE IF EXISTS teacher_course;
create table teacher_course(
	teacher_id char(12) COMMENT '��ʦID' ,                                  
	course_id  char(12) COMMENT '�γ�ID' ,                                  
	state      int(1)       not null default 1 COMMENT '״̬ 1������ 2������'  ,   
	create_dt     datetime        not null COMMENT '��������',  
	upadte_dt     datetime        COMMENT '�޸�����',  
	create_id     char(12) not null COMMENT '������',    
	update_id     char(12) COMMENT '�޸���',
	primary key(teacher_id,course_id)                                   
);

DROP TABLE IF EXISTS student;
create table student(
	student_id    char(12) not null auto_increment primary key COMMENT 'ѧ��ID',  
	student_name  CHAR(30)        COMMENT 'ѧ������',
	student_code  CHAR(30)        COMMENT 'ѧ��',    
	class_id      char(12) COMMENT '�༶ID',  
	phone         CHAR(11)        COMMENT '�ֻ���',  
	email         CHAR(50)        COMMENT '����',    
	sex           CHAR(1)         COMMENT '�Ա�',    
	birth         datetime        COMMENT '��������',
	address       CHAR(255)       COMMENT 'סַ',  
	family_status     char(10)  COMMENT '��ͥ״��,������', 
	id_card           char(30)  COMMENT '���֤��'  ,                             
	ethnic            char(10)  COMMENT '�������,������',                        
	academic          char(10)  COMMENT 'ѧ��,������',                            
	rpr               char(10)  COMMENT '�������ڵ�registered residence,������',  
	rrt               char(10)  COMMENT '��������,������',                        
	political_status  char(10)  COMMENT '������ò,������',                        
	user_id       char(12) COMMENT '�û�ID',  
	state         int(1)          not null default 1 COMMENT '״̬ 1������ 2������',
	enter_date    datetime        COMMENT '��ѧ����',
	leave_date    datetime        COMMENT '�뿪����',
	create_dt     datetime       not null  COMMENT '��������',
	upadte_dt     datetime        COMMENT '�޸�����',
	create_id     char(12)  not null COMMENT '������',  
	update_id     char(12) COMMENT '�޸���' 
);

DROP TABLE IF EXISTS class;
create table class(
	class_id			char(12) not null auto_increment primary key COMMENT '�༶ID',
	enter_year    char(4)    not null COMMENT '��ѧ��� ���죺2010��2011������',        
	class_number  char(2)    not null COMMENT '�� ���ࣺ1��2��3������',                 
	school_level  char(1)    not null COMMENT '���� S:���� J:����',       
	class_type		char(10)	 COMMENT '�༶���͡�������',              
	teacher_id    char(12) COMMENT '��ʦID ������',   
	parent_id    char(12) COMMENT '�ҳ�ID �ҳ�����',                            
	state         int(1)     not null default 1 COMMENT '״̬ 1:���� 2������ 3����ҵ',            
	create_dt     datetime   not null COMMENT '��������',                               
	upadte_dt     datetime COMMENT '�޸�����',                                          
	create_id     char(12) not null COMMENT '������',                            
	update_id     char(12) COMMENT '�޸���'                                    
);

DROP TABLE IF EXISTS class_student;
create table class_student(
	id        			char(12) not null auto_increment primary key COMMENT 'ID',
	class_id        char(12) COMMENT '�༶ID',                         
	student_id      char(12) COMMENT 'ѧ��ID',                          
	student_role_id char(12) COMMENT 'ѧ��ְ��',                       
	state           int(1)       not null default 1   COMMENT '״̬ 1:���� 2����Ч',    
	create_dt       datetime   not null     COMMENT  '��������',              
	upadte_dt       datetime        COMMENT '�޸�����',                       
	create_id       char(12) not null COMMENT '������',                 
	update_id       char(12) COMMENT '�޸���'   
);

DROP TABLE IF EXISTS class_course;
create table class_course(
	class_id    char(12) COMMENT '�༶ID',             
	semester_id char(12) COMMENT 'ѧ��ID',             
	course_id   char(12) COMMENT '�γ�ID',             
	teacher_id  char(12) COMMENT '��ʦID',             
	state           int(1)       not null default 1   COMMENT '״̬ 1:���� 2����Ч',    
	create_dt       datetime  not null      COMMENT  '��������',              
	upadte_dt       datetime        COMMENT '�޸�����',                       
	create_id       char(12) not null COMMENT '������',                 
	update_id       char(12) COMMENT '�޸���',  
  primary key(class_id,semester_id,course_id)           
);

DROP TABLE IF EXISTS parent;
create table parent(
parent_id     char(12) not null auto_increment primary key COMMENT '�ҳ�ID',       
parent_name   CHAR(30)        COMMENT '�ҳ�����',                                         
occupation    CHAR(50)        COMMENT 'ְҵ',                                             
organization  CHAR(100)       COMMENT '������λ/��˾',    
organization_type	CHAR(10)		COMMENT '��λ���ʡ� ������',                                
job_position  CHAR(50)        COMMENT 'ְλ',                                             
phone         CHAR(11)        COMMENT '�ֻ���',                                           
sex           CHAR(1)         COMMENT '�Ա�',                                             
birth         datetime        COMMENT '��������',                                         
address       CHAR(255)       COMMENT 'סַ',                                             
user_id       char(12) COMMENT '�û�ID',                                            
state         int(1)       not null default 1   COMMENT '״̬ 1:���� 2����Ч',          
create_dt     datetime    not null    COMMENT '��������',                              
upadte_dt     datetime        COMMENT '�޸�����',                                       
create_id     char(12) not null COMMENT '������',                                 
update_id     char(12) COMMENT '�޸���'                                          
);

DROP TABLE IF EXISTS parent_student;
create table parent_student(
	parent_id     char(12) COMMENT '�ҳ�ID',  
	student_id    char(12) COMMENT 'ѧ��ID',  
	relationship  CHAR(10)        COMMENT '��ϵ.������',    
	state         int(1)       not null default 1   COMMENT '״̬ 1:���� 2����Ч',          
	create_dt     datetime   not null     COMMENT  '��������',                              
	upadte_dt     datetime        COMMENT '�޸�����',                                       
	create_id     char(12) not null COMMENT '������',                                 
	update_id     char(12) COMMENT '�޸���', 
	primary key(parent_id,student_id)                                               
);

DROP TABLE IF EXISTS exam;
create table exam(
  exam_id     char(12) not null auto_increment primary key COMMENT '����ID',
exam_name   char(50)        COMMENT '��������',
exam_type   char(10)        COMMENT '��������',
  course_id   char(12) COMMENT '�γ�ID',
  semester_id char(12) COMMENT 'ѧ��ID',
exam_time   datetime        COMMENT '����ʱ��',
    state       int(1)  NOT NULL default 1   COMMENT '״̬.1:���� 2����Ч',
create_dt   datetime    NOT NULL    COMMENT '��������',
upadte_dt   datetime        COMMENT '�޸�����',
  create_id   char(12) NOT NULL COMMENT '������',
  update_id   char(12) COMMENT '�޸���'
)

DROP TABLE IF EXISTS exam_invigilator;
create table exam_invigilator(
exam_id     char(12) COMMENT '����ID',                
teacher_id  char(12) COMMENT '��ʦID  �࿼��ʦ',      
state       int(1)          COMMENT '״̬    1:���� 2����Ч',
create_dt   datetime        COMMENT '��������',              
upadte_dt   datetime        COMMENT '�޸�����',              
create_id   char(12) COMMENT '������',                
update_id   char(12) COMMENT '�޸���' ,
primary key(exam_id, teacher_id)               
)

DROP TABLE IF EXISTS score;
create table score(
	exam_id     char(12) not null	COMMENT '����ID',
	student_id    char(12) COMMENT 'ѧ��ID',
	score           int(4) unsigned COMMENT '����',
	class_average   int(4) unsigned COMMENT '�༶ƽ����',
	class_ranking   int(5) unsigned COMMENT '�༶����',
	grade_average   int(4) unsigned COMMENT '���ƽ����',
	grade_ranking   int(5) unsigned COMMENT '�꼶����',
	score_date      datetime        COMMENT '��������',
	state       int(1)  NOT NULL default 1   COMMENT '״̬.1:���� 2����Ч',
	primary key(exam_id, student_id)   
);

DROP TABLE IF EXISTS semester;
create table semester(
    semester_id   char(12) not null auto_increment primary key   COMMENT 'ѧ��ID',
semester_name char(100)         COMMENT 'ѧ��������',
  start_date    datetime          COMMENT '��ʼ����',
  end_date      datetime          COMMENT '��������',
      state         int(1)    not null default 1   COMMENT '״̬',
  create_dt     datetime     not null     COMMENT '��������',
  upadte_dt     datetime          COMMENT '�޸�����',
    create_id     char(12)  not null COMMENT '������',
    update_id     char(12)   COMMENT '�޸���'
);

DROP TABLE IF EXISTS common;
create table common(
class       char(5) COMMENT '����',                         
class_cd    char(5) COMMENT '����',                         
name        char(100) COMMENT '����',                       
discription char(100) COMMENT '����',                       
value1      char(100) COMMENT 'ֵ1',                        
value2      char(100) COMMENT 'ֵ2',                        
value3      char(100) COMMENT 'ֵ3',                        
state       int(1)      not null COMMENT '״̬',            
create_dt   datetime     not null COMMENT '��������',       
upadte_dt   datetime COMMENT '�޸�����',                    
create_id   char(12)   not null COMMENT '������',    
update_id   char(12) COMMENT '�޸���',               
primary key(class,class_cd)             
);

DROP TABLE IF EXISTS groups;
create table groups(
	group_id    char(12)  not null auto_increment primary key  COMMENT 'Ⱥ��ID',
	group_name  char(50)          COMMENT 'Ⱥ������',
	class_id		char(12) 	COMMENT '��ӳ�༶',
	state       int(1)        not null default 1   COMMENT '״̬ 1:���� 2������', 
	create_dt   datetime      not null    COMMENT '��������',
	upadte_dt   datetime          COMMENT '�޸�����',
	create_id   char(12)  not null COMMENT '������',
	update_id   char(12)   COMMENT '�޸���'
);

DROP TABLE IF EXISTS group_member;
create table group_member(
	group_id    char(12)  COMMENT 'Ⱥ��ID',                           
	user_id     char(12)  COMMENT '�û�ID', 
	role_cd			char(10) COMMENT 'Ⱥ��Ȩ�޽�ɫ��������',                          
	state       int(1)       not null default 1     COMMENT '״̬ 1:�Ѽ��� 2:������ 3��δ����', 
	create_dt   datetime      not null   COMMENT '��������',                         
	upadte_dt   datetime         COMMENT '�޸�����',                         
	create_id   char(12) not null COMMENT '������',                           
	update_id   char(12)  COMMENT '�޸���' ,
	primary key(group_id,user_id)                           
);

DROP TABLE IF EXISTS bulletin;
create table bulletin(
	bulletin_id char(12) not null auto_increment primary key   COMMENT '����ID', 
	level 	int(1) unsigned not null default 1 COMMENT '������ ��1:Ⱥ����2���꼶3��ѧУ��4:�ҳ�5:��ʦ6:ѧ��',
	group_id    char(12) COMMENT 'Ⱥ��ID', 
	content     text      COMMENT '����', 
	top					char(1)		COMMENT '�ö�����ö���1',
	state       int(1)       not null default 1     COMMENT '״̬ 1:���� 2������', 
	create_dt   datetime      not null   COMMENT '��������',                         
	upadte_dt   datetime         COMMENT '�޸�����',                         
	create_id   char(12) not null COMMENT '������',                           
	update_id   char(12)  COMMENT '�޸���' 
);

DROP TABLE IF EXISTS bulletin_reply;
create table bulletin_reply(
	bulletin_reply_id char(12) not null auto_increment primary key   COMMENT '�ظ�ID', 
	bulletin_id       char(12)  COMMENT '����ID', 
	content           text       COMMENT '����', 
	anonymous     char(1)      not null default 'N'  COMMENT '�������',
	state       int(1)       not null default 1     COMMENT '״̬ 1:���� 2������', 
	create_dt   datetime      not null   COMMENT '��������',                         
	upadte_dt   datetime         COMMENT '�޸�����',                         
	create_id   char(12) not null COMMENT '������',                           
	update_id   char(12)  COMMENT '�޸���' 
);

DROP TABLE IF EXISTS bulletin_user_read;
create table bulletin_user_read(
	bulletin_id char(12)  COMMENT '����ID', 
	user_id		char(12)	COMMENT '�û�ID', 
	readable		char(1) COMMENT '�Ķ�������ģ�Y',
	praise		char(1)	COMMENT '��������ޣ�Y',
	state       int(1)       not null default 1     COMMENT '״̬ 1:��Ч 2����Ч', 
	create_dt   datetime      not null   COMMENT '��������',                         
	upadte_dt   datetime         COMMENT '�޸�����',                         
	create_id   char(12) not null COMMENT '������',                           
	update_id   char(12)  COMMENT '�޸���' 
);

DROP TABLE IF EXISTS survey;
create table survey(
survey_id       char(12) not null auto_increment primary key   COMMENT 'ͶƱID',  
level 	int(1) unsigned not null default 1 COMMENT '������ ��1:Ⱥ����2���꼶3��ѧУ��4:�ҳ�5:��ʦ6:ѧ��',
group_id      char(12)   COMMENT 'Ⱥ��ID',  
create_id     char(12)   COMMENT '������',  
content  text         COMMENT '����',    
deadline      datetime          COMMENT '��������',
anonymous     char(1)      not null default 'N'  COMMENT '�������',
state         int(1)        not null  default 1  COMMENT '״̬ 1:������ 2���ѽ��� 3������',    
create_dt     datetime      not null     COMMENT '��������',
upadte_dt     datetime          COMMENT '�޸�����',
update_id     char(12)   COMMENT '�޸���'   
);

DROP TABLE IF EXISTS survey_question;
create table survey_question(
question_id     char(12) not null auto_increment primary key COMMENT '����ID',
question_order  int(3) unsigned COMMENT '����',
survey_id       char(12) COMMENT 'ͶƱID',
content         text            COMMENT '����',
question_type			char(10)				COMMENT '���ͣ���ѡ����ѡ��������',
state           int(1)          COMMENT '״̬. 1����Ч 2������',
create_dt       datetime        COMMENT '��������',
upadte_dt       datetime        COMMENT '�޸�����',
update_id       char(12) COMMENT '�޸���'
);

DROP TABLE IF EXISTS survey_question_option;
create table survey_question_option(
question_id     char(12)  COMMENT '����ID',
option_seq      int(2) unsigned  COMMENT 'ѡ�����',
content  text         COMMENT '����',
state           int(1)     not null  default 1   COMMENT '״̬ 1������ 2������',
primary key(question_id,option_seq )
);

DROP TABLE IF EXISTS survey_result;
create table survey_result(
	question_id     char(12)  COMMENT '����ID',
	option_seq      int(2) unsigned  COMMENT 'ѡ�����',
	user_id     char(12)  not null COMMENT '�û�ID',
	content  text         COMMENT '����',
	state       int(1)    not null    default 1  COMMENT '״̬ 1������ 2������',
	create_dt   datetime    not null    COMMENT '��������',
	upadte_dt   datetime        COMMENT '�޸�����',
	update_id   char(12) COMMENT '�޸���',
primary key(question_id,option_seq ,user_id)  
);