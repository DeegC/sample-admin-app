/* CREATE DATABASE Sqlite3 */ ;
DROP TABLE IF EXISTS professor ;
DROP TABLE IF EXISTS sample_app ;
DROP TABLE IF EXISTS scheduled_class ;
DROP TABLE IF EXISTS student ;
DROP TABLE IF EXISTS class ;
DROP TABLE IF EXISTS mm_scheduledclassstghtbyprofesso ;
DROP TABLE IF EXISTS mm_scheduled_class_for_student ;



/* Entity - Professor */
CREATE TABLE professor ( 
           id                               INTEGER PRIMARY KEY NOT NULL, 
           name                             longtext           NOT NULL ) ;
 

 
/* Entity - SampleApp */
CREATE TABLE sample_app ( 
           id                               INTEGER PRIMARY KEY NOT NULL ) ;
 

 
/* Entity - ScheduledClass */
CREATE TABLE scheduled_class ( 
           id                               INTEGER PRIMARY KEY NOT NULL, 
           fk_id_class                      INTEGER  NOT NULL ) ;
 

 
/* Entity - Student */
CREATE TABLE student ( 
           id                               INTEGER PRIMARY KEY NOT NULL, 
           name                             longtext           NOT NULL, 
           fk_id_professor                  INTEGER  NOT NULL ) ;
 

 
/* Entity - Class */
CREATE TABLE class ( 
           id                               INTEGER PRIMARY KEY NOT NULL, 
           name                             int                NOT NULL ) ;
 

 
CREATE TABLE mm_scheduledclassstghtbyprofesso ( 
           fk_id_professor                  INTEGER PRIMARY KEY NOT NULL, 
           fk_id_scheduled_class            INTEGER NOT NULL ) ;
 

 
CREATE TABLE mm_scheduled_class_for_student ( 
           fk_id_student                    INTEGER PRIMARY KEY NOT NULL, 
           fk_id_scheduled_class            INTEGER  NOT NULL ) ;
 

 
/* Main key for Entity - Professor */
CREATE UNIQUE INDEX Uprofessor_id_2330 
       ON professor ( 
           id ) ;
 
 
 

 

/* Main key for Entity - SampleApp */
CREATE UNIQUE INDEX Usample_app_id_2370 
       ON sample_app ( 
           id ) ;
 
 
 

 

/* Main key for Entity - ScheduledClass */
CREATE UNIQUE INDEX Uscheduled_class_id_2400 
       ON scheduled_class ( 
           id ) ;
 
 
 

/* Index for Relationship - 'class(is scheduled [0:m] ) scheduled_class' */
CREATE INDEX scheduled_class_fk_id_class_2500 
       ON scheduled_class ( 
           fk_id_class ) ;
 


 
 

/* Main key for Entity - Student */
CREATE UNIQUE INDEX Ustudent_id_2430 
       ON student ( 
           id ) ;
 
 
 

/* Index for Relationship - 'professor(advises [0:m] ) student' */
CREATE INDEX student_fk_id_professor_2550 
       ON student ( 
           fk_id_professor ) ;
 


 
 

/* Main key for Entity - Class */
CREATE UNIQUE INDEX Uclass_id_2470 
       ON class ( 
           id ) ;
 
 
 

 

CREATE UNIQUE INDEX mmscheduledclassstghtbyprofessoi 
       ON mm_scheduledclassstghtbyprofesso ( 
           fk_id_professor, 
           fk_id_scheduled_class ) ;
 
 
 

/* Index for Relationship - 'professor(teaches [0:m] ) mm_scheduledclassstghtbyprofesso' */
CREATE INDEX mmscheduledclassstghtbyprofessof 
       ON mm_scheduledclassstghtbyprofesso ( 
           fk_id_professor ) ;
 


 

 
 

CREATE UNIQUE INDEX mmscheduledclassforstudentidmmsc 
       ON mm_scheduled_class_for_student ( 
           fk_id_student, 
           fk_id_scheduled_class ) ;
 
 
 

/* Index for Relationship - 'student(attends [0:m] ) mm_scheduled_class_for_student' */
CREATE INDEX mmscheduledclassforstudentfkidst 
       ON mm_scheduled_class_for_student ( 
           fk_id_student ) ;
 


 
/* Index for Relationship - 'scheduled_class(for [0:m] ) mm_scheduled_class_for_student' */
CREATE INDEX mmscheduledclassforstudentfkidsc 
       ON mm_scheduled_class_for_student ( 
           fk_id_scheduled_class ) ;
