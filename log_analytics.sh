#!/bin/bash

#set -x

#前一天
date=$(date -d '-1 day' +%y%m%d)
#echo $date>

#日志存放路径：
log_add=/home/leung/seo/log_analysis


#分析结果存放路径：
result_add=/home/leung/seo/log_analysis/logAnalysisResult


#echo $date >> $result_add/a.txt



# *********************** www站点 分析开始 ************************************
#下载日志
wget ftp://iislog:iislog20152015@124.172.243.59:8552/W3SVC1581726994/ex$date.log
cp ex$date.log $log_add/ex$date.log
rm ex$date.log
#/ex$date.log

#另存日志：
#这里如果没有必要保存日志原文件就直接删除日志文件
#cat $log_add/ex$date.log 
#cat $log_add/ex$date.log >> cat $log_add/ex$date.log


#百度爬虫分析开始：
#百度总抓取量
result=($(cat $log_add/ex$date.log |grep 'Baiduspider' |wc -l))
#百度IP数量
result1=($(cat $log_add/ex$date.log |grep 'Baiduspider' | awk '{print $10}' |sort|uniq|wc -l))
#百度不重复抓取页面量
result2=($(cat $log_add/ex$date.log |grep 'Baiduspider' | awk '{print $6}' |sort|uniq|wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep 'Baiduspider' | awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep 'Baiduspider' | awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep 'Baiduspider' | awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep 'Baiduspider' | awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep 'Baiduspider' | awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep 'Baiduspider' | awk '{print $12}' |grep '403' | wc -l))
#404
result9=($(cat $log_add/ex$date.log |grep 'Baiduspider' | awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep 'Baiduspider' | awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep 'Baiduspider' | awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep 'Baiduspider' | awk '{print $12}' |grep '503' | wc -l))

#保存
#echo 日期,域名,总抓取量,爬虫IP数量,不重复抓取量,200,301,302,304,400,403,404,500,502,503 >> $result_add/baidu.csv
echo $date,www,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/baidu.csv





#360爬虫分析开始：
#360总抓取量
result=($(cat $log_add/ex$date.log |grep '360Spider' |wc -l))
#360IP数量
result1=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $10}' |sort|uniq|wc -l))
#360不重复抓取量
result2=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $6}' |sort|uniq|wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '403' | wc -l))
#404
result9=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '503' | wc -l))
#bk

#保存
#echo 日期,域名,360抓取量,IP数量,不重复抓取页面量,200,301,302,304,400,403,404,500,502,503 >> $result_add/360.csv
echo $date,www,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/360.csv


#提取各大引擎爬虫IP用于Nslookup处理：
#'spider'-IP
cat $log_add/ex$date.log |grep 'spider' | awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt
#'bot'-IP
cat $log_add/ex$date.log |grep 'bot' | awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt


#cat $log_add/ex$date.log >>www$date.log
rm $log_add/ex$date.log





# *********************** www站点 分析结束 ************************************




# *********************** News站点 分析开始 ************************************
#下载news日志:
wget ftp://iislog:iislog20152015@124.172.243.43:8552/W3SVC748082232/ex$date.log
cp ex$date.log $log_add/ex$date.log
rm ex$date.log

#news
#百度抓取量
result=($(cat $log_add/ex$date.log |grep 'Baiduspider'|wc -l))
#百度ip数量
result1=($(cat $log_add/ex$date.log |grep 'Baiduspider'|awk '{print $10}' |sort |uniq |wc -l))
#百度不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep 'Baiduspider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '503' | wc -l))


#保存
echo $date,news,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/baidu.csv
#news
#360抓取量
result=($(cat $log_add/ex$date.log |grep '360Spider'|wc -l))
#360ip数量
result1=($(cat $log_add/ex$date.log |grep '360Spider'|awk '{print $10}' |sort |uniq |wc -l))
#360不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep '360Spider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '503' | wc -l))

#保存
echo $date,news,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/360.csv




#提取各大引擎爬虫IP用于Nslookup处理：
#'spider'-IP
cat $log_add/ex$date.log |grep 'spider'|awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt
#'bot'-IP
cat $log_add/ex$date.log |grep 'bot' | awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt




