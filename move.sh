#!/bin/bash
# 此脚本用于将两级目录中的文件整体剪贴到文件夹中

WORKDIR=/Volumes/C2000Pro/安然小白家客服微信朋友圈数据
DESTDIR=/Volumes/C2000Pro/安然小白家客服微信朋友圈数据/集合/

mkdir $DESTDIR

for DIR in `ls -ld $WORKDIR/* | awk -F'/' '{print $NF}' | grep -v auto`;do
	cd $WORKDIR/$DIR
	for SUBDIR in `ls -ld $WORKDIR/$DIR/* | awk -F'/' '{print $NF}'`;do
		cd $WORKDIR/$DIR/$SUBDIR
		for FILENAME in *;do
			mv "$FILENAME" $DESTDIR
			echo "$FILENAME Filename move completed!"
		done
	done
done
		
