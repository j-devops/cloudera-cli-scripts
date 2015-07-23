ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub | ssh -i /root/DEV_KP.pem root@172.31.2.193 'umask 0077; mkdir -p .ssh; cat >> .ssh/authorized_keys && echo "Key copied"'
cat ~/.ssh/id_rsa.pub | ssh -i /root/DEV_KP.pem root@172.31.2.194 'umask 0077; mkdir -p .ssh; cat >> .ssh/authorized_keys && echo "Key copied"'
cat ~/.ssh/id_rsa.pub | ssh -i /root/DEV_KP.pem root@172.31.2.195 'umask 0077; mkdir -p .ssh; cat >> .ssh/authorized_keys && echo "Key copied"'
cat ~/.ssh/id_rsa.pub | ssh -i /root/DEV_KP.pem root@172.31.2.196 'umask 0077; mkdir -p .ssh; cat >> .ssh/authorized_keys && echo "Key copied"'
cat ~/.ssh/id_rsa.pub | ssh -i /root/DEV_KP.pem root@172.31.2.197 'umask 0077; mkdir -p .ssh; cat >> .ssh/authorized_keys && echo "Key copied"'
