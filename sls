# sls function
function is an aws lambda function
independant unit of deployment via aws cloud
microservice written to perform a single job
avoid performing multiple jobs per function to allow seperation of concerns

# sls events
anything that triggers an AWS function to execute
events are aws infrastructure events such as:
  aws api gateway http endpoint
  aws s3 bucket upload
  cloudwatch timer
  aws sns topic
  cloudwatch alert
when you define an event for an aws lamda function in sls framework the framework automatically creates any infrastructure necessary for event (e.g an api gateway endpoint) and configure aws lambda function to listen to it

# sls resource
aws infrastructure components that functions use such as:
  aws dynamodb
  aws s3 bucket
  sns topic etc.
the sls framework deploys your functions, events that trigger them, and the aws infrastruture components your functions depend upon.

# sls service
service is sls unit of organization (project file), although you may have multiple services for a single application
service is where you define your functions, the events that trigger them, resources your functions use all in serverless.yml

// serverless.yml

service: users

functions: // Your "Functions"
  usersCreate:
    events: // The "Events" that trigger this function
      - http: post users/create
  usersCreate:
    events:
      - http: delete users/delete

resources: // The "Resources" your "Functions" use.  Raw AWS CloudFormation goes in here.

when you run sls deploy everything in serverless.yml is deployed at once

# plugins
use plugins to overwrite or extend the functionality of sls.  Every serverless.yml can contain a 'plugins:' property with multiple plugins

// serverless.yml

plugins:
  - serverless-offline
  - serverless-secrets

# service organization
myApp/
  serverless.yml  // Contains all functions and infrastructure resources

// as your application grows, you can break it up into multiple services and group functions related to workflows and data models together into one service:

users/
  serverless.yml  # Contains 4 functions that do Users CRUD operations and the Users database
posts/
  serverless.yml # Contains 4 functions that do Posts CRUD operations and the Posts database
comments/
  serverless.yml # Contains 4 functions that do Comments CRUD operations and the Comments database

# service creation

serverless create --template aws-nodejs --path myService

// available runtimes
    aws-nodejs
    aws-python
    aws-java-gradle
    aws-java-maven
    aws-scala-sbt

// this will create the following

    serverless.yml
    handler.js
    event.json

// responsibilities of serverless.yml

    Declare a Serverless service
    Define one or multiple functions in the service
    Define the provider the service will be deployed to (and the runtime if provided)
    Define custom plugins to be used
    Define events that trigger each function to execute (e.g. HTTP requests)
    Define a set of resources (e.g. 1 AWS CloudFormation stack) required by the functions in this service
    Allow events listed in the events section to automatically create the resources required for the event upon deployment
    Allow flexible configuration using Serverless Variables

You can see the name of the service, the provider configuration and the first function inside the functions definition which points to the handler.js file. Any further service configuration will be done in this file.

Every serverless.yml translates to a single AWS CloudFormation template and a CloudFormation stack is created from that resulting CloudFormation template.

# handler.js
contains function code
function definition in serverless.yml will point to handler.js and the function exported here

# event.json
contains event data you can use to invoke function via 'sls invoke -p event.json'

# deployment
when deploying a service via 'sls deploy' all functions, events and resources in serverless.yml are translated to AWS cloudformation template and deployed as a single cloudformation stack.

'sls deploy' defaults to dev stage and us-east-1 region unless explicitly specified
serverless deploy --stage prod --region us-east-1

# removal
'sls remove -v' to easily remove service from aws account
the removal process will only remove the service on the providers infrastructure and leave the service directory

# functions
all of the aws lambda functions can be found in serverless.yml under functions property
serverless.yml

service: myService

provider:
  name: aws
  runtime: nodejs4.3

functions:
  functionOne:
    handler: handler.functionOne

the handler property points to the file and module containing code you want to run in your function

// handler.js

module.exports.functionOne = function(event, context, callback) {}

one can add multiple functions in one serverless.yml

// serverless.yml

service: myService

provider:
  name: aws
  runtime: nodejs4.3

functions:
  functionOne:
    handler: handler.functionOne //Reference to file handler.js & exported function 'users'
    description: optional description for your Lambda
  functionTwo:
    handler: handler.functionTwo
  functionThree:
    handler: handler.functionThree

// providing function settings can be inherited via the provider property
// serverless.yml

service: myService

provider:
  name: aws
  runtime: nodejs4.3
  memorySize: 512 # inherited value

functions:
  functionOne:
    handler: handler.functionOne

// or can be specified at the function level
// serverless.yml

service: myService

provider:
  name: aws
  runtime: nodejs4.3

functions:
  functionOne:
    handler: handler.functionOne
    memorySize: 512 # function specific

# permissions
every aws lambda function needs permission to interact with other aws infrastructure resources within your account.
these permissions are set via aws iam role
you can set permission policy statements within this role via provider.iamRoleStatements property

serverless create --template aws-nodejs --path night 

# deploy service
serverless deploy -v

# deploy function
serverless deploy function -f home

# invoke function
serverless invoke -f hello -l

# serverless offline
cd ~/git/night 
npm install serverless-offline --save-dev
v ~/git/night/serverless.yml
plugins:
  - serverless-offline
sls //verify Offline listed in plugins
sls offline


