#!/bin/bash

companyname=$1
count=0

for extension in $(cat buckets.txt); do
#for extension in $(cat 150buckets.txt); do
printf "Deleting %s%s \\n" "$companyname" "$extension"
aws s3api delete-bucket --bucket $companyname$extension --region us-east-1
printf "\\n"
((count=count+1))

printf "Deleting %s_%s \\n" "$companyname" "$extension"
aws s3api delete-bucket --bucket $companyname'_'$extension --region us-east-1
printf "\\n"
((count=count+1))

printf "Deleting %s-%s \\n" "$companyname" "$extension"

aws s3api delete-bucket --bucket $companyname-$extension --region us-east-1
printf "\\n"
((count=count+1))

printf "Deleting %s.%s \\n" "$companyname" "$extension"
aws s3api delete-bucket --bucket $companyname.$extension --region us-east-1
printf "\\n"
((count=count+1))
done
echo -ne "Deleted $count Defensive S3 Buckets"\\n
