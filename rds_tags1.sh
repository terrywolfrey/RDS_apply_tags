#!/usr/bin/env bash

DB_INSTANCE_LINES=$(aws rds describe-db-instances \
    --query 'DBInstances[*].[DBInstanceArn,Engine,DBInstanceIdentifier,DBSubnetGroup.DBSubnetGroupDescription]' \
    --output text)

if [ $? -ne 0 ]; then
    exit 1
fi

echo "$DB_INSTANCE_LINES" | while read EACH_LINE; do
    EACH_DB_ARN=$(echo -n "$EACH_LINE" | awk '{print $1}')
#    EACH_DB_ENGINE=$(echo -n "$EACH_LINE" | awk '{print $2}')
#    EACH_DB_IDENTIFIER=$(echo -n "$EACH_LINE" | awk '{print $3}')
    EACH_DB_GROUP=$(echo -n "$EACH_LINE" | awk '{print $4}')

    TAG_SET="Key=Cluster,Value=$EACH_DB_GROUP"

#    if [ $EACH_DB_ENGINE = "mysql" ]; then
#        TAG_SET="Key=MyEngineTag,Value=mysql-engine $TAG_SET"
#    elif [ $EACH_DB_ENGINE = "postgres" ]; then
#        TAG_SET="Key=MyEngineTag,Value=postgresql-engine $TAG_SET"
#    fi

#    TAG_SET="Key=MyOtherKey,Value=MyOtherValue $TAG_SET"

    echo "Adding tags to $EACH_DB_ARN."

    aws rds add-tags-to-resource \
        --resource-name "$EACH_DB_ARN" \
        --tags $TAG_SET

    if [ $? -ne 0 ]; then
        exit 1
    fi
done