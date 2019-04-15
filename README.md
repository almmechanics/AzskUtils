# Introduction 
A simple utility to convert AzSK output to NUnit style for use in Azure DevOps.

The tool uses [Pester](https://github.com/pester/Pester) as the conversion engine from AzSK to NUnit.

[![Build status](https://almmechanics.visualstudio.com/DevSecOps/_apis/build/status/azuk_utils_ci)](https://almmechanics.visualstudio.com/DevSecOps/_build/latest?definitionId=45)

# Getting Started
This tool requires the AzSK toolkit to be installed within the same pipleine. More information on this can be found in [azsk](https://azsk.azurewebsites.net)

# Build and Deployment pipeline usage
This tool can be dropped in between the  `AzSK_ArmplateChecker` and `Publish Test Results` Azure DevOps Tasks as shown below

![AzSK Usage](images/AzSK_Image.png)

## Output

The following image shows the NUnit output of the AzSK analysis of the `101-1vm-2nics-2subnets-1vnet` subfolder from the https://github.com/Azure/azure-quickstart-templates repository

![NUnit output](images/example_output.png)

## Extension Features
1. The NUnit tests are exported as an Output variable; the default value for this is `AZSK.NUnit.OutputPath`.

1. Failing Tests can also be reported as errors - useful in PR and CI use cases.

# Contribute
To assist in the development of this extension then please contact me via azsk@almmechanics.com.

If you have any issues/feature requests then please add comment via  https://github.com/almmechanics/AzskUtils