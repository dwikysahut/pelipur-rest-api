endpoint

register
/auth/register

login
/auth/login

-ubah profile

-lupa password
    - masuk ke email user


pelipurapps@gmail.com 

## Set up .env file
Open .env file on your code editor, and copy paste this code below :
```
HOST_LOCAL=localhost
HOST_DEPLOY=0.0.0.0
PORT=8080

SECRET_KEY=pelipursecret
REFRESH_TOKEN_SECRET_KEY=secretpelipur

DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_DATABASE=pelipur_db

SERVICE_MAILER=gmail
SERVICE_EMAIL=pelipurapps@gmail.com
SERVICE_EMAIL_PASSWORD=emailpelipur4
SERVICE_EMAIL_GENERATE_PASSWORD=cngnumzfpaddlutx

  
```
## End Point
**POST Auth**

base url
* `http://localhost:port/auth`


* `/register`

## Register


### body
    email: ada@gmail.com
    password: asdsads

```
{
    "status": 200,
    "message": "Register Successfully",
    "data": {
        "id": "V0LHxrhRwqdV3yBN",
        "email": "ada@gmail.com",
        "image": "https://ui-avatars.com/api/?size=256&name=user"
    }
}
```

* `/verify`

## Verify email


### body
    email: dwikysatriahut@gmail.com
    kode: <kode pada email>

```
{
    "status": 200,
    "message": "Account Verified",
    "data": {
        "email": "dwikysatriahut@gmail.com",
        "result": {
            "fieldCount": 0,
            "affectedRows": 1,
            "insertId": 0,
            "serverStatus": 34,
            "warningCount": 0,
            "message": "(Rows matched: 1  Changed: 0  Warnings: 0",
            "protocol41": true,
            "changedRows": 0
        }
    }
}
```

## Login
* `/login`

### body
    email: dwikysatriahut@gmail.com
    password: dwiky123

```
{
    "status": 200,
    "message": "login berhasil",
    "data": {
        "id": "J5NX0q54Alvx-Dcd",
        "nama": "dwiky",
        "email": "dwikysatriahut@gmail.com",
        "no_telp": 123123,
        "alamat": null,
        "id_keterangan": 1,
        "id_role": 2,
        "image": "https://ui-avatars.com/api/?size=256&name=user",
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZXN1bHQiOnsiaWQiOiJKNU5YMHE1NEFsdngtRGNkIiwibmFtYSI6ImR3aWt5IiwiZW1haWwiOiJkd2lreXNhdHJpYWh1dEBnbWFpbC5jb20iLCJub190ZWxwIjoxMjMxMjMsImFsYW1hdCI6bnVsbCwiaWRfa2V0ZXJhbmdhbiI6MSwiaWRfcm9sZSI6MiwiaW1hZ2UiOiJodHRwczovL3VpLWF2YXRhcnMuY29tL2FwaS8_c2l6ZT0yNTYmbmFtZT11c2VyIn0sImlhdCI6MTY1MzAyNTc4NiwiZXhwIjoxNjUzMjg0OTg2fQ.1_aERwXJ7YQHr_tvBJpwrM_5n-VExabzL8ymwvXaCEY",
        "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZXN1bHQiOnsiaWQiOiJKNU5YMHE1NEFsdngtRGNkIiwibmFtYSI6ImR3aWt5IiwiZW1haWwiOiJkd2lreXNhdHJpYWh1dEBnbWFpbC5jb20iLCJub190ZWxwIjoxMjMxMjMsImFsYW1hdCI6bnVsbCwiaWRfa2V0ZXJhbmdhbiI6MSwiaWRfcm9sZSI6MiwiaW1hZ2UiOiJodHRwczovL3VpLWF2YXRhcnMuY29tL2FwaS8_c2l6ZT0yNTYmbmFtZT11c2VyIn0sImlhdCI6MTY1MzAyNTc4Nn0.r9bG8ZdRiTx1NipssD1uq-SnmYJay2BayI6nHGFOmko"
    }
}
```

## Refresh token
* `/refresh-token`

### body
    token: <REFRESH TOKEN>


