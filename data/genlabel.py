import random

file = open("caisa.txt")
d = {}
lines = file.readlines()
for line in lines:
	d[int(line[16:-1])] = line[:7]

#print d
fileo2 = open("caisa_label.txt","w")
#e = sorted(d.items(),lambda x,y: cmp(x[1],y[1]),reverse = False)
#print type(e[0])
#for line in e.keys():
#	#fileo2.write(line,d[line])
#	print line,e[line]
#	print line
for key in range(10572):
	print d[key]
	fileo2.write(d[key]+'\r\n')
exit()

#for line in a:
#	print line

print len(lines),len(a)

i=0
for line in a:
	print i , line
	lines.remove(line)
	i = i+1

print len(lines)

fileo1 = open("caisa_train.txt","w")
for line in lines:
	fileo1.write(line)

fileo2 = open("caisa_val.txt","w")
for line in a:
	fileo2.write(line)