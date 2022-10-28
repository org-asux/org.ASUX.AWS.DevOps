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

    # "${DEFAULT_PARAMETERS[@]}"
    # ParameterKey="AppComponentId",ParameterValue="Generic"

###--------------------------------------------------------
###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
###--------------------------------------------------------

StepFuncName="DeleteStacksInParallel"
STACKNAME="StepFunc-${StepFuncName}"

### EoScript
