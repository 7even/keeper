# Keeper

Keeper is a very simple service aimed at tracking the deployments of your
applications. It keeps the information about the project, the environment and
the VCS branch used to deploy.

## Dashboard

The dashboard contains just the bare minimum information about what is currently
deployed on each environment.

![Dashboard](http://files.7vn.io/dashboard.png)
 
## Project page

A project page shows all deployments ever done in the chosen project.

![Project page](http://files.7vn.io/project.png)

## Registering a new deployment

In order to track the deployment process Keeper needs to be notified via a web hook.

Here's an example using [httpie](https://github.com/jakubroztocil/httpie):

``` sh
$ http -fv POST keeper.your-awesome-company.com/api/payload project=github environment=production branch=master
POST /api/payload HTTP/1.1
Accept: */*
Accept-Encoding: gzip, deflate, compress
Content-Length: 51
Content-Type: application/x-www-form-urlencoded; charset=utf-8
Host: keeper.your-awesome-company.com
User-Agent: HTTPie/0.7.2

project=github&environment=production&branch=master

HTTP/1.1 201 Created
Connection: keep-alive
Date: Thu, 05 Mar 2015 23:15:48 GMT
content-type: application/json; charset=utf-8
transfer-encoding: chunked

Created
```

## Setting up

Keeper is a ruby application backed by a PostgreSQL database; therefore it
requires ruby and postgres installed.

The database is created with a couple of commands:

``` sh
$ createdb keeper && psql keeper < db/structure.sql
```

Then run the application with your favorite application server (puma, unicorn,
passenger etc) specifying the database url in an environment variable:

``` sh
LOTUS_ENV=production KEEPER_DATABASE_URL=postgres://user@localhost:5432/keeper rackup
```
