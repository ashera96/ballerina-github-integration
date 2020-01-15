import ballerina/io;
import ballerina/http;
import ballerina/config;

# The repo owner
string owner = config:getAsString("REPO_OWNER");

# The repo name
string repo = config:getAsString("REPO_NAME");

# The issue number
string issueNumber = config:getAsString("ISSUE_NUMBER");

public function main() {
    http:Client clientEndpoint = new("https://api.github.com");

    // Constructing the url
    string url = "/repos/" + owner + "/" + repo + "/issues/" + issueNumber;
    var response = clientEndpoint->get(url);
    
    io:println("\n\n*********** ISSUE NUMBER " + issueNumber+ " OF " + repo + " ***********\n");
    if (response is http:Response) {
        json|error jsonPayload = response.getJsonPayload();
        if (jsonPayload is json) {
            io:println(jsonPayload.toJsonString());
        } else {
            io:println("Invalid payload received: ", jsonPayload.reason());
        }
    } else {
        io:println("Error when calling the backend: ", response.reason());
    }
}