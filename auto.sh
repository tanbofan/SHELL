#!/bin/bash
# 此脚本用于修改“微信朋友圈采集助手V3.6”工具自动采集朋友圈数据，生成两级目录后修改照片的文件名，批量添加年份和月份。

WORKDIR=/Volumes/C2000Pro/安然小白家客服微信朋友圈数据

for DIR in `ls -ld $WORKDIR/* | awk -F'/' '{print $NF}' | grep -v auto`;do
	cd $WORKDIR/$DIR
	for SUBDIR in `ls -ld $WORKDIR/$DIR/* | awk -F'/' '{print $NF}'`;do
		cd $WORKDIR/$DIR/$SUBDIR
		YEAR=`pwd | awk -F'/' '{print $(NF-1)}'`
		MONTH=`pwd | awk -F'/' '{print $NF}'`
		for FILENAME in *;do
			mv "$FILENAME" "$YEAR$MONTH$FILENAME"
			echo "$YEAR$MONTH$FILENAME Filename change complated!"
		done
	done
done
		
