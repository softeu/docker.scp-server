SCP only server
===============

authentication: 
==============
put id_rsa.pub into /authorized_keys directory 

usage:
======

 mkdir data authorized_keys
 cp ~/.ssh/id_rsa.pub authorized_keys
 docker run E -v `pwd`/data:/data -v `pwd`/authorized_keys:/authorized_keys -d-p 22022:22  BUILT_IMAGE
 scp -p 22022 some_local_file data@localhost:/data/

copied file will appear in data directory

