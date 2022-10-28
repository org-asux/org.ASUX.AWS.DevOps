#!/bin/false

ArchLayer="Administration"

###--------------------------------------------------------
###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
###--------------------------------------------------------

AppComponentId="Generic"
StepFuncName="DeleteStacksInSequence"
StepFuncExecutionRoleName="StepFunctionExecution-Generic"
StepFuncToDeleteStacksInParallel="DeleteStacksInParallel"

###--------------------------------------------------------
###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
###--------------------------------------------------------
PARAMETERS=(
    ParameterKey="ENV",ParameterValue="${ENV}"
    ParameterKey="ProjectId",ParameterValue="${PROJECTID}"
    ParameterKey="StepFuncName",ParameterValue="${StepFuncName}"
    ParameterKey="StepFuncExecutionRoleName",ParameterValue="${StepFuncExecutionRoleName}"
    ParameterKey="StepFuncToDeleteStacksInParallel",ParameterValue="${StepFuncToDeleteStacksInParallel}"
)

    # "${DEFAULT_PARAMETERS[@]}"
    # ParameterKey="AppComponentId",ParameterValue="Generic"

###--------------------------------------------------------
###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
###--------------------------------------------------------

StepFuncName="DeleteStacksInSequence"
STACKNAME="StepFunc-${StepFuncName}"

### EoScript