#删除
#cat $log_add/ex$date.log >>news$date.log
rm $log_add/ex$date.log 





#********************** News站点 分析结束 ************************************






# *********************** m站站点 分析开始 ************************************

#下载news日志:
wget ftp://iislog:iislog20152015@124.172.243.111:8552/W3SVC9/u_ex$date.log

cp u_ex$date.log $log_add/u_ex$date.log
rm u_ex$date.log


#news
#百度抓取量
result=($(cat $log_add/u_ex$date.log |grep 'Baiduspider'|wc -l))
#百度ip数量
result1=($(cat $log_add/u_ex$date.log |grep 'Baiduspider'|awk '{print $9}' |sort |uniq |wc -l))
#百度不重复抓取量
result2=($(cat $log_add/u_ex$date.log  |grep 'Baiduspider'|awk '{print $5}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/u_ex$date.log |grep 'Baiduspider'| awk '{print $11}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/u_ex$date.log |grep 'Baiduspider'| awk '{print $11}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/u_ex$date.log |grep 'Baiduspider'| awk '{print $11}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/u_ex$date.log |grep 'Baiduspider'| awk '{print $11}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/u_ex$date.log |grep 'Baiduspider'| awk '{print $11}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/u_ex$date.log |grep 'Baiduspider'| awk '{print $11}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/u_ex$date.log |grep 'Baiduspider'| awk '{print $11}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/u_ex$date.log |grep 'Baiduspider'| awk '{print $11}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/u_ex$date.log |grep 'Baiduspider'| awk '{print $11}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/u_ex$date.log |grep 'Baiduspider'| awk '{print $11}' |grep '503' | wc -l))


#保存
echo $date,M,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/baidu.csv



#M站
#360抓取量
result=($(cat $log_add/u_ex$date.log |grep '360Spider'|wc -l))
#360ip数量
result1=($(cat $log_add/u_ex$date.log |grep '360Spider'|awk '{print $9}' |sort |uniq |wc -l))
#360不重复抓取量
result2=($(cat $log_add/u_ex$date.log  |grep '360Spider'|awk '{print $5}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/u_ex$date.log |grep '360Spider'| awk '{print $11}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/u_ex$date.log |grep '360Spider'| awk '{print $11}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/u_ex$date.log |grep '360Spider'| awk '{print $11}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/u_ex$date.log |grep '360Spider'| awk '{print $11}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/u_ex$date.log |grep '360Spider'| awk '{print $11}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/u_ex$date.log |grep '360Spider'| awk '{print $11}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/u_ex$date.log |grep '360Spider'| awk '{print $11}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/u_ex$date.log |grep '360Spider'| awk '{print $11}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/u_ex$date.log |grep '360Spider'| awk '{print $11}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/u_ex$date.log |grep '360Spider'| awk '{print $11}' |grep '503' | wc -l))

#保存
echo $date,M,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/360.csv




#提取各大引擎爬虫IP用于Nslookup处理：
#'spider'-IP
cat $log_add/u_ex$date.log |grep 'spider'|awk '{print $9}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt
#'bot'-IP
cat $log_add/u_ex$date.log |grep 'bot' | awk '{print $9}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt





#删除
rm $log_add/u_ex$date.log 

#**********************   m站站点 分析结束 ************************************










# *********************** Tag站点 分析开始 ************************************
#下载Tag日志:
wget ftp://iislog:iislog20152015@124.172.243.75:8552/W3SVC1852469516/ex$date.log
cp ex$date.log $log_add/ex$date.log
rm ex$date.log


#Tag分析：
#百度抓取量
result=($(cat $log_add/ex$date.log |grep 'Baiduspider'|wc -l))
#百度ip数量
result1=($(cat $log_add/ex$date.log |grep 'Baiduspider'|awk '{print $11}' |sort |uniq |wc -l))
#百度不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep 'Baiduspider'|awk '{print $7}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $17}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $17}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $17}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $17}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $17}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $17}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $17}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $17}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $17}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $17}' |grep '503' | wc -l))


