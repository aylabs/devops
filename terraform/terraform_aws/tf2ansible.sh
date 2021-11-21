terraform output | grep '"' | awk -F '"' 'BEGIN {i=1; print "[cluster]"} {print "node0" i++ " ansible_host="$2}' > ../ansible/swarm/hosts.ini
