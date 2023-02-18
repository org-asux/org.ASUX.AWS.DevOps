#!/bin/false

ArchLayer="Administration"

###--------------------------------------------------------
###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
###--------------------------------------------------------

StepFuncName="DeleteStacksInParallel"
StepFuncExecutionRoleName="StepFunctionExecution-CleanUp-Generic"
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

StackName="StepFunc-${StepFuncName}"

### EoScript
