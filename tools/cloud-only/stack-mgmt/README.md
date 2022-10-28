# Cascade Deletion of CloudFormation Stacks in proper order.

While in early development, with so much refactoring going on, I felt frustrated due to the lack of a simple way to **CASCADE DELETE** stacks, especially when resources created by them have dependencies.

The frustration is that I have to wait and wait and wait .. , as I am forced to delete one specific stack before another.<BR>But, at the same time, I'd like to delete AS MANY STACKS as I can, in parallel.

I hope this tool feels VERY EASY AND VERY SIMPLE to use, just like my experience.

# Tool - Install

FYI: The tool is a PAIR of StepFunctions.

1.  Pre-Requisite: Deploy an IAM-Role that allows a lot of permissions for the StepFunctions.
    1.  NOTE: When deleting stacks like, say, EKS, you'll realize that a lot of permissions are needed by the StepFunctions!
    1.  Download the `..-CFT.yaml` file under https://github.com/org-asux/org.ASUX.AWS.DevOps/tree/main/IAM/roles
    1.  The CFT requires that you provide multiple CFT-parameters.<BR>See the `*.config.sh` file for **As-Is ready-to-use** values.
    1.  Deploy this CFT.
    1.  Verify that a new IAM role named `StepFunctionExecution-Generic` exists.
1.  Deploy 2 StepFunctions named `DeleteStacksInSequence` and `DeleteStacksInParallel`
    1.  Download the CFT files from https://github.com/org-asux/org.ASUX.AWS.DevOps/tree/main/tools/cloud-only/stack-mgmt
    1.  The CFT files require that you provide multiple CFT-parameters.<BR>See the `*.config.sh` files for **As-Is ready-to-use** values.
    1.  Deploy _BOTH_ the CFT files.
    1.  Verify the StepFunctions are created.

# Tool - Use

1.  Optionally modify and use the sample JSON below as Input for the next step.<BR>If you prefer AWS-CLI (instead of Web-browser AWS-Console), save the following JSON as a new file.
1.  Pay ATTENTION to line 1 in JSON below.<BR>Make sure you have a working SNS Topic (Ensure that it will deliver an email-notification to you if there is ANY PROBLEM when deleting stacks)
1.  Invoke `DeleteStacksInSequence` StepFunction with the sample JSON below.

```
{
    "SNSTopicName": "sandbox-DefaultAllPurposeNotifChannel",
    "Comment": "any KV-Pairs other than SNSTopicName and deleteInSequence/deleteInParallel are IGNORED",

    "deleteInSequence": [

        { "deleteInParallel": [
            "stepfunc1StackName",
            "stepfunc2StackName",
            "stepfunc3StackName",
        ]},

        { "deleteInParallel": [
            { "deleteInSequence": [
                    "Lambda1StackName",
                    "SQSStackName"
            ]},
            "Lambda2StackName",
            "Lambda3StackName"
        ]},

        "Role-1StackName",
        "Role-1StackName",
        "Role-3StackName",
    ]

}
```

## CLI invocation

```
STATEMACHINE_ARN="arn:aws:states:${REGION}:${ACCOUNT}:stateMachine:DeleteStacksInSequence"
STEPFN_JSONINPUT="./samples/SeeAbove.json"

aws stepfunctions start-execution --state-machine-arn "${STATEMACHINE_ARN}" --input "file://${STEPFN_JSONINPUT}"
```

## Tool - Advanced Topics

1.  You can definitely have a `deleteInSequence` as an element of another `deleteInSequence`.
    *  No unique behavior/BENEFIT in doing so.<BR>You might as well "flatten" the JSON.
    *  If no benefit, then why do I support it?<BR>Answer: It makes our lives easier allowing us to COPY-N-PASTE a list of Stacks, especially when we have a "common" set of Stacks across multiple projects.
1.  You can definitely have a `deleteInParallel` as an element of another `deleteInParallel`.
    *  Same points as previous.

# EoF