#保存
echo $date,tag,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/baidu.csv
#news
#360抓取量
result=($(cat $log_add/ex$date.log |grep '360Spider'|wc -l))
#360ip数量
result1=($(cat $log_add/ex$date.log |grep '360Spider'|awk '{print $11}' |sort |uniq |wc -l))
#360不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep '360Spider'|awk '{print $7}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $17}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $17}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $17}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $17}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $17}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $17}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $17}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $17}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $17}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $17}' |grep '503' | wc -l))

#保存
echo $date,tag,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/360.csv




#提取各大引擎爬虫IP用于Nslookup处理：
#'spider'-IP
cat $log_add/ex$date.log |grep 'spider'|awk '{print $11}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt
#'bot'-IP
cat $log_add/ex$date.log |grep 'bot' | awk '{print $11}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt




#删除

rm $log_add/ex$date.log 
#mv $log_add/ex$date.log tag$date.log

#**********************   Tag站点 分析结束 ************************************





# *********************** biz站点 分析开始 ************************************
#下载biz日志:
#echo "开始biz日志的下载：\n"
wget ftp://iislog:iislog20152015@124.172.243.59:8552/W3SVC680730/ex$date.log
cp ex$date.log $log_add/ex$date.log
rm ex$date.log


#biz分析：
#百度抓取量
result=($(cat $log_add/ex$date.log |grep 'Baiduspider'|wc -l))
#百度ip数量
result1=($(cat $log_add/ex$date.log |grep 'Baiduspider'|awk '{print $10}' |sort |uniq |wc -l))
#百度不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep 'Baiduspider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '503' | wc -l))


#保存
echo $date,biz,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/baidu.csv



#biz
#360抓取量
result=($(cat $log_add/ex$date.log |grep '360Spider'|wc -l))
#360ip数量
result1=($(cat $log_add/ex$date.log |grep '360Spider'|awk '{print $10}' |sort |uniq |wc -l))
#360不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep '360Spider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '503' | wc -l))

#保存
echo $date,biz,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/360.csv




#提取各大引擎爬虫IP用于Nslookup处理：
#'spider'-IP
cat $log_add/ex$date.log |grep 'spider'|awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt
#'bot'-IP
cat $log_add/ex$date.log |grep 'bot' | awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt




#删除
rm $log_add/ex$date.log 
#mv $log_add/ex$date.log biz$date.log








# *********************** down站点 分析开始 ************************************
#下载down日志:
wget ftp://iislog:iislog20152015@124.172.243.59:8552/W3SVC736859177/ex$date.log
cp ex$date.log $log_add/ex$date.log
rm ex$date.log


#down分析：
#百度抓取量
result=($(cat $log_add/ex$date.log |grep 'Baiduspider'|wc -l))
#百度ip数量
result1=($(cat $log_add/ex$date.log |grep 'Baiduspider'|awk '{print $10}' |sort |uniq |wc -l))
#百度不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep 'Baiduspider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '503' | wc -l))


#保存
echo $date,down,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/baidu.csv
#down
#360抓取量
result=($(cat $log_add/ex$date.log |grep '360Spider'|wc -l))
#360ip数量
result1=($(cat $log_add/ex$date.log |grep '360Spider'|awk '{print $10}' |sort |uniq |wc -l))
#360不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep '360Spider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '503' | wc -l))

#保存
echo $date,down,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/360.csv




#提取各大引擎爬虫IP用于Nslookup处理：
#'spider'-IP
cat $log_add/ex$date.log |grep 'spider'|awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt
#'bot'-IP
cat $log_add/ex$date.log |grep 'bot' | awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt




#删除
rm $log_add/ex$date.log 
#mv $log_add/ex$date.log down$date.log


#**********************   down站点 分析结束 ************************************




# *********************** hb站点 分析开始 ************************************
#下载hb日志:
wget ftp://iislog:iislog20152015@124.172.243.41:8552/W3SVC1754875677/ex$date.log
cp ex$date.log $log_add/ex$date.log
rm ex$date.log

