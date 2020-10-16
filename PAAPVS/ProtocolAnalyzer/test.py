import sqlite3

conn = sqlite3.connect('./protocols.sqlite3')
cursor = conn.cursor()

res = cursor.execute("select pro_name,filename,step4 from protocol WHERE mode != 'theorem'").fetchall()
for it in res:
    #
    str = 'spin -p -s -r -X -v -l -g -k {}.trail -u10000 {}'.format(it[1],it[1])
    print(str)
    cursor.execute('update protocol set step4 = ? where pro_name = ?',(str,it[0]))
conn.commit()