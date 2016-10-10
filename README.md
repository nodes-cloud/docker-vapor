# Docker Vapor
Different docker templates to get Vapor up and running with docker.

There are different templates:
- Swift 3.X + Vapor toolbox
- Swift 3.X + Vapor toolbox + Local MySQL server
- Swift 3.X + Vapor toolbox + Local Redis server
- Swift 3.X + Vapor toolbox + Local MySQL server + Local Redis server

## How to use them

### Automatic install
This way you can automatically spin up as many docker containers with Vapor code as you want. After answering a few questions, everything is handled automatically.

```
git clone git@github.com:nodes-cloud/docker-vapor.git
```

```
cd docker-vapor
```

Place your vapor code into docker-vapor/code/<NAME>

Run
```
./ncdocker.rb
```

This will ask questions, what template, what code, and it will automatically spin up a Docker machine, it will also automatically use the correct version of Swift from your codebase

### Manual setup
You can also choose to do the setup manually, and by this run the docker commands yourself

```
git clone git@github.com:nodes-cloud/docker-vapor.git
```

```
cd docker-vapor

cd <choosen-template>
```

You need to copy your Vapor code into the /code folder, in the template folder.

```
docker build --build-arg SWIFT_VERSION=<SWIFT-VERSION> -t <NAME> .
```

```
docker run -p 80:8080 -d --name <NAME> <NAME>
```
