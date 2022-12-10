#!/bin/false

ArchLayer="Security"

###--------------------------------------------------------
###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
###--------------------------------------------------------

AWSMANAGEDPOLICY1=arn:aws:iam::aws:policy/service-role/AWSLambdaRole ### "Action": [ "lambda:InvokeFunction" ]  by AnyService!!!!!!
AWSMANAGEDPOLICY2=arn:aws:iam::aws:policy/AWSXrayFullAccess
AWSMANAGEDPOLICY3=arn:aws:iam::aws:policy/service-role/AmazonAPIGatewayPushToCloudWatchLogs

PARAMETERS=(
        ParameterKey="ENV",ParameterValue="${ENV}"
        ParameterKey="AppComponentId",ParameterValue="Generic"
        ParameterKey="PermissionsBoundaryPolicyARN",ParameterValue="${BOUNDARYPOLICY}"
        ParameterKey=managedPolicy1,ParameterValue=${AWSMANAGEDPOLICY1} \
        ParameterKey=managedPolicy2,ParameterValue=${AWSMANAGEDPOLICY2} \
        ParameterKey=managedPolicy3,ParameterValue=${MYOWN_S3MANAGEDPOLICY} \
)

###--------------------------------------------------------
###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
###--------------------------------------------------------

MYROLENAME="LambdaExecution-Generic"

STACKNAME="Role-${MYROLENAME}"

### EoScript
