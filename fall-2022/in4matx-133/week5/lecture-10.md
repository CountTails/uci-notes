# Lecture 10: Server-side development

## Client side and server-side JS

| Client | Server |
| ----- | ------- |
| Runs in the browser | Runs in the command line |
| Changes happen in real-time in the browser | Changes happen in response to HTTP requests |
| Cannot make HTTP requests to many APIs | Can make HTTP requests to most APIs
| Browser implements same-origin policy | No same-origin policy restrictions |

## Server side development: Node JS

- Event driven, non-blocking I/O model makes it efficient
- Best for highly interactive pages
    - When a lot of computation is required, other frameworks are better
    - Event-driven loops are inefficient
- Lower threshold for us: we already know JS

### Other environments

- Ruby on Rails for Ruby
- Django or web2py for Python
- Just about any language can be used to create dynamic websites

### Node.js `hello world`

```Python
var http = require('http');  # require the http library
var server = http.createServer(function(req, res) {
    res.writeHead(200);
    res.end('Hello World');
});

server.listen(8080); # listen on port 8080
```

### Running Node.js

Open a terminal

```shell
node file.js
```

Node is listening on port 8080. But the JavaScript is not running in the browser.  It’s running on the server.

### Client side

```HTML
<html>
  <head>
    <script src="./hello.js"></script> 
  </head>
  <body>
    Hello, world
  </body>
</html>
```

## What does Node.js add?

- OS-level functionality like reading and writing files
- Tools for importing and managing packages
- The ability to listen on a port as a web server
- It's just JS; it is a pretty basic web framework

### What a good server-side web framework need?

- To speak HTTP: Accept connections, handle requests, send replies
- Routing: Map URLs to the webserver function for that URL
- Middleware support
    - Add data processing layers
    - Make it easy to add support for user sessions, security, compression, etc.
- Available it Node.js, but somewhat difficult to use

## Authentication and authorization

### Authentication

- The process of establishing and verifying identity
- Identification: who are you? (username, account number, etc)
- Authentication: prove it! (password, PIN, etc)

### Authorization

- Once a user's identity is known, we must decide what they are allowed to access or modify
- One way is the app defines permissions upfront based on a user's role
    - A student can access their grades, but cannot modify them
    - A TA or professor can access and modify everyone's grades
- Another way is for the app to request the user grant certain permissions
    - Can I do X on your behalf

### Multi-factor authentication

- Should be a mix of things that you *have/possess* and things that you *know*
- ATM machine: 2-factor authentication
    - ATM card: something you *have*
    - PIN: something you *know*
- Password + code delivered via SMS
    - Password: something you *know*
    - Code: validates that you *possess* your phone
- **TWO PASSWORDS IS NOT TWO FACTOR AUTHENTICATION**

## Password protocol

- Send a login and a password to a server
- Server checks your credentials and okays you
- Need to trust that the server is storing your password securely

```

+------------+     login     +------------+
|            | ------------> |            |
|   Client   |               |   Server   |
|            | <------------ |            |
+------------+     ok        +------------+
```

- Sending data: Once you've logged in, the server can send you whatever data you're allowed to see

### Sending data to a third party

- Now you have to trust *another* service to manage your password
- What if you don't want them to have full access?
- What if you want to revoke access?

### Oauth 2.0

- **O**pen **auth**entication
- Goal: support users granting access to third-party applications
    - Do not require users to share their passwords with third parties
    - Allow users to revoke access at any time

#### History

- There was a version 1.0
    - It was comples, insecure
    - It is deprecated
- Google, Twitter, & Yahoo! teamed up to propose 2.0
- 2.0 is not compatible with 1.0

#### Terminology

