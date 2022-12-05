#!/bin/false

ArchLayer="Security"

###--------------------------------------------------------
###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
###--------------------------------------------------------

AppComponentId="Generic"
# myRoleName="StepFuncExecution-Generic"

###--------------------------------------------------------
###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
###--------------------------------------------------------
PARAMETERS=(
    ParameterKey="ENV",ParameterValue="${ENV}"
    ParameterKey="PermissionsBoundaryPolicyARN",ParameterValue="${BOUNDARYPOLICY}"
    ParameterKey="AppComponentId",ParameterValue="${AppComponentId}"
)

    # "${DEFAULT_PARAMETERS[@]}"
    # ParameterKey="AppComponentId",ParameterValue="Generic"

###--------------------------------------------------------
###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
###--------------------------------------------------------

MYROLENAME="StepFuncExecution-${AppComponentId}"

STACKNAME="Role-${MYROLENAME}"

### EoScript
