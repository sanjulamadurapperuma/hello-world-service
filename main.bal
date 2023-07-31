import ballerina/io;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {
    resource function get invokeservice() returns string|error {
        // invoke a bakend service
        http:Client clientEp = check new ("http://helloworld-3649256690:9090/");
        http:Response response = check clientEp->get("/greeting");
        io:println("Response from backend: Received");
        return response.getTextPayload();

    }
}