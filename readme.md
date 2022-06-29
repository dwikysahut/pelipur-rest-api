
<p align="center">
  <a href="https://pelipur-apps.herokuapp.com/">
    <img src="https://github.com/dwikysahut/pelipur-web-app/blob/main/src/public/favicon.png" alt="Logo" width=120 height=120>
  </a>
  <h3 align="center">Pelipur</h3>
  <p align="center">
    Bergabung bersama kami untuk Bumi yang lebih sehat → Aplikasi Pelipur dapat diakses <a href="https://pelipur-apps.herokuapp.com/">di sini</a>
  </p>
</p>

## Built With
[![Express.js](https://img.shields.io/badge/Express.js-4.17.1-orange.svg?style=rounded-square)](https://expressjs.com/en/starter/installing.html)
[![Node.js](https://img.shields.io/badge/Node.js-v12.16.2-green.svg?style=rounded-square)](https://nodejs.org/)

## Requirements
1. <a href="https://nodejs.org/en/download/">Node Js</a>
2. database (Mysql)
3. <a href="https://www.getpostman.com/">Postman</a>
4. Web Server (ex. localhost)

## Getting Started

The concept of this application is that there are 2 types of users, namely admin and user. where at login will be distinguished using authorization with JWT, authentication by differentiating roles in the database.
The user and admin have different access rights where only the user can view and select books, while the admin can access the database with CRUD access rights.

In this project I use the Morgan package which serves as recording every request to the server.

admin : pelipurapps@gmail.com 

## How to use
- clone this repository
- npm install
- [Set up .env file](#setup-env)


## Set up .env file
Open .env file on your code editor, and copy paste this code below :
```
HOST_LOCAL=localhost
HOST_DEPLOY=0.0.0.0
PORT=8080

SECRET_KEY=******
REFRESH_TOKEN_SECRET_KEY=********

DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_DATABASE=pelipur_db

SERVICE_MAILER=gmail
SERVICE_EMAIL=pelipurapps@gmail.com
SERVICE_EMAIL_PASSWORD=**********
SERVICE_EMAIL_GENERATE_PASSWORD=**********

  
```
## End Point
# AUTH

base url
* `http://localhost:port/auth`


* `/register`

## Register


### body
    email: ada@gmail.com
    password: asdsads

### response
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

### response
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

### response
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

### response
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

### response
```
{
    "status": 200,
    "message": "Your Password has been sent to your email",
    "data": {}
}
```



# USER


base url
* `http://localhost:8080/users/`

change password

- method:put

* `/:id/password`
### body
    password: dwiky123


### headers
    Authorization: <TOKEN>

### response
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

### response
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

### response
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


# PARTNER / MITRA


base url
* `http://localhost:8080/partners/`

## get all partners

- method: GET

* `/`
### body
   


### headers
    Authorization: <TOKEN>

### response
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

### response
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

### response
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

### response
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

### response
```
{
    "status": 200,
    "message": "Delete Partner Successfully",
    "data": {
        "id": "16"
    }
}
```



# City / Kota


base url
* `http://localhost:8080/cities/`

## get all cities

- method: GET

* `/`
### body
   


### headers
    Authorization: <TOKEN>

### response
```
{
    "status": 200,
    "message": "Get All Cities Successfully",
    "data": [
        {
            "id": 1,
            "kota": "Jakarta"
        },
        {
            "id": 2,
            "kota": "Depok"
        },
        {
            "id": 3,
            "kota": "Tangerang"
        },
        {
            "id": 4,
            "kota": "Bekasi"
        },
        {
            "id": 77,
            "kota": "Malang"
        }
    ]
}
```


## get city by id

- method: GET

* `/:id`
### body
   -


### headers
    Authorization: <TOKEN>

### response
```
{
    "status": 200,
    "message": "Get City Successfully",
    "data": {
        "id": 1,
        "kota": "Jakarta"
    }
}
```


## add city

- method: POST

* `/`
### body
body
   - kota


### headers
    Authorization: <TOKEN>

### response
```
{
    "status": 200,
    "message": "Add City Successfully",
    "data": {
        "id": 80,
        "kota": "Majalengka"
    }
}
```


## edit city

- method: PUT

* `/:id`
### body
body
   - kota


### headers
    Authorization: <TOKEN>

### response
```
{
    "status": 200,
    "message": "Edit City Successfully",
    "data": {
        "id": "80",
        "kota": "majalengka"
    }
}
```


## delete city

- method: DELETE

* `/:id`
### body
-
### headers
    Authorization: <TOKEN>


### response
```
{
    "status": 200,
    "message": "Delete City Successfully",
    "data": {
        "id": "80"
    }
}
```



# Descriptions / Keterangan


base url
* `http://localhost:8080/descriptions`

## get all descriptions

- method: GET

* `/`
### body
   


### headers
    Authorization: <TOKEN>

### response
```
{
    "status": 200,
    "message": "Get All Descriptions Successfully",
    "data": [
        {
            "id": 1,
            "keterangan": "none"
        },
        {
            "id": 2,
            "keterangan": "Ibu Rumah Tangga"
        },
        {
            "id": 3,
            "keterangan": "Pedagang"
        },
        {
            "id": 4,
            "keterangan": "Perusahaan"
        },
        {
            "id": 5,
            "keterangan": "Rumah Makan"
        }
    ]
}
```



# Collections / 


base url
* `http://localhost:8080/collections/`

## get all collections

- method: GET

* `/`
### body
   


### headers
    Authorization: <TOKEN>

### response
```
{
    "status": 200,
    "message": "get All Collections Successfully",
    "data": [
        {
            "id": "HwDJpo7gyvR5CQI1",
            "id_user": "03f2lqMyr8muNcwx",
            "nama_user": "dwikys",
            "no_telp": "13123124124",
            "email_user": "dwikysatriahut@gmail.com",
            "phone_user": "13123124124",
            "tanggal": "2022-05-31T17:00:00.000Z",
            "waktu": "19:56:00",
            "pesan": "asd",
            "alamat": "sdsa",
            "total_minyak": 3,
            "id_status": 2,
            "status": "on process",
            "nama_mitra": "pt coba",
            "date_added": "2022-06-17T12:54:49.000Z",
            "id_kota": 1,
            "kota": "Jakarta",
            "date_updated": "2022-06-27T10:55:25.000Z"
        },
        {
            "id": "XaLV0xidOyja3ZEV",
            "id_user": "03f2lqMyr8muNcwx",
            "nama_user": "dwikys",
            "no_telp": "13123124124",
            "email_user": "dwikysatriahut@gmail.com",
            "phone_user": "13123124124",
            "tanggal": "2022-05-21T17:00:00.000Z",
            "waktu": "20:00:00",
            "pesan": "tolong ambil jam 20:00 keatas",
            "alamat": "jalan malang sekali",
            "total_minyak": 2,
            "id_status": 3,
            "status": "rejected",
            "nama_mitra": "PT Starlax",
            "date_added": "2022-05-25T14:32:13.000Z",
            "id_kota": 2,
            "kota": "Depok",
            "date_updated": "2022-06-24T01:57:49.000Z"
        },
        {
            "id": "ipeXBFBBynxVbh6U",
            "id_user": "rn2g4lL3iy3ycKuK",
            "nama_user": "sweet",
            "no_telp": "8123456",
            "email_user": "sweetpapayahh@gmail.com",
            "phone_user": "8123456",
            "tanggal": "2022-05-21T17:00:00.000Z",
            "waktu": "20:00:00",
            "pesan": "tolong ambil jam 20:00 keatas",
            "alamat": "malang",
            "total_minyak": 2,
            "id_status": 4,
            "status": "completed",
            "nama_mitra": "PT Starlax",
            "date_added": "2022-05-31T13:38:23.000Z",
            "id_kota": 3,
            "kota": "Tangerang",
            "date_updated": "2022-06-27T10:57:16.000Z"
        },
        {
            "id": "cr-y0WvCsxMqSHd8",
            "id_user": "rn2g4lL3iy3ycKuK",
            "nama_user": "sweet",
            "no_telp": "8123456",
            "email_user": "sweetpapayahh@gmail.com",
            "phone_user": "8123456",
            "tanggal": "2022-05-11T17:00:00.000Z",
            "waktu": "01:45:00",
            "pesan": "bismillah",
            "alamat": "bogor",
            "total_minyak": 12,
            "id_status": 4,
            "status": "completed",
            "nama_mitra": "PT Starlax",
            "date_added": "2022-05-31T13:40:25.000Z",
            "id_kota": 3,
            "kota": "Tangerang",
            "date_updated": "2022-06-11T11:38:03.000Z"
        },
    ]
}
```


## get collection by id

- method: GET

* `/users/:id`
### body
   -


### headers
    Authorization: <TOKEN>

### response
```
{
    "status": 200,
    "message": "get Collections by user Successfully",
    "data": [
        {
            "id": "HwDJpo7gyvR5CQI1",
            "nama_user": "dwikys",
            "no_telp": "13123124124",
            "email_user": "dwikysatriahut@gmail.com",
            "tanggal": "2022-05-31T17:00:00.000Z",
            "waktu": "19:56:00",
            "pesan": "asd",
            "alamat": "sdsa",
            "total_minyak": 3,
            "id_status": 2,
            "status": "on process",
            "nama_mitra": "pt coba",
            "date_added": "2022-06-17T12:54:49.000Z",
            "id_kota": 1,
            "kota": "Jakarta",
            "date_updated": "2022-06-27T10:55:25.000Z"
        },
        {
            "id": "XaLV0xidOyja3ZEV",
            "nama_user": "dwikys",
            "no_telp": "13123124124",
            "email_user": "dwikysatriahut@gmail.com",
            "tanggal": "2022-05-21T17:00:00.000Z",
            "waktu": "20:00:00",
            "pesan": "tolong ambil jam 20:00 keatas",
            "alamat": "jalan malang sekali",
            "total_minyak": 2,
            "id_status": 3,
            "status": "rejected",
            "nama_mitra": "PT Starlax",
            "date_added": "2022-05-25T14:32:13.000Z",
            "id_kota": 2,
            "kota": "Depok",
            "date_updated": "2022-06-24T01:57:49.000Z"
        }
    ]
}
```


## add collection

- method: POST

* `/`
### body
 <img width="500" src="./screenshot/Screen Shot 2022-06-29 at 15.33.47.png">


### headers
    Authorization: <TOKEN>

### response
```
{
    "status": 200,
    "message": "post Collection Successfully",
    "data": {
        "tanggal": "2022-05-22",
        "waktu": "20:00",
        "pesan": "tolong ambil jam 20:00 keatas",
        "total_minyak": "2",
        "alamat": "malang",
        "id_kota": "2",
        "id_user": "03f2lqMyr8muNcwx",
        "id": "Cq-PQmP28fjgcnII",
        "id_status": 1,
        "id_mitra": null
    }
}
```


## Confirmation Collection

- method: PUT

* `/confirmation/:id`
### body
body
   - id_mitra
   - id_status


### headers
    Authorization: <TOKEN>

### response
```
{
    "status": 200,
    "message": "confirm Collection Successfully",
    "data": {
        "id": "Cq-PQmP28fjgcnII",
        "id_mitra": "17",
        "id_status": "2"
    }
}
```


## Finish Collection

- method: PUT

* `/confirmation/:id`
### body
body
   - id_status


### headers
    Authorization: <TOKEN>

### response
```
{
    "status": 200,
    "message": "put Collection Successfully",
    "data": {
        "id": "Cq-PQmP28fjgcnII",
        "id_status": "4"
    }
}
```



# Descriptions / Keterangan


base url
* `http://localhost:8080/descriptions`

## get all descriptions

- method: GET

* `/`
### body
   


### headers
    Authorization: <TOKEN>

### response
```
{
    "status": 200,
    "message": "Get All Descriptions Successfully",
    "data": [
        {
            "id": 1,
            "keterangan": "none"
        },
        {
            "id": 2,
            "keterangan": "Ibu Rumah Tangga"
        },
        {
            "id": 3,
            "keterangan": "Pedagang"
        },
        {
            "id": 4,
            "keterangan": "Perusahaan"
        },
        {
            "id": 5,
            "keterangan": "Rumah Makan"
        }
    ]
}
```



# News / Berita

base url
* `http://localhost:8080/news`

## get all news

- method: GET

* `/`
### body
   


### headers
   -

### response
```
{
    "status": 200,
    "message": "Get All News Successfully",
    "data": [
        {
            "id": 1,
            "author": "Bayu Nugraha",
            "title": "Inovasi Pemuda di Malang, Ubah Minyak Goreng Bekas Jadi Bahan Bakar",
            "description": "Limbah rumah tangga yakni minyak jelantah atau bekas minyak goreng diubah menjadi biodisel atau hahan bakar untuk perahu atau kapal nelayan.",
            "url": "https://www.viva.co.id/berita/nasional/1479748-inovasi-pemuda-di-malang-ubah-minyak-goreng-bekas-jadi-bahan-bakar",
            "urlToImage": "https://thumb.viva.co.id/media/frontend/thumbs3/2022/05/30/62945afed800d-alexander-soegio-bersama-wakil-gubernur-jatim-emil-elestianto-dardak_665_374.jpg",
            "publishedAt": "2022-05-30T05:57:34Z",
            "content": "VIVA  Seorang pemuda di Malang, Alexander Soegio (32 tahun) bersama beberapa temannya membuat inovasi untuk mengurangi pencemaran lingkungan. Dia mengubah limbah rumah tangga yakni minyak jelantah at… [+2242 chars]"
        },
        {
            "id": 2,
            "author": "Dusep Malik",
            "title": "Bahlil Bongkar Praktik Standar Ganda pada Isu Lingkungan di WEF 2022",
            "description": "Di gelaran WEF 2022 Bahlil mengatakan kepada seluruh negara di dunia untuk meminta komitmen yang setara dalam upaya penyelamatan lingkungan.",
            "url": "https://www.viva.co.id/berita/bisnis/1478396-bahlil-bongkar-praktik-standar-ganda-pada-isu-lingkungan-di-wef-2022",
            "urlToImage": "https://thumb.viva.co.id/media/frontend/thumbs3/2022/05/25/628da7cd18930-menteri-investasi-kepala-bkpm-bahlil-lahadalia_665_374.jpg",
            "publishedAt": "2022-05-25T03:54:03Z",
            "content": "VIVA  Menteri Investasi/Kepala Badan Koordinasi Penanaman Modal (BKPM), Bahlil Lahadalia, membongkar watak standar ganda yang kerap dilakukan sejumlah negara di dunia, dalam gelaran acara World Econo… [+1241 chars]"
        },
        {
            "id": 3,
            "author": "Krisna Wicaksono",
            "title": "Indodax Gandeng Startup Pengelolaan Sampah, Buat Apa?",
            "description": "Berita Indodax Gandeng Startup Pengelolaan Sampah, Buat Apa? terbaru hari ini 2022-05-25 20:50:33 dari sumber yang terpercaya",
            "url": "https://www.viva.co.id/digital/startup/1478666-indodax-gandeng-startup-pengelolaan-sampah-buat-apa",
            "urlToImage": "https://thumb.viva.co.id/media/frontend/thumbs3/2022/02/21/62136666b22f7-ilustrasi-sampah_665_374.jpg",
            "publishedAt": "2022-05-25T13:50:33Z",
            "content": "VIVA  Salah satu masalah yang dialami oleh semua kota di dunia, yakni sampah. Berdasarkan data yang dihimpun dari Kementerian Lingkungan Hidup dan Kehutanan, total sampah nasional pada tahun lalu men. [+1193 chars]"
        },
        {
            "id": 4,
            "author": "Yunisa Herawati",
            "title": "Toyota Ungkap Kunci Percepatan Pengembangan Mobil Listrik di RI",
            "description": "Berita Toyota Ungkap Kunci Percepatan Pengembangan Mobil Listrik di RI terbaru hari ini 2022-05-25 13:02:02 dari sumber yang terpercaya",
            "url": "https://www.viva.co.id/otomotif/mobil/1478445-toyota-ungkap-kunci-percepatan-pengembangan-mobil-listrik-di-ri",
            "urlToImage": "https://thumb.viva.co.id/media/frontend/thumbs3/2022/04/02/6248188f81038-toyota-kijang-innova-ev-concept_665_374.jpg",
            "publishedAt": "2022-05-25T06:02:02Z",
            "content": "VIVA  Toyota menjadi salah satu pabrikan otomotif yang gencar membantu pemerintah, dalam mengembangkan kendaraan listrik di Indonesia. Berbagai cara mereka lakukan, mulai dari menghadirkan beragam pr. [+1268 chars]"
        },
        {
            "id": 5,
            "author": "Lazuardhi Utama",
            "title": "'Nyawa' Bumi di Tangan Generasi Muda",
            "description": "Isu Planet Bumi yang berkelanjutan dan layak huni harus melekat ke generasi muda. Sebab, mereka yang akan mewarisi kehidupan di Bumi untuk jangka panjang.",
            "url": "https://www.viva.co.id/digital/digilife/1477581-nyawa-bumi-di-tangan-generasi-muda",
            "urlToImage": "https://thumb.viva.co.id/media/frontend/thumbs3/2018/11/29/5bfff01b6475f-planet-bumi_665_374.jpg",
            "publishedAt": "2022-05-23T06:53:01Z",
            "content": "VIVA  Perwakilan anak muda negara-negara anggota G20 atau Youth 20 (Y20) menyerukan pentingnya peran generasi muda mewujudkan Planet Bumi yang berkelanjutan dan layak huni.\r\nCo-Chair Y20 Indonesia 20. [+1011 chars]"
        },
        {
            "id": 6,
            "author": "Siti Ruqoyah",
            "title": "Butuh 14 GW Untuk Capai 23 Persen Energi Terbarukan Tahun 2025",
            "description": "Indonesia hanya akan membangun 10,9 GW pembangkit energi terbarukan hingga 2025. Masih ada kekurangan 3-4 GW untuk mencapai bauran 23%.",
            "url": "https://www.viva.co.id/berita/nasional/1483745-butuh-14-gw-untuk-capai-23-persen-energi-terbarukan-tahun-2025",
            "urlToImage": "https://thumb.viva.co.id/media/frontend/thumbs3/2018/07/13/5b4891b33f96d-ilustrasi-energi-terbarukan_665_374.jpg",
            "publishedAt": "2022-06-10T05:12:12Z",
            "content": "VIVA  Pemerintah melalui Kementerian Energi dan Sumber Daya Mineral (ESDM) telah menerbitkan Peraturan Menteri Nomor 26 Tahun 2021 tentang PLTS Atap yang Terhubung pada Jaringan Tenaga Listrik Pemega. [+2443 chars]"
        },
        {
            "id": 7,
            "author": "Fikri Halim",
            "title": "Kemenko Marves Soroti Dampak Sampah Plastik Bagi Lingkungan",
            "description": "Berita Kemenko Marves Soroti Dampak Sampah Plastik Bagi Lingkungan terbaru hari ini 2022-05-31 16:09:33 dari sumber yang terpercaya",
            "url": "https://www.viva.co.id/berita/bisnis/1480266-kemenko-marves-soroti-dampak-sampah-plastik-bagi-lingkungan",
            "urlToImage": "https://thumb.viva.co.id/media/frontend/thumbs3/2022/04/07/624f12c9eff98-sampah-plastik-di-laut_665_374.jpg",
            "publishedAt": "2022-05-31T09:09:33Z",
            "content": "VIVA  Kementerian Koordinator Bidang Kemaritiman dan Investasi (Kemenko Marves) menaruh perhatian besar pada dampak dari sampah plastik pada lingkungan. Khususnya bagi ekosistem kelautan.\r\nHal itu se. [+1115 chars]"
        },
        {
            "id": 8,
            "author": "Fikri Halim",
            "title": "Dua Solusi yang Bisa Dipertimbangkan untuk Atasi Masalah Minyak Goreng",
            "description": "Salah satunya adalah pengolahan minyak jelantah yang dapat digunakan untuk bahan bakar diesel. Hal ini dinilai bisa mengatai masalah minyak goreng.",
            "url": "https://www.viva.co.id/berita/bisnis/1484386-dua-solusi-yang-bisa-dipertimbangkan-untuk-atasi-masalah-minyak-goreng",
            "urlToImage": "https://thumb.viva.co.id/media/frontend/thumbs3/2022/03/05/62232c8502cb4-warga-mengatre-minyak-goreng-murah-saat-operasi-pasar_665_374.jpg",
            "publishedAt": "2022-06-12T16:38:53Z",
            "content": "VIVA  Dua solusi untuk mengatasi masalah kelangkaan minyak goreng direkomendasikan oleh Chakra Giri Energi Indonesia (CGEI). CGEI merupakan salah satu perusahaan konsultan energi berkelanjutan.\\r\\nSolu… [+3452 chars]"
        },
        {
            "id": 9,
            "author": "Ichsan Suhendra",
            "title": "Pesan Anindya Bakrie untuk Finalis Putri Otonomi Indonesia 2022",
            "description": "12 Finalis Putri Otonomi Indonesia 2022 berkunjung ke redaksi tvOne dan bertemu dengan Presiden Direktur PT Visi Media Asia (VIVA), Anindya Bakrie.",
            "url": "https://www.viva.co.id/gaya-hidup/inspirasi-unik/1485714-pesan-anindya-bakrie-untuk-finalis-putri-otonomi-indonesia-2022",
            "urlToImage": "https://thumb.viva.co.id/media/frontend/thumbs3/2022/06/15/62a9ebdb31702-anindya-bakrie-bersama-finalis-puteri-otonomi-indonesia-2022_665_374.jpeg",
            "publishedAt": "2022-06-15T14:34:26Z",
            "content": "VIVA  Kedua belas finalis Putri Otonomi Indonesia 2022 berkunjung ke redaksi tvOne. Mereka ingin mendengar langsung dari para pelaku usaha dan orang yang bergerak di industri salah satu media terbesa. [+2496 chars]"
        },
        {
            "id": 10,
            "author": "admin",
            "title": "Agar Roda Ekonomi Tetap Berjalan, Wali Kota Probolinggo Ajak Masyarakat Bangkit Dari Pandemi Covid-1",
            "description": "PROBOLINGGO, Jumat (20/5/2022) suaraindonesia-news.com - Wali Kota Probolinggo Habib Hadi Zainal Abidin mengajak masyarakat untuk bangkit bersama-sama dari pandemi Covid-19, sehingga roda\nThe post Agar Roda Ekonomi Tetap Berjalan, Wali Kota Probolinggo Ajak M.",
            "url": "https://suaraindonesia-news.com/agar-roda-ekonomi-tetap-berjalan-wali-kota-probolinggo-ajak-masyarakat-bangkit-dari-pandemi-covid-19/",
            "urlToImage": "https://suaraindonesia-news.com/wp-content/uploads/2022/05/IMG_20220520_192623.jpg",
            "publishedAt": "2022-05-20T12:30:15Z",
            "content": "PROBOLINGGO, Jumat (20/5/2022) suaraindonesia-news.com - Wali Kota Probolinggo Habib Hadi Zainal Abidin mengajak masyarakat untuk bangkit bersama-sama dari pandemi Covid-19, sehingga roda ekonomi tet. [+3755 chars]"
        }
    ]
}
```


# Datas

base url
* `http://localhost:8080/news`

## get all data count

- method: GET

* `/`
### body
   -
### headers
   -

### response
```
{
    "status": 200,
    "message": "Get All Data Count",
    "data": {
        "total_kota": 5,
        "total_mitra": 4,
        "total_pengumpulan": 5,
        "total_user": 14,
        "total_minyak": 21
    }
}
```


## get all collections by month

- method: GET

* `/collections-month`
### body
   -
### headers
   -

### response
```
{
    "status": 200,
    "message": "Get Collections Count By Month successfully",
    "data": [
        {
            "count": 3,
            "month_number": 2027,
            "month": "May/2022"
        },
        {
            "count": 2,
            "month_number": 2028,
            "month": "June/2022"
        }
    ]
}
```


## Related Project
* [`Pelipur-Web-App`](https://github.com/dwikysahut/pelipur-web-app)
