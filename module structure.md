typical file structure for a new module:

# LICENSE: 
contains the license under which your module will be distributed. 
When you share your module, the LICENSE file will let people using it know the terms under which it has been made available.
Terraform itself does not use this file.

# README.md: 
contains documentation in markdown format that describes how to use your module. 
Terraform does not use this file, but services like the Terraform Registry and GitHub will display the contents of this file to visitors to your module's 
Terraform Registry or GitHub page


# main.tf: 
contains the main set of configurations for your module. 
You can also create other configuration files and organize them in a way that makes sense for your project.

# variables.tf: 
contains the variable definitions for your module. 
When your module is used by others, the variables will be configured as arguments in the module block. 
Because all Terraform values must be defined, any variables that don't have a default value will become required arguments. 
A variable with a default value can also be provided as a module argument, thus overriding the default value.


# outputs.tf: 
contains the output definitions for your module. 
Module outputs are made available to the configuration using the module, 
so they are often used to pass information about the parts of your infrastructure defined by the module to other parts of your configuration