#hb分析：
#百度抓取量
result=($(cat $log_add/ex$date.log |grep 'Baiduspider'|wc -l))
#百度ip数量
result1=($(cat $log_add/ex$date.log |grep 'Baiduspider'|awk '{print $10}' |sort |uniq |wc -l))
#百度不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep 'Baiduspider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '503' | wc -l))


#保存
echo $date,hb,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/baidu.csv
#hb
#360抓取量
result=($(cat $log_add/ex$date.log |grep '360Spider'|wc -l))
#360ip数量
result1=($(cat $log_add/ex$date.log |grep '360Spider'|awk '{print $10}' |sort |uniq |wc -l))
#360不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep '360Spider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '503' | wc -l))

#保存
echo $date,hb,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/360.csv




#提取各大引擎爬虫IP用于Nslookup处理：
#'spider'-IP
cat $log_add/ex$date.log |grep 'spider'|awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt
#'bot'-IP
cat $log_add/ex$date.log |grep 'bot' | awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt



#删除

rm $log_add/ex$date.log 
#mv $log_add/ex$date.log hb$date.log



#**********************   hb站点 分析结束 ************************************





# *********************** sz站点 分析开始 ************************************
#下载sz日志:
wget ftp://iislog:iislog20152015@124.172.243.41:8552/W3SVC8474/ex$date.log
cp ex$date.log $log_add/ex$date.log
rm ex$date.log


#sz分析：
#百度抓取量
result=($(cat $log_add/ex$date.log |grep 'Baiduspider'|wc -l))
#百度ip数量
result1=($(cat $log_add/ex$date.log |grep 'Baiduspider'|awk '{print $10}' |sort |uniq |wc -l))
#百度不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep 'Baiduspider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '503' | wc -l))


#保存
echo $date,sz,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/baidu.csv
#sz
#360抓取量
result=($(cat $log_add/ex$date.log |grep '360Spider'|wc -l))
#360ip数量
result1=($(cat $log_add/ex$date.log |grep '360Spider'|awk '{print $10}' |sort |uniq |wc -l))
#360不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep '360Spider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '503' | wc -l))

#保存
echo $date,sz,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/360.csv




#提取各大引擎爬虫IP用于Nslookup处理：
#'spider'-IP
cat $log_add/ex$date.log |grep 'spider'|awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt
#'bot'-IP
cat $log_add/ex$date.log |grep 'bot' | awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt




#删除
rm $log_add/ex$date.log 
#mv $log_add/ex$date.log sz$date.log


#**********************   sz站点 分析结束 ************************************

















# *********************** js站点 分析开始 ************************************
#下载js日志:
wget ftp://iislog:iislog20152015@124.172.243.41:8552/W3SVC1912323380/ex$date.log
cp ex$date.log $log_add/ex$date.log
rm ex$date.log

#js分析：
#百度抓取量
result=($(cat $log_add/ex$date.log |grep 'Baiduspider'|wc -l))
#百度ip数量
result1=($(cat $log_add/ex$date.log |grep 'Baiduspider'|awk '{print $10}' |sort |uniq |wc -l))
#百度不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep 'Baiduspider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '503' | wc -l))


#保存
echo $date,js,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/baidu.csv
#js
#360抓取量
result=($(cat $log_add/ex$date.log |grep '360Spider'|wc -l))
#360ip数量
result1=($(cat $log_add/ex$date.log |grep '360Spider'|awk '{print $10}' |sort |uniq |wc -l))
#360不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep '360Spider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '503' | wc -l))

#保存
echo $date,js,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/360.csv





#提取各大引擎爬虫IP用于Nslookup处理：
#'spider'-IP
cat $log_add/ex$date.log |grep 'spider'|awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt
#'bot'-IP
cat $log_add/ex$date.log |grep 'bot' | awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt



#删除

rm $log_add/ex$date.log 
#mv $log_add/ex$date.log js$date.log


#**********************   js站点 分析结束 ************************************






# *********************** sh站点 分析开始 ************************************
#下载sh日志:
wget ftp://iislog:iislog20152015@124.172.243.41:8552/W3SVC1900938143/ex$date.log
cp ex$date.log $log_add/ex$date.log
rm ex$date.log


