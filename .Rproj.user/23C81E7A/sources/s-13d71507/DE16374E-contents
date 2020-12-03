import json
import math

keysjson = open('prot.json', 'r').read()
keys = json.loads(keysjson)


keywordsjson = open('flagtime.json', 'r').read()
keywords = json.loads(keywordsjson)

defaultyear = 2020
defaultmonth = 11
defaultday = 27
defaulthour = 2
defaultminute = 30

line = "" 

def inputinres(year, month, day, hour, minute):
  updatetime(year, month, day, hour, minute)
  defaultyear = 2020
  defaultmonth = 11
  defaultday = 27
  defaulthour = 2
  defaultminute = 30
  if (year != -1):
    defaultyear = year
  if (month != -1):
    defaultmonth = month
  if (day != -1):
    defaultday = day;
  if (hour != -1):
    defaulthour = hour
  if (minute != -1):
    defaultminute = minute
  resret = str(defaultyear) + "-" + str(defaultmonth) + "-" + str(defaultday) + "T" + str(defaulthour) + ":" + str(defaultminute)
  return resret

def scanline(line):
  split = line.split(' ')
  for word in split:
    if word in keys:
      return keys[word]
  return "nul"

def makepromej(line, typeq):
  year = -1
  month = -1
  day = -1
  hour = -1
  minute = -1
  split = line.split(' ')
  skip = 0
  i = 0
  for word in split:
    i += 1
    if (word in keys and i != 1):
      break
    elif (word in keys):
      i += 1
      continue
    if (skip == 1):
      i += 1
      continue
    if (i < len(split) - 1 and split[i + 1] in keywords):
      skip = 1
      if (keywords[split[i + 1]] == "y"):
        year = int(word)
      if (keywords[split[i + 1]] == 'm'):
        month = int(word)
      if (keywords[split[i + 1]] == 'd'):
        day = int(word)
      if (keywords[split[i + 1]] == 'h'):
        hour = int(word)
      if (keywords[split[i + 1]] == 'b'):
        minute = int(word)
    if word.isnumeric():
      if (int(word) > 1000):
        year = int(word)
      elif (month == -1 and int(word) < 12):
        month = int(word)
      elif (day == -1 and int(word) < 31):
        day = int(word)
      elif (hour == -1 and int(word) < 24):
        hour = int(word)
      else:
        minute = int(word)
  lineres = inputinres(year, month, day, hour, minute)
  if (typeq == 'p'):
    while i < len(split):
      if (i < len(split) - 1 and split[i + 1] in keywords):
        skip = 1
      if (split[i] in keys):
        print(split[i])
        i += 1
        continue
      if (i < len(split) - 1 and keywords[split[i + 1]] == "y"):
        year = int(split[i])
      if (i < len(split) - 1 and keywords[split[i + 1]] == 'm'):
        month = int(split[i])
      if (i < len(split) - 1 and keywords[split[i + 1]] == 'd'):
        day = int(split[i])
      if (i < len(split) - 1 and keywords[split[i + 1]] == 'h'):
        hour = int(split[i])
      if (i < len(split) - 1 and keywords[split[i + 1]] == 'b'):
        minute = int(split[i])
      if split[i].isnumeric():
        if (int(split[i]) > 1000):
          year = int(split[i])
        elif (month == -1 and int(split[i]) < 12):
          month = int(split[i])
        elif (day == -1 and int(split[i]) < 31):
          day = int(split[i])
        elif (hour == -1 and int(split[i]) < 24):
          hour = int(split[i])
        else:
          minute = int(split[i])
      i += 1
    lineres += " - "
    lineres += inputinres(year, month, day, hour, minute)
    return (lineres)
    
res = ""

line = "с 1921 года по 1922"

if (scanline(line) is "nul"):
  res = 0
else:
  res = makepromej(line, scanline(line))
    
print("res = " + str(res))
