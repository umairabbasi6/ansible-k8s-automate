## Xotocross Scheduler 

```shell
# 1. get the id_rsa
# 2. get the address for the node
# 3. run the following :
ssh -i ./id_rsa ubuntu@<address>

# 4. run kube for pods 
 kubectl get pods -A
```


SETUP : 

1. create the following secrets and adapt on pipelines : 

replace these with your own
$XOTOCROSS_AWS_KEY_ID
$XOTOCROSS_AWS_ACCESS_KEY
$XOTOCROSS_GITHUB_SSH_ID
$XOTOCROSS_GITHUB_SSH_KEY


2. run the pipeline on github via workflow and add in the bucketname 
3. make sure that the region is eu-west-3
4. check on aws that the following work :
- that we get master and nodes to work together automatically 
- that we get the scheduler to run on time to turn off the ec2s at the right time
- that everything is automated
- that there are no bugs or errors 
- after anisble downloads all dependencies on playbook make sure to be ble to run the docker compose on init 
- there is a # TODO => these need to be uncommented and working :  in the playbook that needs to be uncommented 

NOTE : 
make sure to create the bucket you need and run the clean up workflow each time you create one 