```
{
    "status": 200,
    "message": "Token renew successfully",
    "data": {
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZXN1bHQiOnsiaWQiOiJKNU5YMHE1NEFsdngtRGNkIiwibmFtYSI6ImR3aWt5IiwiZW1haWwiOiJkd2lreXNhdHJpYWh1dEBnbWFpbC5jb20iLCJub190ZWxwIjoxMjMxMjMsImFsYW1hdCI6bnVsbCwiaWRfa2V0ZXJhbmdhbiI6MSwiaWRfcm9sZSI6MiwiaW1hZ2UiOiJodHRwczovL3VpLWF2YXRhcnMuY29tL2FwaS8_c2l6ZT0yNTYmbmFtZT11c2VyIn0sImlhdCI6MTY1MzAyNTgyNiwiZXhwIjoxNjUzMjg1MDI2fQ.UhUgleLuMsgGSYnZU7HLPvSmiA4LqqfcUCbGHDUdWo8",
        "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZXN1bHQiOnsiaWQiOiJKNU5YMHE1NEFsdngtRGNkIiwibmFtYSI6ImR3aWt5IiwiZW1haWwiOiJkd2lreXNhdHJpYWh1dEBnbWFpbC5jb20iLCJub190ZWxwIjoxMjMxMjMsImFsYW1hdCI6bnVsbCwiaWRfa2V0ZXJhbmdhbiI6MSwiaWRfcm9sZSI6MiwiaW1hZ2UiOiJodHRwczovL3VpLWF2YXRhcnMuY29tL2FwaS8_c2l6ZT0yNTYmbmFtZT11c2VyIn0sImlhdCI6MTY1MzAyNTgyNn0.w00h1-1QJoOrQ9yjm4BA7Q7lSHEIALefpOCcEvleBy0"
    }
}
```

## Forgot password
* `/forgot-password`

### body
    email: dwikysatriahut@gmail.com


```
{
    "status": 200,
    "message": "Your Password has been sent to your email",
    "data": {}
}
```



**User**


base url
* `http://localhost:8080/users/`

change password

- method:put

* `/:id/password`
### body
    password: dwiky123


### headers
    Authorization: <TOKEN>


```
{
    "status": 200,
    "message": "password updated successfully",
    "data": {
        "id": "J5NX0q54Alvx-Dcd"
    }
}
```

## Edit Profile

- method:put

* `/:id`
### body
    password: dwiky123


### headers
    Authorization: <TOKEN>


```
{
    "status": 200,
    "message": "update Successfully",
    "data": {
        "id": "J5NX0q54Alvx-Dcd",
        "nama": "dwiky",
        "no_telp": "123123"
    }
}
```

## Get data user by ID

- method:get

* `/:id`
### body
    password: dwiky123


### headers
    Authorization: <TOKEN>


```
{
    "status": 200,
    "message": "get Data user by id successfully",
    "data": [
        {
            "id": "J5NX0q54Alvx-Dcd",
            "nama": "dwiky",
            "email": "dwikysatriahut@gmail.com",
            "no_telp": 123123,
            "alamat": null,
            "id_keterangan": 1,
            "id_role": 2,
            "image": "https://ui-avatars.com/api/?size=256&name=user"
        }
    ]
}
```


**Partner**


base url
* `http://localhost:8080/partners/`

## get all partners

- method: GET

* `/`
### body
   


### headers
    Authorization: <TOKEN>

```
{
    "status": 200,
    "message": "Get All Partners Successfully",
    "data": [
        {
            "id": 1,
            "nama": "PT Starlax",
            "alamat": "Green Sedayu Bizpark Blok DM Boulevard No.2 Jl.Daan Mogot KM.18 Kali Deres - Jakarta Barat",
            "email": "Admin@starlax.net",
            "date_added": "2022-05-20T12:53:33.000Z",
            "date_updated": "2022-05-21T13:19:21.000Z",
            "image": "image-1653139161490.png"
        }
    ]
}
```


## get partner by id

- method: GET

* `/:id`
### body
   -


### headers
    Authorization: <TOKEN>

```
{
    "status": 200,
    "message": "Get Partner Successfully",
    "data": {
        "id": 1,
        "nama": "PT Starlax",
        "alamat": "Green Sedayu Bizpark Blok DM Boulevard No.2 Jl.Daan Mogot KM.18 Kali Deres - Jakarta Barat",
        "email": "Admin@starlax.net",
        "date_added": "2022-05-20T12:53:33.000Z",
        "date_updated": "2022-05-21T13:19:21.000Z",
        "image": "image-1653139161490.png"
    }
}
```


## add partner

- method: POST

* `/`
### body
form data
   - nama
   - alamat
   - email
   - image


### headers
    Authorization: <TOKEN>

```
{
    "status": 200,
    "message": "Add Partner Successfully",
    "data": {
        "id": 16,
        "nama": "pt coba",
        "alamat": "malang",
        "email": "coba@gmail.com",
        "image": "image-1653145533061.jpeg"
    }
}
```


## edit partner

- method: PUT

* `/:id`
### body
form data
min 1 body

   - nama
   - alamat
   - email
   - image


### headers
    Authorization: <TOKEN>

```
{
    "status": 200,
    "message": "Edit Partner Successfully",
    "data": {
        "id": "16",
        "nama": "PT Starlax",
        "image": "image-1653145560084.png"
    }
}
```


## delete partner

- method: DELETE

* `/:id`
### body
-
### headers
    Authorization: <TOKEN>

```
{
    "status": 200,
    "message": "Delete Partner Successfully",
    "data": {
        "id": "16"
    }
}
```