# Set your domain here
YOUR_DOMAIN=""
REGION="us-east-1"
# Don't change these
BUCKET_NAME="${YOUR_DOMAIN}-cdn"
LOG_BUCKET_NAME="${BUCKET_NAME}-logs"

# One fresh bucket please!
aws s3 mb s3://$BUCKET_NAME --region $REGION
# And another for the logs
aws s3 mb s3://$LOG_BUCKET_NAME --region $REGION

# Let AWS write the logs to this location
aws s3api put-bucket-acl --bucket $LOG_BUCKET_NAME \
--grant-write 'URI="http://acs.amazonaws.com/groups/s3/LogDelivery"' \
--grant-read-acp 'URI="http://acs.amazonaws.com/groups/s3/LogDelivery"'

# Setup logging
LOG_POLICY="{\"LoggingEnabled\":{\"TargetBucket\":\"$LOG_BUCKET_NAME\",\"TargetPrefix\":\"$BUCKET_NAME\"}}"
aws s3api put-bucket-logging --bucket $BUCKET_NAME --bucket-logging-status $LOG_POLICY
