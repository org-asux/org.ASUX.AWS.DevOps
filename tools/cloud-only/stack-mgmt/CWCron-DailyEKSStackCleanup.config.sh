#!/bin/false

ArchLayer="Administration"

###--------------------------------------------------------
###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
###--------------------------------------------------------

StepFuncName="DeleteStacksInSequence"
EventBridgeExecutionRoleName="CWCron-Generic"
SNSTopicName="sandbox-DefaultAllPurposeNotifChannel"    ### Not the ARN.  Just the name
EventBusName="default"      ### The Name of the EventBus. NOT the ARN !!!  Typically, leave it UN-specified, when 'default' is used

###--------------------------------------------------------
###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
###--------------------------------------------------------
PARAMETERS=(
    ParameterKey="StepFuncName",ParameterValue="${StepFuncName}"
    ParameterKey="EventBridgeExecutionRoleName",ParameterValue="${EventBridgeExecutionRoleName}"
    ParameterKey="SNSTopicName",ParameterValue="${SNSTopicName}"
    ParameterKey="EventBusName",ParameterValue="${EventBusName}"
)

###--------------------------------------------------------
###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
###--------------------------------------------------------

STACKNAME="CWCron-DailyEKSStackCleanup"

### EoScript
