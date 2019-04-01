import requests

headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.76 '}

res=requests.get("https://guidingmetrics.com/content/insurance-industrys-18-most-critical-metrics/",headers=headers)

print res
from  bs4 import BeautifulSoup as bs
soup=bs(res.text,"html.parser")

i = 0
for clsnames in ["features-div4","features-div5"]:

	for yy in soup.find_all("div", {"class": clsnames}):
		with open("metric_{num}_def.txt".format(num=i),"w") as df1,open("metric_{num}_importance.txt".format(num=i),"w") as df2:
			x=""
			if yy.find("h4")!=None:
				metric_name =yy.find("h4").text
				e = ""
				for char in metric_name:
					if char not in [str(num) for num in range(10)]+["."]:
						e+=char
				print e.strip()
				x=x+metric_name+"\n"
				subparas = [paras.text for paras in yy.find_all("p") if paras.text!='']
				for yyy in subparas:
					if "what" in yyy.lower():
						tmp = x + yyy
						df1.write(tmp.encode("utf"))
					elif "why" in yyy.lower():
						tmp = x + yyy
						df2.write(tmp.encode("utf"))
				i+=1
			# df.write(x.encode("utf-8"))
print i
