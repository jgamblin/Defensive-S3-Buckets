# Defensive S3 Bucket Squatting

## What It Does:
This script creates and secures the most common S3 bucket names to stop them from being used by anyone in an attempt to make finding unsecured buckets harder.

## Usage:
- `chmod +x defensives3.sh`
- `./defensives3.sh companyname`

This will create about 80 buckets using the names in `buckets.txt`.

## Advance Usage:
- Submit a ticket to have your [S3 Bucket Limit](https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_s3) increased to 750
- Uncomment `#for extension in $(cat 150buckets.txt); do`
- Comment out `#for extension in $(catbuckets.txt); do`
- `chmod +x defensives3.sh`
- `./defensives3.sh companyname`

This will create about 600 buckets using the names in `150buckets.txt`.

## Backout Plan:
- `chmod +x deldefensives3.sh`
- `./deldefensives3.sh companyname`

This will delete all buckets that where created by this script.

## Important Notice
- I likely don't know what I am doing and this could be done faster, better and simpler some other way.
- These scripts could also break your cloud and make you cry.
- There are minimal costs for having empty S3 buckets.
