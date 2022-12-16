*** Settings ***
Library             REST  	https://reqres.in
Library             DataDriver    ../test_data/data_driven_getUsers.csv    encoding=utf_8    dialect=excel

Test Template       Send a GET request to get user



*** Variable ***
${path}     /api/users/



*** Test case ***

Get user ${id}


*** Keywords ***

Send a GET request
    [Arguments]  ${path}  ${id}
    GET     ${path}+${id}

respondse status code should be
    [Arguments]  ${status_code}
    Integer     response status     ${status_code}

id should be
    [Arguments]  ${id}
    Integer     $.data.id     ${id}

email should be
    [Arguments]  ${email}
    String     $.data.email    ${email}

first name should be
    [Arguments]  ${first_name}
    String     $.data.first_name    ${first_name}

last name should be
    [Arguments]  ${last_name}
    String     $.data.last_name    ${last_name}

avatar image should be
    [Arguments]  ${avatar}
    String     $.data.avatar    ${avatar}

Send a GET request to get user
    [Arguments]  ${path}  ${id}  ${status_code}  ${email}  ${first_name}  ${last_name}  ${avatar}
    Send a GET request                          ${path}  ${id}
    respondse status code should be             ${status_code}
    run keyword if      ${status_code} == 200   id should be                                ${id}
    run keyword if      ${status_code} == 200   email should be                             ${email}
    run keyword if      ${status_code} == 200   first name should be                        ${first_name}
    run keyword if      ${status_code} == 200   last name should be                         ${last_name}
    run keyword if      ${status_code} == 200   avatar image should be                      ${avatar}