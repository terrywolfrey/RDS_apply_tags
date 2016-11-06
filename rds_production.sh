#!/bin/bash

DB_INSTANCE_LINES=$(aws rds describe-db-instances \
    --query 'DBInstances[*].[DBInstanceArn]' \
    --output text)

if [ $? -ne 0 ]; then
    exit 1
fi

echo "$DB_INSTANCE_LINES" | while read EACH_LINE; do
    EACH_DB_ARN=$(echo -n "$EACH_LINE" | awk '{print $1}')
    #EACH_DB_NAME=$(echo -n "$EACH_LINE" | awk '{print $2}')


    TAG_SET="Key=Mode,Value=Production"



#    TAG_SET="Key=MyOtherTag,Value=Reddit $TAG_SET"

    echo "Adding tags to $EACH_DB_ARN."

    aws rds add-tags-to-resource \
        --resource-name "$EACH_DB_ARN" \
        --tags $TAG_SET

    if [ $? -ne 0 ]; then
        exit 1
    fi
done