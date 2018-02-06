import os
path = 'D:\BaiduNetdiskDownload\lfw_Align'
count = 0
for fn in os.listdir(path):
	count = count + 1
print count
d = {}
for root ,dirs,files in os.walk(path):
	if len(dirs)>0 :
		continue
	count = 0
	for each in files:
		count += 1
	d[root] = count
e = sorted(d.items(),lambda x,y: cmp(x[1],y[1]),reverse = True)
for f in e:
	print f