#sh分析：
#百度抓取量
result=($(cat $log_add/ex$date.log |grep 'Baiduspider'|wc -l))
#百度ip数量
result1=($(cat $log_add/ex$date.log |grep 'Baiduspider'|awk '{print $10}' |sort |uniq |wc -l))
#百度不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep 'Baiduspider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '503' | wc -l))


#保存
echo $date,sh,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/baidu.csv
#sh
#360抓取量
result=($(cat $log_add/ex$date.log |grep '360Spider'|wc -l))
#360ip数量
result1=($(cat $log_add/ex$date.log |grep '360Spider'|awk '{print $10}' |sort |uniq |wc -l))
#360不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep '360Spider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '503' | wc -l))

#保存
echo $date,sh,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/360.csv





#提取各大引擎爬虫IP用于Nslookup处理：
#'spider'-IP
cat $log_add/ex$date.log |grep 'spider'|awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt
#'bot'-IP
cat $log_add/ex$date.log |grep 'bot' | awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt




#删除

rm $log_add/ex$date.log 
#mv $log_add/ex$date.log js$date.log


#**********************   sh站点 分析结束 ************************************






# *********************** yn站点 分析开始 ************************************
#下载yn日志:
wget ftp://iislog:iislog20152015@124.172.243.41:8552/W3SVC1634906963/ex$date.log
cp ex$date.log $log_add/ex$date.log
rm ex$date.log


#yn分析：
#百度抓取量
result=($(cat $log_add/ex$date.log |grep 'Baiduspider'|wc -l))
#百度ip数量
result1=($(cat $log_add/ex$date.log |grep 'Baiduspider'|awk '{print $10}' |sort |uniq |wc -l))
#百度不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep 'Baiduspider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '503' | wc -l))


#保存
echo $date,yn,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/baidu.csv
#yn
#360抓取量
result=($(cat $log_add/ex$date.log |grep '360Spider'|wc -l))
#360ip数量
result1=($(cat $log_add/ex$date.log |grep '360Spider'|awk '{print $10}' |sort |uniq |wc -l))
#360不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep '360Spider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '503' | wc -l))

#保存
echo $date,yn,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/360.csv



#提取各大引擎爬虫IP用于Nslookup处理：
#'spider'-IP
cat $log_add/ex$date.log |grep 'spider'|awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt
#'bot'-IP
cat $log_add/ex$date.log |grep 'bot' | awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt



#删除
rm $log_add/ex$date.log 
#mv $log_add/ex$date.log js$date.log


#**********************   yn站点 分析结束 ************************************






# *********************** sc站点 分析开始 ************************************
#下载sc日志:
wget ftp://iislog:iislog20152015@124.172.243.41:8552/W3SVC387240790/ex$date.log
cp ex$date.log $log_add/ex$date.log
rm ex$date.log


#sc分析：
#百度抓取量
result=($(cat $log_add/ex$date.log |grep 'Baiduspider'|wc -l))
#百度ip数量
result1=($(cat $log_add/ex$date.log |grep 'Baiduspider'|awk '{print $10}' |sort |uniq |wc -l))
#百度不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep 'Baiduspider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '503' | wc -l))


#保存
echo $date,sc,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/baidu.csv
#sc
#360抓取量
result=($(cat $log_add/ex$date.log |grep '360Spider'|wc -l))
#360ip数量
result1=($(cat $log_add/ex$date.log |grep '360Spider'|awk '{print $10}' |sort |uniq |wc -l))
#360不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep '360Spider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '503' | wc -l))

#保存
echo $date,sc,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/360.csv



#提取各大引擎爬虫IP用于Nslookup处理：
#'spider'-IP
cat $log_add/ex$date.log |grep 'spider'|awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt
#'bot'-IP
cat $log_add/ex$date.log |grep 'bot' | awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt




#删除

rm $log_add/ex$date.log 
#mv $log_add/ex$date.log js$date.log



#**********************   sc站点 分析结束 ************************************






