#!/bin/bash

# Adapted from the script to apply tags.

DB_INSTANCE_LINES=$(aws rds describe-db-instances \
    --query 'DBInstances[*].[DBInstanceArn]' \
    --output text)

if [ $? -ne 0 ]; then
    exit 1
fi

echo "$DB_INSTANCE_LINES" | while read EACH_LINE; do
    EACH_DB_ARN=$(echo -n "$EACH_LINE" | awk '{print $1}')
#    EACH_DB_ENGINE=$(echo -n "$EACH_LINE" | awk '{print $2}')
#    EACH_DB_IDENTIFIER=$(echo -n "$EACH_LINE" | awk '{print $3}')

# Tag Key only
    TAG_SET="MyEngineTag"

#    if [ $EACH_DB_ENGINE = "mysql" ]; then
#        TAG_SET="Key=MyEngineTag,Value=mysql-engine $TAG_SET"
#    elif [ $EACH_DB_ENGINE = "postgres" ]; then
#        TAG_SET="Key=MyEngineTag,Value=postgresql-engine $TAG_SET"
#    fi

#    TAG_SET="Key=MyOtherTag,Value=Reddit $TAG_SET"

    echo "Removing tags from $EACH_DB_ARN."

    aws rds remove-tags-from-resource \
        --resource-name "$EACH_DB_ARN" \
        --tag-keys $TAG_SET

    if [ $? -ne 0 ]; then
        exit 1
    fi
done




#  aws rds remove-tags-from-resource --resource-name arn:aws:rds:us-east-1:655772981054:db:argo-sngl --tag-keys "MyEngineTag"