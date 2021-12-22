#!/bin/bash


usernamePre=$1

MAX=$2

count=1

while [ $count -le ${MAX} ]
do 
     username="${usernamePre}${count}"
    ./2-sign-user.sh  ${username}
    
    ./3-revoke-user.sh ${username}
    count=$(($count+1))
    rm  -rf newcerts/$username@*
done 


./4-list-revoked-cert.sh
./5-update-crl.sh


