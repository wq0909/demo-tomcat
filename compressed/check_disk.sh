SCRIPT_DIR=$(cd $(dirname $0) && pwd)
LOG_FILE_NAME="volumeCheck_"`date "+%Y-%m-%d_%H.%M.%S"`.log
Pattern="disk"

log_std(){
	echo "`date +'%Y-%m-%d %H:%M:%S'`:  $1"
}

log_file(){
	# 1. logFile
	# 2. msg
	echo "`date +'%Y-%m-%d %H:%M:%S'`:  $2" >>  $1
}

search_disks(){
	while [[ 1 -eq 1 ]]
	do
		sleep 2
		echo "`date +'%Y-%m-%d %H:%M:%S'`:  Checking..."
		count=`df |grep ${Pattern}|wc -l`
		echo "`date +'%Y-%m-%d %H:%M:%S'`: 发现 ${count}个云盘。"
		if [ $count -gt 0 ]; then
			path=`df |grep ${Pattern}|awk '{print $6}'`
			for i in ${path[*]};
			do
				# echo "path: "$i
				msg="Here is $i"
				log_std "$msg"
				log_file $SCRIPT_DIR$i"/"$LOG_FILE_NAME "$msg"
			done
		fi
	done
}


echo "=====触发时间："`date +'%Y-%m-%d %H:%M:%S'`
search_disks
