#!/bin/bash

read k;

echo $k | gawk '{ans=0; sum=100 ;while(sum<$1){sum+=int(sum*0.01); ans++}print ans}'
