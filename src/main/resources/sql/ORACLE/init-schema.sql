    drop table table_name_one cascade constraints;

    drop table table_name_two cascade constraints;

    drop sequence s_table_name_one;

    drop sequence s_table_name_two;

    create table table_name_one (
        ID number(19,0) not null,
        name varchar2(255 char) not null,
        two_id number(19,0) not null,
        primary key (ID)
    );

    create table table_name_two (
        ID number(19,0) not null,
        name varchar2(255 char) not null,
        primary key (ID)
    );


    alter table table_name_one
        add constraint FK_e90x4bv2h1lfvo2cm8yboq3ro 
        foreign key (two_id)
        references table_name_two;

    create sequence table_name_one start with 1 increment by 1;

    create sequence table_name_two start with 1 increment by 1;

    create index IDX_table_name_one on table_name_one(name, two_id);