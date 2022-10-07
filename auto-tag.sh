#!/bin/bash 

C1=$(git tag -l | awk -F . '{print $1}' |sort -n |uniq |tail -1)
C2=$(git tag -l | awk -F . '{print $2}' |sort -n |uniq |tail -1)
C3=$(git tag -l | awk -F . '{print $3}' |sort -n |uniq |tail -1)
echo "LATEST_TAG: $C1.$C2.$C3"
C3=$((C3+1))
VERSION="$C1.$C2.$C3"
echo "New Tag is : $VERSION"
echo "Creating new tag $VERSION"
git tag $VERSION  

echo "Pushing the new tag $VERSION"
git push --tags 

echo "New Tag is created and pushed"
echo "BYE............!!!!!!!!!!!!!!!!!!!!"