| Term | Definition |
| ---- | ---------- |
| Client | Third-party app who wants access to resources owned by the *resource owner* |
| Resource owner (user) | Person whose data is being processed, which is stored on the *resource server* |
| Resource server | App that stores the resources |
| Authorization and Token endpoints | URIs from where a resource owner authorizes requests |
| Authorization code | A string the client uses to request access tokens |
| Access token | A string the client uses to access resources. Expires after some amount of time |
| Refresh token | Once the access token expires, can be exchanged for a new access token |

#### Process

1) Request authorization
2) Get access token
3) Make API calls
4) Refresh access token

## Oauth 2.0 on server-side JS

- This example will walk through the Oauth flow for server-side JS
- There are browser-side ways of doing (some parts of) Oauth
- For A3, you'll send all browser-side requests to a `Node.js/Express` server

### Requesting authorization

- MakeapagewithlinkstoSpotify’s [authorization endpoint](https://accounts.spotify.com/authori ze/)
- Pass arguments in the query string
    - Client ID (public ID of your app)
    - Response type (string "code")
    - Redirect URI (where to return to)
    - Scope (what permissions to ask for)

```
https://accounts.spotify.com/authorize? <= Endpoint
response_type=code& <= code response type
client_id=6d81b7a55e894abdbf53143fb2901573& <= client ID for app
scope=user-read-private%20user-read-email& <= scope
redirect_uri=http%3A%2F%2Flocalhost%3A8888%2 <= Fcallback
```

### Handling responses

- User clicks "okay", browser then redirects back to your server
- The response contains additional parameters in the URL
- `http://localhost:8888/callback?code=...`
- In Express, `code` can be accessed through `req.query`

### Requesting an access token

- Goal: trade `code` for an access token
    - Needs to be included when making API requests
- Why?
    - The user has granted permission for the ID we created on Spotify to access resources
    - But any website could send a user to that URL; client IDs, etc. is public information
    - How can we verify our app uses the client ID we created on Spotify?
- Make a `POST` request with our client's secret code and ask for an access token
- Why `POST` instead of `GET`?
    - `POST` sends contents in the body of an HTTP request (cannot be read by someone watching your web traffic)
    - `GET` sends contents in the URI
- Body of `POST` request requires 3 parameters
    - Grant type (string `authorization_code`)
    - Code (returned as a parameter in the response from the authorization request)
    - Redirect URI (must be the same as before)
- Header of `POST` request requires 2 parameters
    - Authorization (concatenation of client ID and client and client secret, as a Buffer)
    - Encoding (via Content-Type, as `application/x-www-form-urlencoded`)

#### Making the body

```JavaScript
params = new URLSearchParams();
params.append(‘grant_type’, ‘authorization_code’);
```

#### Making the header

```JavaScript
{
    'Content-Type':'application/x-www-form-urlencoded'
    'Authorization': 'Basic ' + Buffer.from(my_client_id + ':' + my_client_secret).toString('base64')
}
```

- Spotify sends back
    - Access token (needed to make API requests)
    - Expires in (TTL)
    - Refresh tokens (used to get a new token when access token expires)
- What to do with these token?
    - Store them in a database for later access

### Making an API requests

- Spotify has endpoints for
    - Artists
    - Albums
    - Tracks
    - and more...
- Often specify a subresource in the URI
    - For a specific album: `https://api.spotify.com/v1/albums/{id}`

### Refresh access token

- Tokens typically expire after a fixed amount of time
    - One hour for spotify tokens
    - After that, all API request will return with code `401` (not authorized)
- A user can use the refresh token to get a new token
- Why do token expire?
    - To allow a user to revoke their privileges

#### Refreshing the token

- Same endpoint as requesting an access token
- Similar parameters; header with encoding and authorization
- Different body parameters
    - `refresh_token` as `grant_type`
    - the token itself as `refresh_token`

## Authorizing from the browser

- Create a link to the authorization point
- Will redirect to your server-side JS
- Once token has been received, redirect to client side JS

## Making API request from the browser

- All web servers speak HTTP
- Make an HTTP request to the server, asking it to make the API request
- It returns the response


