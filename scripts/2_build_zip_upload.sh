#aws s3 rm s3://backend-lambda-golang/v0.0.1/ --recursive --profile personaljulian
bucketname=`cat bucketname`
lambdaname=`cat lambdaname`
cd ..
make build-package
echo $(aws s3 ls s3://$bucketname/$lambdaname --profile personaljulian)
echo 'Please type version :'
read version
cd terraform/build
aws s3 cp google-scraper.zip s3://$bucketname/$lambdaname/v$version/lambda-python.zip --profile personaljulian
