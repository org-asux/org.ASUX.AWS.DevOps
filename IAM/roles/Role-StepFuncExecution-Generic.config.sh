#!/bin/false

ArchLayer="Security"

###--------------------------------------------------------
###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
###--------------------------------------------------------

BOUNDARYPOLICY="arn:aws:iam::${ACCOUNT}:policy/cloudboost_account_operator_boundary_policy"
# BOUNDARYPOLICY="arn:aws:iam::${ACCOUNT}:policy/my-BoundaryPolicy-PretendAsEnterpriseBoundary"

###----------------------------

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
