-- 
-- HTTP opperations
-- These methods are available to all implementation of the HTTP API
-- For storage implementation-specific methods see their respective file in this directory
--


local http = require("lukkit/http")


-- HTTP RequestOptions
local requestOptions = {
  -- Required, URL of request
  url = "https://api.example.com/blog/newPost" -- Required
  -- Optional, HTTP methods - https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods
  -- Default: "GET"
  method = "POST",
  -- Optional, Table of HTTP headers - https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers
  -- Default: {}
  headers = { 
    "Content-Type" = "application/json",
    "Authorization" = "Basic THVra2l0OmlzIGF3ZXNvbWU="
  },
  -- Optional, body of the request
  -- Default: nil
  body = '{"title":"HTTP in Lukkit","content":"Using HTTP in Lukkit is as simple as..."}',
  -- If large is true body will be a byte stream, use this for images or binary data
  -- Default: false
  -- TODO: explain usage
  binary = false
}

-- Example HttpResponse
local httpResponse = {
  -- HTTP status response code - https://developer.mozilla.org/en-US/docs/Web/HTTP/Response_codes 
  code = 200,
  -- Table of HTTP headers - https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers
  headers = {
    "Date" = "Sun, 07 Jun 2020 01:07:38 GMT",
    "Content-Length" = "648"
    "Content-Type" = "text/html; charset=UTF-8",
  },
  -- Reponse body if RequestOptions.binary is false
  body = "<!doctype html>\n<html>\n<head>\n<title>Example Domain</title>..."
}


-- Creates and executes an HTTP request
-- Returns a response table containing headers and body
-- Parameters:
--  table RequestOptions
-- Errors: INVALID_URL, REQUEST_TIMEOUT
-- Returns: HttpResponse table
local response = http.request(requestOptions)

response.code -- Response int code
response.headers -- Response headers table
response.body -- Response body

-- Shortcut methods to quickly make GET requests
-- Have same errors as http.request
http.get("https://www.example.com") -- Returns body as a string
http.getJson("https://api.example.com/users") -- Returnts body as a table parsed as json

-- Shortcut methods to quickly make POST requests
-- First parameter is URL and second is the POST body
-- Have same errors as http.request
http.post("https://api.example.com/blog/newPost", "some body") -- Returns body as a string
http.postJson("https://api.example.com/blog/newPost", {title = "HTTP in Lukkit") -- Returnts and sends body as a table parsed as json


--
-- Async Requests
-- Asynchronous requests are not made on the main server thread
-- When making async requests, attempting to use lukkit apis may result in errors
--

-- Creates and executes an async HTTP request
-- Returns a response table containing headers and body
-- Parameters:
--  table RequestOptions
--  function Callback listener, one parameter is HttpResponse
-- Errors: INVALID_URL, REQUEST_TIMEOUT
http.request(requestOptions, function(response)
  response.code -- Response int code
  response.headers -- Response headers table
  response.body -- Response body
end)

-- TODO: Should there be shortcut GET and POST methods for Async requests?
-- TODO: Should we have a cookie jar or cookie encoding/decoding?
-- TODO: Url encoding/decoding
-- TODO: WebSockets