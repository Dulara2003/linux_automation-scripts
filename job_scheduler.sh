#!/bin/bash

queue="job_queue.txt"
completed="completed_jobs.txt"
log="scheduler_log.txt"

touch $queue $completed $log

while true
do
echo "------ Job Scheduler ------"
echo "1 Submit Job"
echo "2 View Job Queue"
echo "3 Process Jobs"
echo "4 Exit"

read choice

case $choice in

1)
read -p "Enter Job Name: " job
read -p "Enter Execution Time: " time
echo "$job $time" >> $queue
echo "$(date): Job $job submitted" >> $log
;;

2)
echo "Current Job Queue:"
cat $queue
;;

3)
while read job time
do
echo "Running $job..."
sleep 2
echo "$job completed" >> $completed
echo "$(date): Job $job completed" >> $log
done < $queue

> $queue
;;

4)
exit
;;

*)
echo "Invalid option"
;;

esac
done
