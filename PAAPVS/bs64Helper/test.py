import hashlib

def md5_file(name):
    with open(name,'rb') as f:  #需要使用二进制格式读取文件内容
      m =hashlib.md5()
      m.update(f.read())
    return m.hexdigest()


'''加密大的文件'''

def MD5ForBigFile(file):
    with open(file, 'rb') as f:
        m = hashlib.md5()
        buffer = 8192

        while True:
            chunk = f.read(buffer)
            if not chunk:
                break
            m.update(chunk)

    return m.hexdigest()


print(MD5ForBigFile("D:\软件包\编程开发\cn_visual_studio_professional_2015_x86_x64_dvd_6846645.iso"))
