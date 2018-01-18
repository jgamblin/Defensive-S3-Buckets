#!/bin/bash

companyname=$1
count=0

printf "Creating %s \\n" "$companyname"
aws s3api create-bucket --bucket "$companyname" --region us-east-1 --acl private
((count=count+1))

for extension in $(cat buckets.txt); do
#for extension in $(cat 150buckets.txt); do

printf "Creating %s%s \\n" "$companyname" "$extension"
aws s3api create-bucket --bucket $companyname$extension --region us-east-1 --acl private
((count=count+1))
printf "\\n"

printf "Creating %s_%s \\n" "$companyname" "$extension"
aws s3api create-bucket --bucket $companyname'_'$extension --region us-east-1 --acl private
printf "\\n"

printf "Creating %s-%s \\n" "$companyname" "$extension"
aws s3api create-bucket --bucket $companyname-$extension --region us-east-1 --acl private
((count=count+1))
printf "\\n"

printf "Creating %s.%s \\n" "$companyname" "$extension"
aws s3api create-bucket --bucket $companyname.$extension --region us-east-1 --acl private
((count=count+1))
printf "\\n"

done

echo -ne "Created $count Defensive S3 buckets"\\n
