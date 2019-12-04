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



if __name__ == '__main__':
    my = PYSQL('127.0.0.1', 'test', '123', 'pickme')
    user = '1234'
    pwd = 'hh'
    sql = "insert into users values('{}','{}')".format(user, pwd)
    result = my.insert_date(sql)
    if result:
        print('success')
    else:
        print('fail')
    qsql = "select * from users"
    result = my.select_data(qsql)
    print(result)
    my.close()
