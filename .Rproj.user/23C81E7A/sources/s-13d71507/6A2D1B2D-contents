import json


dnumsjson = open('dnum.json', 'r').read()
dnums = json.loads(dnumsjson)

def find(string):
  splitted = string.split(' ')
  if splitted[0] not in dnums:
    return
  num = 0
  plus = 0
  for word in splitted:
    plus = int(dnums[word])
    num += plus
  return num

print(find("сто сорок пятый"))
