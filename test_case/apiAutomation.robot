*** Settings ***
Library             REST  	https://reqres.in
resource            ../keywords/apiAutomationKeyword.robot





*** Variable ***
${post data}    {"name": "morpheus","job": "leader"}
${put data}     {"name": "morpheus","job": "zion resident"}



*** Test case ***

1. GET a list of users
    GET     /api/users?page=2
    response status code should be "200"
    Integer     response body page     2
    Integer     response body per_page     6
    Integer     response body total    12
    Integer     $.data[*].id   minimum=7    maximum=12
    String      $.support.url   https://reqres.in/#support-heading
    String      $.support.text  To keep ReqRes free, contributions towards server costs are appreciated!

2. GET a single user
    GET     /api/users/2
    response status code should be "200"
    Integer     $.data.id   2
    String      $.data.email    janet.weaver@reqres.in
    String      $.data.first_name    Janet
    String      $.data.last_name     Weaver
    String      $.data.avatar    https://reqres.in/img/faces/2-image.jpg

3. GET a non-exist user
    GET     /api/users/23
    response status code should be "404"

4. GET a list of resource
    GET     /api/unknown
    response status code should be "200"
    Integer     response body total     12

5. GET a single resource
    GET     /api/unknown/2
    response status code should be "200"
    Integer     $.data.id   2

6. Create a new user
    POST    /api/users      ${post data}
    response status code should be "201"
    String      response body name      morpheus
    String      response body job       leader

7. Update a user data
    PUT     /api/users/2    ${put data}
    response status code should be "200"
    String      response body name      morpheus
    String      response body job       zion resident

8. Delete a user
    DELETE      /api/users/2
    response status code should be "204"
