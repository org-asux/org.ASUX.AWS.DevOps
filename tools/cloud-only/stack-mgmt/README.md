# Cascade Deletion of CloudFormation Stacks in proper order.

While in early development, with so much refactoring going on, I felt frustrated due to the lack of a simple way to **CASCADE DELETE** stacks, especially when resources created within each Stack have dependencies on other stacks.

The frustration is that I have to wait and wait and wait .. , as I am forced to MANUALLY delete one specific stack before another.<BR>But, at the same time, I'd like to delete AS MANY STACKS as I can, in parallel.

I hope this tool feels VERY EASY AND VERY SIMPLE to use, just like my experience.

# Tool - Install

FYI: The tool is a PAIR of StepFunctions.<BR>
But, it requires an IAM Role (Duh! Everything on AWS does!)

##  Pre-Requisite (Deploy the single IAM-Role.)

1.  This IAM Role needs to allow a LOT of permissions to the StepFunctions, to delete any kind of AWS Resource in any Stack.
1.  NOTE: When deleting stacks like, say, EKS, you'll realize that a lot of permissions are needed by the StepFunctions!
1.  Download the [`...-CFT.yaml`](../../../IAM/Role-StepFuncExecution-CleanUp-Generic-CFT.yaml) file under https://github.com/org-asux/org.ASUX.AWS.DevOps/tree/main/IAM/
1.  The CFT requires that you provide multiple CFT-parameters.<BR>See the [`...config.sh`](../../../IAM/Role-StepFuncExecution-CleanUp-Generic.config.sh) file for **As-Is ready-to-use** values.
1.  Deploy this CFT.
1.  Verify that a new IAM role named `StepFunctionExecution-Generic` exists.

##  Deploy 2 StepFunctions

They are named `DeleteStacksInSequence` and `DeleteStacksInParallel`

1.  Download the 2 CFT files from https://github.com/org-asux/org.ASUX.AWS.DevOps/tree/main/tools/cloud-only/stack-mgmt
    *   [StepFunc-DeleteInSequence](./StepFunc-DeleteStacksInSequence-CFT.yaml)
    *   [StepFunc-DeleteInParallel](./StepFunc-DeleteStacksInParallel-CFT.yaml)
1.  The CFT files require that you provide multiple CFT-parameters.<BR>See the `*.config.sh` files for **As-Is ready-to-use** values.
    *   [Parameters for StepFunc-DeleteInSequence](./StepFunc-DeleteStacksInSequence.config.sh)
    *   [Parameters for StepFunc-DeleteInParallel](./StepFunc-DeleteStacksInParallel.config.sh)
1.  Deploy _BOTH_ the CFT files.
1.  Verify the StepFunctions are created.

# Tool - Use

1.  Modify and use the sample JSON (below)as Input for the next step.<BR>If you prefer AWS-CLI (instead of Web-browser AWS-Console), see next sub-section.
1.  Pay ATTENTION to line 1 in JSON below.<BR>Make sure you have a working SNS Topic !!
    *   Ensure that it will deliver an email-notification to you if there is ANY PROBLEM when deleting stacks.
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

Save the above sample JSON as a new file, and update it to your needs.

```
STEPFN_JSONINPUT="./samples/SeeAbove.json"

STATEMACHINE_ARN="arn:aws:states:${AWSREGION}:${AWSACCOUNTID}:stateMachine:DeleteStacksInSequence"

aws stepfunctions start-execution --state-machine-arn "${STATEMACHINE_ARN}" --input "file://${STEPFN_JSONINPUT}"
```

## Tool - Advanced Topics

1.  You can definitely have a `deleteInSequence` as an element of another `deleteInSequence`.
    *  No unique behavior/BENEFIT in doing so.<BR>You might as well "flatten" the JSON.
    *  If no benefit, then why do I support it?<BR>Answer: It makes our lives easier allowing us to COPY-N-PASTE a list of Stacks, especially when we have a "common" set of Stacks across multiple projects.
1.  You can definitely have a `deleteInParallel` as an element of another `deleteInParallel`.
    *  Same points as previous.

# APPENDIX: Cloudformation Statuses

https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-describing-stacks.html

Cloudformation Stack Completion or Failure or in-progress State Status

```
CREATE_IN_PROGRESS
CREATE_COMPLETE

DELETE_IN_PROGRESS
DELETE_COMPLETE

UPDATE_IN_PROGRESS
UPDATE_COMPLETE
UPDATE_COMPLETE_CLEANUP_IN_PROGRESS
UPDATE_ROLLBACK_COMPLETE
UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS
UPDATE_ROLLBACK_IN_PROGRESS

ROLLBACK_COMPLETE
ROLLBACK_IN_PROGRESS

REVIEW_IN_PROGRESS

CREATE_FAILED
DELETE_FAILED
ROLLBACK_FAILED
UPDATE_FAILED
UPDATE_ROLLBACK_FAILED
IMPORT_ROLLBACK_FAILED

IMPORT_IN_PROGRESS
IMPORT_COMPLETE
IMPORT_ROLLBACK_IN_PROGRESS
IMPORT_ROLLBACK_COMPLETE
```

# EoF
