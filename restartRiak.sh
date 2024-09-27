#!/bin/bash
# Loop thorught all riak systems and restart machine
for i in {0..4}; do
    ssh -v -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o ProxyCommand="ssh -p 22854 -W %h:%p sukhikushwaha@bastion.rightleads.io" sukhikushwaha@10.0.1.2$i "sudo systemctl restart riak"
    echo "--------------------------------------------------------------------------------------------------------------------"
    echo "                                           Command executed on 10.0.1.2$i"
    echo "--------------------------------------------------------------------------------------------------------------------"
done

ssh -v -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o ProxyCommand="ssh -p 22854 -W %h:%p sukhikushwaha@bastion.rightleads.io" sukhikushwaha@10.0.1.20 "sudo riak-admin cluster status"
echo "--------------------------------------------------------------------------------------------------------------------"
echo "                                           Command executed on 10.0.1.20"
echo "--------------------------------------------------------------------------------------------------------------------"
