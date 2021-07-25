

# dux
> A simple solution for managing webhooks for Dev-Env


## About
Currently `dux` is in development stage.
At present it is an API which provides you global endpoints as `forwards`
<br>
<hr>

## Anatomy of Requests

 ### 1. **Authentication**

For authentication here we have JWT built in for that you need to sign up
it is also done by API as well simply make a post request

 - Endpoint: `/users`
```tree
 Params
    ├── `email`
    ├── `username`
    └── `password`
```
 - Sample:

```curl
  curl \
    --location \
    --request \
    POST 'http://localhost:3000/users?email=funkeyUsername&username=sample@example.com&password=pass-word'
```


#### **Response**

```json
  {
      "data": {
          "id": "44ad73d8-87b8-4e47-a3e4-46f72ac70052",
          "type": "user",
          "attributes": {
              "email": "sample@example.com",
              "username": "funkeyUsername",
              "api_key": "eyJhbGciOiJIUzI1NiJ9.BIG FAT API KEY",
              "created_at": "2021-06-09T18:24:21.969Z"
          }
      }
  }
```
<br>
<hr>

### 2. **Adding Forwards**

Forward consists of two things:
    - `global_url` this is the dux's own hosted url mixed with identifier on which you can send your webhooks.
    - `local_url` this you can set by sending a post request at

 - endpoint: `/forwards/add`
```tree
 Params
    └── `url`
```

 - Sample:
  > **`curl --location --request POST 'http://localhost:3000/forwards/add?url=https://google.com' \
--header 'Authorization: eyJhbGciOiJIUzI1NiJ9.PRETTYLONG API KEY' \
--header 'Cookie: __profilin=p%3Dt'`**


  > **Response**

> ```json
>{
>    "data":{
>        "id":"f94fa966-2ad3-47b3-bbb3-47576baf963f",
>        "type":"forward",
>        "attributes":{
>            "global_url":"http://localhost:3000/forwards/.../direct",
>            "active":true,
>            "created_at":"2021-06-09T17:29:38.357Z"
>        }
>    }
>}

```curl
  curl \
  --location \
  --request \
  POST 'http://localhost:3000/forwards/add?url=https://google.com' \
    --header 'Authorization: eyJhbGciOiJIUzI1NiJ9.PRETTYLONG API KEY' \
    --header 'Cookie: __profilin=p%3Dt'
```


#### **Response**

```json
  {
      "data":{
          "id":"f94fa966-2ad3-47b3-bbb3-47576baf963f",
          "type":"forward",
          "attributes":{
              "global_url":"http://localhost:3000/forwards/5bc2ad83-b0df-41b4-b465-f0ead4110f48/direct",
              "active":true,
              "created_at":"2021-06-09T17:29:38.357Z"
          }
      }
  }
```
<br>
<hr>

### 3. **To-Do:**
* [x] Add Test Cases **WIP** :man_technologist:
* [ ] Implement Responsive Web Views
* [ ] Implement 2FA at View
* [ ] Reduce Query timings
* [ ] Implement Better Request Save
* [ ] Implement Logging for `forward_hooks`
* [ ] Implement Scheduled webhook forwards to `local_url`

[Original Docs](./README.md)
