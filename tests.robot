*** Settings ***
Library    SeleniumLibrary    timeout=15 seconds

Suite Teardown    Close All Browsers

*** Variables ***
${BASE_URL}    http://localhost:3001   

*** Test Cases ***
Open Movie Search App
    Open Browser    ${BASE_URL}    browser=chrome
    Page Should Contain Element    //h1[contains(text(), "Movie Search")]

Search For Movie - Valid Search Term
    Input Text    //input[@placeholder='Enter movie title']    pi
    Click Button    //button[contains(text(), 'Search')]
    Sleep  3s
    Page Should Contain Element    //div[@class='row']

Search For Movie - No Results
    Input Text    //input[@placeholder='Enter movie title']    NonExistentMovieTitle
    Click Button    //button[contains(text(), 'Search')]
    Sleep  3s
    Page Should Contain    No movies found for the entered title.
Search For Movie - Empty Search
    Click Button    //button[contains(text(), 'Search')]
    Page Should Contain    No movies found for the entered title.
    Sleep  3s

Search For Movie - Search with Multiple Words
    Input Text    //input[@placeholder='Enter movie title']    Action Movies
    Click Button    //button[contains(text(), 'Search')]
    Sleep  3s
    Page Should Contain Element    //div[@class='row']

Search For Movie - Search with Special Characters
    Input Text    //input[@placeholder='Enter movie title']    $pecial*Ch@racters
    Click Button    //button[contains(text(), 'Search')]
    Sleep  3s
    Page Should Contain    No movies found for the entered title.