
#!/bin/bash

LOGFILE="system_monitor_log.txt"

log_action(){
echo "$(date) : $1" >> $LOGFILE
}

while true
do
echo "------ System Monitor ------"
echo "1 Show CPU and Memory usage"
echo "2 Show top 10 memory processes"
echo "3 Kill a process"
echo "4 Check disk usage"
echo "5 Exit"
echo "----------------------------"

read choice

case $choice in

1)
echo "CPU and Memory usage"
top -bn1 | head
log_action "Checked CPU and memory"
;;

2)
echo "Top 10 memory processes"
ps aux --sort=-%mem | head -10
log_action "Viewed memory processes"
;;

3)
echo "Enter PID"
read pid

echo "Are you sure? Y/N"
read confirm

if [ "$confirm" = "Y" ]
then
kill $pid
echo "Process killed"
log_action "Killed process $pid"
else
echo "Cancelled"
fi
;;

4)
echo "Enter directory"
read dir
du -sh $dir
log_action "Checked disk usage $dir"
;;

5)
echo "Exit system? Y/N"
read confirm

if [ "$confirm" = "Y" ]
then
echo "Bye"
log_action "Exited system"
exit
fi
;;

*)
echo "Invalid option"
;;

esac

done

