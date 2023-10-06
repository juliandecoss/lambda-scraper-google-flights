bucketname=`cat bucketname`
lambdaname=`cat lambdaname`
cd ../terraform
echo $(aws s3 ls s3://$bucketname/$lambdaname/ --profile personaljulian)
echo 'Please type version :'
read version
terraform init
terraform apply -var="app_version=$version" -input=false -auto-approve
