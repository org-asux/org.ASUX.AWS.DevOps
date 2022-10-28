#!/bin/false

ArchLayer="Administration"

###--------------------------------------------------------
###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
###--------------------------------------------------------

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

STACKNAME="StepFunc-${StepFuncName}"

### EoScript
