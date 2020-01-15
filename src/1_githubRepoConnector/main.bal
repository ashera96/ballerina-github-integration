import ballerina/io;
import ballerina/http;
import ballerina/config;

# The github username
string username = config:getAsString("GITHUB_USERNAME");

# The github repo name
string repo = config:getAsString("GITHUB_REPO_NAME");

public function main() {
    http:Client clientEndpoint = new("https://api.github.com");

    // Constructing the url
    string url = "/repos/" + username + "/" + repo;
    var response = clientEndpoint->get(url);
    
    io:println("\n\n*********** REPOSITORY DETAILS OF " + repo + " ***********\n");
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