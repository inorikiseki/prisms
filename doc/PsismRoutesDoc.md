# Prism Routes Documentation

```mysql
DROP TABLE IF EXISTS HttpCode;

CREATE TABLE HttpCode
(
    code       SMALLINT UNIQUE PRIMARY KEY,
    annotation VARCHAR(255) NOT NULL
);

INSERT INTO HttpCode (code, annotation)
VALUES (100, 'Continue'),
       (200, 'OK'),
       (201, 'Created'),
       (301, 'Moved Permanently'),
       (302, 'Found'),
       (400, 'Bad Request'),
       (401, 'Unauthorized'),
       (404, 'Not Found'),
       (500, 'Internal Server Error'),
       (502, 'Bad Gateway');

Drop TABLE IF EXISTS Routes;

CREATE TABLE Routes
(
    id             BIGINT AUTO_INCREMENT PRIMARY KEY,
    category       VARCHAR(50)                        NOT NULL DEFAULT 'general',
    path           VARCHAR(255) UNIQUE                NOT NULL,
    implement      TINYTEXT,
    protocol       ENUM (
        'http', 'https', 'websocket',
        'ftp','ssh','smtp'
        )                                                      DEFAULT 'http',
    req_type       ENUM ('Get','Post','Put','Delete') NOT NULL DEFAULT 'get',
    param_type     ENUM ('None',
        'UrlParam',
        'ReqBodyAsJson', 'ReqBodyAsFormData',
        'Query',
        'Header',
        'File'
        )                                             NOT NULL DEFAULT 'None',
    res_code       SMALLINT                                    DEFAULT 200,
    res_type       ENUM (
        'json','text', 'html', 'css', 'image','audio',
        'csv', 'pdf', 'markdown', 'other'
        )                                                      DEFAULT 'json',
    res_data       VARCHAR(255),
    res_msg        VARCHAR(255),
    preconditions  TINYTEXT,
    postconditions TINYTEXT,
    extensions     TINYTEXT,
    remark         TINYTEXT,
    created_at     TIMESTAMP                                   DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (res_code) REFERENCES HttpCode (code),
    FOREIGN KEY (category) REFERENCES PrismModule (name)
);


CREATE TABLE PrismModule
(
    name        VARCHAR(50) UNIQUE PRIMARY KEY,
    description TINYTEXT
);

ALTER TABLE Routes
    MODIFY param_type ENUM ('None',
        'UrlParam',
        'ReqBodyAsJson', 'ReqBodyAsFormData',
        'Session',
        'Query',
        'Header',
        'File'
        ) NOT NULL DEFAULT 'None';

ALTER TABLE Routes
    Add param_fields VARCHAR(255);

```

> **HTTP response codes are grouped into five classes:**  
> 1xx (Informational):  
> Example: `100` Continue  
> 2xx (Success):  
> Example: `200` OK, `201` Created  
> 3xx (Redirection):  
> Example: `301` Moved Permanently, `302` Found  
> 4xx (Client Error):  
> Example: `400` Bad Request, `401` Unauthorized, `404` Not Found  
> 5xx (Server Error):  
> Example: `500` Internal Server Error, `502` Bad Gateway

> **Request Types** (req_type)  
> Common HTTP request methods:
> - GET:    
    > Requests data from a specified resource.
> - POST:  
    > Submits data to be processed to a specified resource.
> - PUT:  
    > Updates a current resource with new data.
> - DELETE:  
    > Deletes the specified resource.

> Note  
> To insert block code arrow automatically in IDEA,
> you can:
> 1. Select the paragraph
> 2. Indent it
> 3. Add `>` to the first line
> 4. Press reformat(`Ctrl`+`Alt`+`Enter`)
> 5. Then it adds `>` to each line of the paragraph

```mysql
SELECT r.category,
       r.path,
       r.protocol,
       r.req_type,
       r.param_type,
       r.param_fields,
       r.remark
FROM routes as r
ORDER BY r.category;
```

| category | path          | protocol | req\_type | param\_type   | param\_fields                               | remark              |
|:---------|:--------------|:---------|:----------|:--------------|:--------------------------------------------|:--------------------|
| account  | account       | http     | Get       | Session       | accountId                                   | All User's Own Info |
| auth     | auth/login    | http     | Post      | ReqBodyAsJson | email, password, verificaion code           | null                |
| auth     | auth/register | http     | Post      | ReqBodyAsJson | username, email, password, verificaion code | null                |
| auth     | auth/forget   | http     | Post      | ReqBodyAsJson | email                                       | Forget Password     |
| auth     | auth/reset    | http     | Post      | Session       | password, new password                      | Reset Password      |
| auth     | auth/logout   | http     | Post      | Session       |                                             | null                |
| profile  | profile       | http     | Get       | UrlParam      | username                                    | Public User Info    |
