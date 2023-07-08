# A terraform scripts that deploys a static webapp to the public internet using AWS

This scripts helps to provision a static website on Aws S3 bucket, the folder form your local machine is uploaded (through a for loop) to your S3 buckt and all bucket configurations and permissions are set up. The S3 bucket URL is then provided for easy access on the browser.

## Instructions on how to manage deploy and manage the application

1. The first step is to have an account provisioned on AWS, you then create a user with all the necessary permissions, as it is not advisable to use your root account.

2. Using terraform, Create an S3 bucket with a unique bucket name

3. Having created your S3 bucket, you are to allow public access on that bucket.

4. Enable static web hosting on your bucket, this configures the S3 bucket to host the website

5. upload your files to the S3 bucket, in this terraform script this was done through looping into the folder from the local machine using fileset function and then uploading the files on Aws. 
_remember to specify the content-type, if not when you try reaching the bucket's url the site will only be downloaded_

6. Assign the bucket policy, this allows you to read and get the object on the bucket


###  Questions I would have asked and the Assumptions I made

1. Do you have any specific error page configurations in mind, such as custom error pages for 404 or 403 errors?

2. Are there any additional requirements or specific configurations you would like to apply to the S3 bucket hosting the static website?

3. Do you have a specific AWS region in mind where the S3 bucket should be created?

4. Are there any specific access control requirements for the S3 bucket and its objects? For example, should the bucket or objects be publicly accessible or restricted to certain IAM users or roles?

_it is recommended that the statefiles are hosted on the cloud e.g aws => S3 bucket, azure=> blob storage account._

_it is recommended that a branch is created on git apart from the master, where changes can be compared and merged._