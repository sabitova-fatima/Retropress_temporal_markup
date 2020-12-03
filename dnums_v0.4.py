import json
import math

dnumsjson = open('dnum.json', 'r').read()
dnums = json.loads(dnumsjson)

line = open('input.txt', 'r').read()

def processline(line):
  splitted = line.split(' ')
  num = 0
  i = 0
  finalstring = ""
  flag = 0
  skip = 0
  lastdigit = 0
  newdigit = 0
  for word in splitted:
    i += 1
    if (skip == 1):
      skip = 0
      continue
    if (i < len(splitted)):
      testsplitted = splitted[i - 1] + " " + splitted[i]
      if (testsplitted in dnums):
        num += int(dnums[testsplitted])
        skip = 1
        continue
    if word not in dnums:
      if (flag == 1):
        finalstring += str(num) + " "
        flag = 0
        lastdigit = 0
      num = 0
      finalstring += word + " "
    else:
      newdigit = int(math.log10(int(dnums[word])))+1
      if (lastdigit <= 2 and newdigit <= 2 and num < 100 and num > 0 and word[-1] != 'е' and word[-1] != 'о' and word[-1] != 'й'):
        finalstring += str(num) + ":" + dnums[word] + " "
        flag = 0
        lastdigit = 0
        num = 0
        continue
      lastdigit = newdigit
      num += int(dnums[word])
      flag = 1
  if (flag == 1):
    finalstring += str(num) + " "
  finalstring = finalstring.strip()
  return (finalstring)
open('input.txt', 'w').close()

res = processline(line)
