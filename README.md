# IP2JSON
Generate JSON data file from a list of IPs

1. Prepare a list of IP addresses in a file, one IP address per line.
2. Run the following command:
```
sh IP2JSON.sh IPs.txt > points.json
```
3. Check the file character set, for example:
```
file -bi points.json
```
If the character set of your file is not us-ascii or utf-8 you can convert it to UTF-8, for example:
```
iconv -f iso-8859-1 -t utf-8 points.json > utf-points.json
```
4. Now you are ready to go. You can upload your map points on http://2geojson.com/ or a similar service.