# *********************** cq站点 分析开始 ************************************
#下载cq日志:
wget ftp://iislog:iislog20152015@124.172.243.41:8552/W3SVC1588906796/ex$date.log
cp ex$date.log $log_add/ex$date.log
rm ex$date.log


#cq分析：
#百度抓取量
result=($(cat $log_add/ex$date.log |grep 'Baiduspider'|wc -l))
#百度ip数量
result1=($(cat $log_add/ex$date.log |grep 'Baiduspider'|awk '{print $10}' |sort |uniq |wc -l))
#百度不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep 'Baiduspider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '503' | wc -l))


#保存
echo $date,cq,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/baidu.csv
#cq
#360抓取量
result=($(cat $log_add/ex$date.log |grep '360Spider'|wc -l))
#360ip数量
result1=($(cat $log_add/ex$date.log |grep '360Spider'|awk '{print $10}' |sort |uniq |wc -l))
#360不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep '360Spider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '503' | wc -l))

#保存
echo $date,cq,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/360.csv


#提取各大引擎爬虫IP用于Nslookup处理：
#'spider'-IP
cat $log_add/ex$date.log |grep 'spider'|awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt
#'bot'-IP
cat $log_add/ex$date.log |grep 'bot' | awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt




#删除

rm $log_add/ex$date.log 
#mv $log_add/ex$date.log js$date.log




#**********************   cq站点 分析结束 ************************************






# *********************** fj站点 分析开始 ************************************
#下载fj日志:
wget ftp://iislog:iislog20152015@124.172.243.41:8552/W3SVC575980147/ex$date.log
cp ex$date.log $log_add/ex$date.log
rm ex$date.log


#fj分析：
#百度抓取量
result=($(cat $log_add/ex$date.log |grep 'Baiduspider'|wc -l))
#百度ip数量
result1=($(cat $log_add/ex$date.log |grep 'Baiduspider'|awk '{print $10}' |sort |uniq |wc -l))
#百度不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep 'Baiduspider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '503' | wc -l))


#保存
echo $date,fj,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/baidu.csv
#fj
#360抓取量
result=($(cat $log_add/ex$date.log |grep '360Spider'|wc -l))
#360ip数量
result1=($(cat $log_add/ex$date.log |grep '360Spider'|awk '{print $10}' |sort |uniq |wc -l))
#360不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep '360Spider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '503' | wc -l))

#保存
echo $date,fj,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/360.csv


#提取各大引擎爬虫IP用于Nslookup处理：
#'spider'-IP
cat $log_add/ex$date.log |grep 'spider'|awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt
#'bot'-IP
cat $log_add/ex$date.log |grep 'bot' | awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt





#删除
rm $log_add/ex$date.log 
#mv $log_add/ex$date.log js$date.log



#**********************   fj站点 分析结束 ************************************






# *********************** zj站点 分析开始 ************************************

#下载zj日志:
wget ftp://iislog:iislog20152015@124.172.243.41:8552/W3SVC76871080/ex$date.log
cp ex$date.log $log_add/ex$date.log
rm ex$date.log


#zj分析：
#百度抓取量
result=($(cat $log_add/ex$date.log |grep 'Baiduspider'|wc -l))
#百度ip数量
result1=($(cat $log_add/ex$date.log |grep 'Baiduspider'|awk '{print $10}' |sort |uniq |wc -l))
#百度不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep 'Baiduspider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '503' | wc -l))


#保存
echo $date,zj,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/baidu.csv
#zj
#360抓取量
result=($(cat $log_add/ex$date.log |grep '360Spider'|wc -l))
#360ip数量
result1=($(cat $log_add/ex$date.log |grep '360Spider'|awk '{print $10}' |sort |uniq |wc -l))
#360不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep '360Spider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '503' | wc -l))

#保存
echo $date,zj,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/360.csv


#提取各大引擎爬虫IP用于Nslookup处理：
#'spider'-IP
cat $log_add/ex$date.log |grep 'spider'|awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt
#'bot'-IP
cat $log_add/ex$date.log |grep 'bot' | awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt



#删除
rm $log_add/ex$date.log 
#mv $log_add/ex$date.log js$date.log



#**********************   zj站点 分析结束 ************************************






