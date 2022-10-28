#!/bin/false

ArchLayer="Administration"

###--------------------------------------------------------
###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
###--------------------------------------------------------

AppComponentId="Generic"
StepFuncName="DeleteStacksInParallel"
StepFuncExecutionRoleName="StepFunctionExecution-Generic"
StepFuncToDeleteStacksInSequence="DeleteStacksInSequence"

###--------------------------------------------------------
###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
###--------------------------------------------------------
PARAMETERS=(
    ParameterKey="ENV",ParameterValue="${ENV}"
    ParameterKey="ProjectId",ParameterValue="${PROJECTID}"
    ParameterKey="StepFuncName",ParameterValue="${StepFuncName}"
    ParameterKey="StepFuncExecutionRoleName",ParameterValue="${StepFuncExecutionRoleName}"
    ParameterKey="StepFuncToDeleteStacksInSequence",ParameterValue="${StepFuncToDeleteStacksInSequence}"
)

###--------------------------------------------------------
###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
###--------------------------------------------------------

StepFuncName="DeleteStacksInParallel"
STACKNAME="StepFunc-${StepFuncName}"

### EoScript
