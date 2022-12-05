#!/bin/false

ArchLayer="Security"

###--------------------------------------------------------
###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
###--------------------------------------------------------

PARAMETERS=(
    ParameterKey="ENV",ParameterValue="${ENV}"
    ParameterKey="PermissionsBoundaryPolicyARN",ParameterValue="${BOUNDARYPOLICY}"
)

###--------------------------------------------------------
###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
###--------------------------------------------------------

MYROLENAME="StepFuncExecution-CleanUp-Generic"

STACKNAME="Role-${MYROLENAME}"

### EoScript
