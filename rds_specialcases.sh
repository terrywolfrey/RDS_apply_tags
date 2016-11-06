#!/bin/bash

    # Tag Key only
    TAG_SET="Mode"

    # REMOVE TAGS
    aws rds remove-tags-from-resource --resource-name "arn:aws:rds:us-east-1:655772981054:db:mysql-synergixx-c3s" --tag-keys $TAG_SET
    aws rds remove-tags-from-resource --resource-name "arn:aws:rds:us-east-1:655772981054:db:synergixx-net" --tag-keys $TAG_SET
    aws rds remove-tags-from-resource --resource-name "arn:aws:rds:us-east-1:655772981054:db:dev-sngl-cm" --tag-keys $TAG_SET
    
    aws rds remove-tags-from-resource --resource-name "arn:aws:rds:us-east-1:655772981054:db:freeswitchdb" --tag-keys $TAG_SET
    aws rds remove-tags-from-resource --resource-name "arn:aws:rds:us-east-1:655772981054:db:nexrep-sngl-cm" --tag-keys $TAG_SET    
    aws rds remove-tags-from-resource --resource-name "arn:aws:rds:us-east-1:655772981054:db:mysql-nexrep-c3s-ro" --tag-keys $TAG_SET 
    
    aws rds remove-tags-from-resource --resource-name "arn:aws:rds:us-east-1:655772981054:db:cip-sngl-cm" --tag-keys $TAG_SET    
    aws rds remove-tags-from-resource --resource-name "arn:aws:rds:us-east-1:655772981054:db:cip3-sngl-cm" --tag-keys $TAG_SET    
    aws rds remove-tags-from-resource --resource-name "arn:aws:rds:us-east-1:655772981054:db:qa-sngl-cm" --tag-keys $TAG_SET
    
    aws rds remove-tags-from-resource --resource-name "arn:aws:rds:us-east-1:655772981054:db:qa1-net" --tag-keys $TAG_SET    
    aws rds remove-tags-from-resource --resource-name "arn:aws:rds:us-east-1:655772981054:db:scriptertest-sngl" --tag-keys $TAG_SET

    
        
    
    
    # ADD TAGS
    #aws rds add-tags-to-resource --resource-name "arn:aws:rds:us-east-1:655772981054:db:mysql-synergixx-c3s" \
    #    --tags $TAG_SET
        
        

