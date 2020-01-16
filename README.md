# ballerina-github-integration
Project to connect and access data from the Github API with the use of ballerina

## Project Introduction
- Module 1 has a ballerina file which retrieves details about a given repository of a particular user
- Module 2 has a ballerina file which retrieves details of a particular issue given the owner, repo name and the issue number

## Steps to follow

- Install ballerina
- Install VSCode ballerina plugin

## Compatibility

| Ballerina Language Version  | GitHub API Version |
|:---------------------------:|:------------------------------:|
|  1.1.0                     |   V3                          | 

## Steps to run the project

- Clone the project.
  - $ git clone https://github.com/ashera96/ballerina-github-integration.git
  
- Build the modules.
  - $ ballerina build -a
  
- Run the frist module in order to retrieve repo details of a specific repo by providing the "owner" and "repo name" within the ballerina.conf file.
  - $ ballerina run target/bin/1_githubRepoConnector.jar
  
- Run the second module in order to retrieve details regarding a given issue. Here, the "owner", "repo name" and "issue number" should be provied within the ballerina.conf file.
  - $ ballerina run target/bin/2_githubIssueConnector.jar