# *********************** bj站点 分析开始 ************************************

#下载bj日志:
wget ftp://iislog:iislog20152015@124.172.243.41:8552/W3SVC246305231/ex$date.log
cp ex$date.log $log_add/ex$date.log
rm ex$date.log


#bj分析：
#百度抓取量
result=($(cat $log_add/ex$date.log |grep 'Baiduspider'|wc -l))
#百度ip数量
result1=($(cat $log_add/ex$date.log |grep 'Baiduspider'|awk '{print $10}' |sort |uniq |wc -l))
#百度不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep 'Baiduspider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '503' | wc -l))


#保存
echo $date,bj,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/baidu.csv
#bj
#360抓取量
result=($(cat $log_add/ex$date.log |grep '360Spider'|wc -l))
#360ip数量
result1=($(cat $log_add/ex$date.log |grep '360Spider'|awk '{print $10}' |sort |uniq |wc -l))
#360不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep '360Spider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '503' | wc -l))

#保存
echo $date,bj,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/360.csv


#提取各大引擎爬虫IP用于Nslookup处理：
#'spider'-IP
cat $log_add/ex$date.log |grep 'spider'|awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt
#'bot'-IP
cat $log_add/ex$date.log |grep 'bot' | awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt





#删除
rm $log_add/ex$date.log 
#mv $log_add/ex$date.log js$date.log



#**********************   bj站点 分析结束 ************************************






# *********************** xa站点 分析开始 ************************************

#下载xa日志:
wget ftp://iislog:iislog20152015@124.172.243.41:8552/W3SVC1052848952/ex$date.log
cp ex$date.log $log_add/ex$date.log
rm ex$date.log


#xa分析：
#百度抓取量
result=($(cat $log_add/ex$date.log |grep 'Baiduspider'|wc -l))
#百度ip数量
result1=($(cat $log_add/ex$date.log |grep 'Baiduspider'|awk '{print $10}' |sort |uniq |wc -l))
#百度不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep 'Baiduspider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '503' | wc -l))


#保存
echo $date,xa,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/baidu.csv
#xa
#360抓取量
result=($(cat $log_add/ex$date.log |grep '360Spider'|wc -l))
#360ip数量
result1=($(cat $log_add/ex$date.log |grep '360Spider'|awk '{print $10}' |sort |uniq |wc -l))
#360不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep '360Spider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '503' | wc -l))

#保存
echo $date,xa,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/360.csv



#提取各大引擎爬虫IP用于Nslookup处理：
#'spider'-IP
cat $log_add/ex$date.log |grep 'spider'|awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt
#'bot'-IP
cat $log_add/ex$date.log |grep 'bot' | awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt



#删除
rm $log_add/ex$date.log 
#mv $log_add/ex$date.log js$date.log



#**********************   xa站点 分析结束 ************************************




# *********************** hebei站点 分析开始 ************************************
#下载hebei日志:
wget ftp://iislog:iislog20152015@124.172.243.41:8552/W3SVC8474/ex$date.log
cp ex$date.log $log_add/ex$date.log
rm ex$date.log


#hebei分析：
#百度抓取量
result=($(cat $log_add/ex$date.log |grep 'Baiduspider'|wc -l))
#百度ip数量
result1=($(cat $log_add/ex$date.log |grep 'Baiduspider'|awk '{print $10}' |sort |uniq |wc -l))
#百度不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep 'Baiduspider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '503' | wc -l))


#保存
echo $date,hebei,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/baidu.csv
#hebei
#360抓取量
result=($(cat $log_add/ex$date.log |grep '360Spider'|wc -l))
#360ip数量
result1=($(cat $log_add/ex$date.log |grep '360Spider'|awk '{print $10}' |sort |uniq |wc -l))
#360不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep '360Spider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '503' | wc -l))

#保存
echo $date,hebei,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/360.csv



#提取各大引擎爬虫IP用于Nslookup处理：
#'spider'-IP
cat $log_add/ex$date.log |grep 'spider'|awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt
#'bot'-IP
cat $log_add/ex$date.log |grep 'bot' | awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt




