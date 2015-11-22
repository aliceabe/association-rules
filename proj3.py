from collections import defaultdict
import os,sys,subprocess
import re
import json

def readDataset(dataset):
	transactions = []
	totalitems = set()
	with open(dataset, 'r') as f:
		for line in f:
			items = line.strip().split(',')
			transactions.append(items)
			for item in items:
				totalitems.add(item)
	for t in transactions:
		t.sort()
	totalitems = sorted(list(totalitems))
	return transactions, totalitems

def support(itemset, transactions):
	return sum([1 for t in transactions if reduce(lambda x,y: x and y, [True if i in t else False for i in itemset])])

def find1itemsets(items, transactions, minsup):
	L1 = []
	for item in items:
		itemset = [item]
		count = support(itemset, transactions)
		if count/float(len(transactions)) >= minsup:
			L1.append({'itemset': itemset, 'count': count})
	return L1

def subset(c,t):
	return reduce(lambda x,y: x and y, [True if i in t else False for i in c['itemset']])

def apriori(items, transactions, minsup):
	L = []
	Lk = find1itemsets(items, transactions, minsup)
	L.append(Lk)
	while len(Lk) > 0:
		Ck = aprioriGen(Lk)
		for t in transactions:
			Ct = [i for i in range(len(Ck)) if subset(Ck[i],t)]
			for i in Ct:
				Ck[i]['count'] += 1
		Lk = [c for c in Ck if c['count']/float(len(transactions)) >= minsup]
		L.append(Lk)
	return sorted([e for i in L for e in i], key=lambda x: (-x['count'], ''.join(x['itemset'])))

def aprioriGen(Lk):
	# Join
	Ck = []
	for s1 in Lk:
		for s2 in Lk:
			if checkJoinCondition(s1['itemset'], s2['itemset']):
				Ck.append({'itemset': s1['itemset'] + s2['itemset'][-1:], 'count': 0})
	# Prune
	toremove = []
	for c in Ck:
		for s_index in range(len(c['itemset'])):
			s = c['itemset'][0:s_index] + c['itemset'][s_index+1:]
			if s not in map(lambda x: x['itemset'], Lk):
				toremove.append(c)
	# Remove
	for c in toremove:
		try:
			Ck.remove(c)
		except ValueError:
			pass
	return Ck

def checkJoinCondition(I1, I2):
	if len(I1) > 1:
		return reduce(lambda x,y: x and y, [True if I1[i] == I2[i] else False for i in range(len(I1)-1)]) and I1[-1] < I2[-1]
	else:
		return I1[-1] < I2[-1]

def printFirstPart(L, minsup, transactions):
	with open('output.txt', 'w') as f:
		print '==Frequent itemsets (min_sup=' + str(int(minsup*100)) + '%)'
		for item in L:
			print '[' + ','.join(item['itemset']) + '], ' + str(int(item['count']*100 / float(len(transactions)))) + '%'

def main():
	# Handle options
	dataset = sys.argv[1]
	minsup = float(sys.argv[2])
	minconf = float(sys.argv[3])

	# Read dataset and extract transactions and total set of items
	transactions, totalitems = readDataset(dataset)

	# Apply Apriori algorithm to find all large itemsets
	L = apriori(totalitems, transactions, minsup)

	# Print first part of output
	printFirstPart(L, minsup, transactions)
	


if __name__ == "__main__":
	main()