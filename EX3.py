import pymssql
import traceback
from time import sleep
'''
#
#
# 数据库操作方法
#
#
#
'''

class PYSQL(object):

    def __init__(self, host, user, pwd, db):
        # print(host)
        self.conn = pymssql.connect(host, user, pwd, db)
        self.cursor = self.conn.cursor()

    def create_table_func(self,sql):
        self.cursor.execute(sql)
        print('数据表创建完毕')

    def insert_date(self, sql):
        try:
            self.cursor.execute(sql)
            self.conn.commit()
            return True
        except:
            print(traceback.format_exc())
            self.conn.rollback()
            return False

    def update_data(self,sql):
        try:
            self.cursor.execute(sql)
            self.conn.commit()
        except:
            print(traceback.format_exc())
            self.conn.rollback()

    def delete_data(self,sql):
        try:
            self.cursor.execute(sql)
            self.conn.commit()
        except:
            print(traceback.format_exc())
            self.conn.rollback()

    def select_data(self, sql):
        self.cursor.execute(sql)
        all_data = self.cursor.fetchall()
        return all_data

    def close(self):
        self.cursor.close()
        self.conn.close()

def select1():
    my = PYSQL('127.0.0.1:58097', 'sa', '031702237', 'EX3')
    sql = "select * from Student"
    result = my.select_data(sql)
    for vi in result:
        print("学号：{}    姓名：{}   性别：{}   专业：{}".format(vi[0],vi[1],vi[2],vi[3]))
    my.close()

def select2():
    my = PYSQL('127.0.0.1:58097', 'sa', '031702237', 'EX3')
    sql = "select Student.Sno,Student.Sname,Course.Cno,Course.Cname,SC.Grade from Student ,Course,SC where Student.Sno=SC.Sno and Course.Cno=SC.Cno order by Sno asc;"
    result = my.select_data(sql)
    for vi in result:
        print("学号：{}    姓名：{}   课程号：{}   课程：{}   成绩：{}".format(vi[0], vi[1], vi[2], vi[3], vi[4]))
    my.close()

def select3():
    my = PYSQL('127.0.0.1:58097', 'sa', '031702237', 'EX3')
    sql = "select * from Course"
    result = my.select_data(sql)
    for vi in result:
        print("课程号：{}    课程名：{}   先修课程：{}   学分：{}".format(vi[0],vi[1],vi[2],vi[3]))
    my.close()

def select4():
    my = PYSQL('127.0.0.1:58097', 'sa', '031702237', 'EX3')
    sql = "select * from Department"
    result = my.select_data(sql)
    for vi in result:
        print("专业号：{}    专业名：{}".format(vi[0],vi[1]))
    my.close()

def insert1(sno,sname,sex,sdept):
    my = PYSQL('127.0.0.1:58097', 'sa', '031702237', 'EX3')
    sql = "insert into Student(Sno,Sname,Ssex,Sdept) values('{}','{}','{}','{}');".format(sno,sname,sex,sdept)
    my.insert_date(sql)
    my.close()

def insert2(sno,cno,grade):
    my = PYSQL('127.0.0.1:58097', 'sa', '031702237', 'EX3')
    sql = "insert into SC(Sno,Cno,Grade) values('{}','{}','{}');".format(sno,cno,grade)
    my.insert_date(sql)
    my.close()

def delete1(sno):
    my = PYSQL('127.0.0.1:58097', 'sa', '031702237', 'EX3')
    sql = "delete from Student where Sno='{}';".format(sno)
    my.delete_data(sql)
    my.close()

def delete2(cno,sno):
    my = PYSQL('127.0.0.1:58097', 'sa', '031702237', 'EX3')
    sql = "delete from SC where Cno = '{}' and Sno = '{}';".format(cno,sno)
    my.delete_data(sql)
    my.close()

def update1(sdept,sno):
    my = PYSQL('127.0.0.1:58097', 'sa', '031702237', 'EX3')
    sql = "update Student set Sdept= '{}' where Sno = '{}'".format(sdept,sno)
    my.update_data(sql)
    my.close()

def update2(grade,cno,sno):
    my = PYSQL('127.0.0.1:58097', 'sa', '031702237', 'EX3')
    sql = "update SC set Grade= '{}' where Cno = '{}' and Sno = '{}'".format(grade,cno,sno)
    my.update_data(sql)
    my.close()

if __name__ == '__main__':
    while True:
        print("*" * 50)
        print("-------------------学生总信息系统-------------------")
        print("1.查询学生基本信息")
        print("2.查询学生成绩信息")
        print("3.录入学生基本信息")
        print("4.录入学生成绩信息")
        print("5.删除学生基本信息")
        print("6.删除学生成绩信息")
        print("7.更新学生专业信息")
        print("8.更新学生成绩信息")
        print("0.退出系统")
        print("*" * 50)
        user = input("请输入要执行的操作：")
        if user == "1":
            select1()
        elif user == "2":
            select2()
        elif user == "3":
            select4()
            sno = input("学号：")
            sname = input("姓名：")
            sex = input("性别：")
            sdept = input("专业：")
            insert1(sno, sname, sex, sdept)
        elif user == "4":
            select3()
            sno = input("学号：")
            cno = input("课程号：")
            grade = input("成绩：")
            insert2(sno, cno, grade)
        elif user == "5":
            sno = input("学号：")
            delete1(sno)
        elif user == "6":
            select3()
            sno = input("学号：")
            cno = input("课程号：")
            delete2(cno,sno)
        elif user == "7":
            select4()
            sno = input("学号：")
            sdept = input("新专业：")
            update1(sdept,sno)
        elif user == "8":
            select3()
            sno = input("学号：")
            cno = input("课程号：")
            grade = input("新成绩：")
            update2(grade,cno,sno)
        elif user == "0":
            break
        else:
            print("输入有误")