#删除
rm $log_add/ex$date.log 
#mv $log_add/ex$date.log js$date.log



#**********************   hebei站点 分析结束 ************************************





# *********************** gz站点 分析开始 ************************************
#下载gz日志:
wget ftp://iislog:iislog20152015@124.172.243.41:8552/W3SVC777766380/ex$date.log
cp ex$date.log $log_add/ex$date.log
rm ex$date.log


#gz分析：
#百度抓取量
result=($(cat $log_add/ex$date.log |grep 'Baiduspider'|wc -l))
#百度ip数量
result1=($(cat $log_add/ex$date.log |grep 'Baiduspider'|awk '{print $10}' |sort |uniq |wc -l))
#百度不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep 'Baiduspider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '503' | wc -l))


#保存
echo $date,gz,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/baidu.csv
#gz
#360抓取量
result=($(cat $log_add/ex$date.log |grep '360Spider'|wc -l))
#360ip数量
result1=($(cat $log_add/ex$date.log |grep '360Spider'|awk '{print $10}' |sort |uniq |wc -l))
#360不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep '360Spider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '503' | wc -l))

#保存
echo $date,gz,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/360.csv



#提取各大引擎爬虫IP用于Nslookup处理：
#'spider'-IP
cat $log_add/ex$date.log |grep 'spider'|awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt
#'bot'-IP
cat $log_add/ex$date.log |grep 'bot' | awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt



#提取各大引擎爬虫IP用于Nslookup处理：
#'spider'-IP
cat $log_add/ex$date.log |grep 'spider'|awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt
#'bot'-IP
cat $log_add/ex$date.log |grep 'bot' | awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt



#删除
rm $log_add/ex$date.log 
#mv $log_add/ex$date.log js$date.log



#**********************   gz站点 分析结束 ************************************






# *********************** tj站点 分析开始 ************************************
#下载tj日志:
wget ftp://iislog:iislog20152015@124.172.243.41:8552/W3SVC8474/ex$date.log
cp ex$date.log $log_add/ex$date.log
rm ex$date.log


#tj分析：
#百度抓取量
result=($(cat $log_add/ex$date.log |grep 'Baiduspider'|wc -l))
#百度ip数量
result1=($(cat $log_add/ex$date.log |grep 'Baiduspider'|awk '{print $10}' |sort |uniq |wc -l))
#百度不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep 'Baiduspider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep 'Baiduspider'| awk '{print $12}' |grep '503' | wc -l))


#保存
echo $date,tj,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/baidu.csv
#tj
#360抓取量
result=($(cat $log_add/ex$date.log |grep '360Spider'|wc -l))
#360ip数量
result1=($(cat $log_add/ex$date.log |grep '360Spider'|awk '{print $10}' |sort |uniq |wc -l))
#360不重复抓取量
result2=($(cat $log_add/ex$date.log  |grep '360Spider'|awk '{print $6}' |sort|uniq| wc -l))
#200
result3=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '200' | wc -l))
#301
result4=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '301' | wc -l))
#302
result5=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '302' | wc -l))
#304
result6=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '304' | wc -l))
#400
result7=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '400' | wc -l))
#403
result8=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '403' | wc -l))
#404  
result9=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '404' | wc -l))
#500
result10=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '500' | wc -l))
#502
result11=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '502' | wc -l))
#503
result12=($(cat $log_add/ex$date.log |grep '360Spider'| awk '{print $12}' |grep '503' | wc -l))

#保存
echo $date,tj,$result,$result1,$result2,$result3,$result4,$result5,$result6,$result7,$result8,$result9,$result10,$result11,$result12 >> $result_add/360.csv


#提取各大引擎爬虫IP用于Nslookup处理：
#'spider'-IP
cat $log_add/ex$date.log |grep 'spider'|awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt
#'bot'-IP
cat $log_add/ex$date.log |grep 'bot' | awk '{print $10}' |sort|uniq -c | sort -nr >> $result_add/resultIp.txt


#删除
rm $log_add/ex$date.log 
#mv $log_add/ex$date.log js$date.log



#**********************   tj站点 分析结束 ************************************
