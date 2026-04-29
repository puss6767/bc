
#q1
curl -sSL [https://bit.ly/2ysbOFE](https://bit.ly/2ysbOFE) | bash -s
cd fabric-samples/test-network
./network.sh up
docker ps


Q2: Create a Simple Permissioned Blockchain

./network.sh createChannel -c sanji

Q3: Two Organizations & Inter-Org Communication
./network.sh deployCC -ccn basic -ccp ../asset-transfer-basic/chaincode-go -ccl go -c sanji

Step 2: Demonstrate Communication

Communication is demonstrated by one Org "Writing" and the other "Reading."

# As Org2, query the ledger to see Org1's data
export PATH=${PWD}/../bin:$PATH
export FABRIC_CFG_PATH=$PWD/../config/
peer chaincode query -C sanji -n basic -c '{"Args":["ReadAsset","asset1"]}'
