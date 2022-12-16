*** Keywords ***

response status code should be "${status code}"
    Integer     response status     ${status code}

String response body "${body name}" should be "${string data}"
    String      response body  ${body name}      ${string data}



