import csv

transactions = []
with open('chs07_public.csv', 'rb') as f:
	for i, row in enumerate(csv.reader(f, delimiter=',', skipinitialspace=False)):
		if i == 0:
			head = row[1:]
			head.pop(63)
		else:
			line = row[1:]
			line.pop(63)
			array = [ h + '-' + l for h, l in zip(head,line) if l != 'NA' ]
			transactions.append( ','.join(array) )

with open('chs07_public_processes.csv', 'w') as f:
	for t in transactions:
		f.write(t + '\n')

