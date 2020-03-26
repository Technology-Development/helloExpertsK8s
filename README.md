The purpose of the various files in this package is to demonstrate the use of Go to produce a simple hello world website and then show how it can be deployed to the various container environments available to run on a local machine.

The hello world example is a very simple one which demonstrates how easy it is to get a dynamic web site or web service up and running in GoLang

An agile approach was used in developing the application with an emphasis on testing.  Inspec is ideal for testing deployments.

It would have been easier to script all of this but I want the user to learn the process.

helloRuby.go is a simple command line program which prints hello ruby to the standard out.

In order to run and test it:
Install go https://golang.org/dl/

Install inspec https://www.inspec.io/downloads/
    I used homebrew and you may need to do the same if you are on mac https://brew.sh/

Inspec will run the simple application and check that the right output is displayed.

`inspec exec helloInspec.rb`

    ✔  Ruby-1.0: Hello Ruby

     ✔  Command: `go run helloRuby.go` stdout should match "hello ruby"

localWeb.go runs a local webserver which shows hello world.

`go run localWeb.go`

In another terminal window:

`inspec exec helloInspec.rb`

    ✔  Ruby-2.0: Hello Ruby Web

     ✔  HTTP GET on http://localhost:8888 status should eq 200
     
     ✔  HTTP GET on http://localhost:8888 body should match "hello Ruby"

Now to the docker version.

```
cd docker

docker image build -t helloEq:2.0 .

docker container run -p 9999:8888 --name hellogo helloeq:2.0

```

In another terminal window 

`inspec exec helloInspec.rb`

```
  ✔  Ruby-3.0: Hello Ruby Docker
     ✔  HTTP GET on http://localhost:9999 status should eq 200
     ✔  HTTP GET on http://localhost:9999 body should match "hello Ruby"
```
Go to http://localhost:9999/ which will show you the container ID the service is running on.

Now to put it in minikube  

You might need to install minikube (I used virtualbox as the host VM hypervisor)

https://kubernetes.io/docs/tasks/tools/install-minikube/

You then need to start up minikube

```
minikube start --vm-driver=virtualbox
```

Create a new kubernetes deployment

```
kubectl create deployment hellogo --image=mted19/helloeq
deployment.apps/hellogo created
```

Create a new service so that we can access the deployment

```
kubectl expose deployment hellogo --type=LoadBalancer --port=8888
service/hellogo exposed
```

Tell minikube to access the service via a browser

```
minikube service hellogo
```
A browser will open and dispay hello Ruby along with the pod ID that the service is running on

Copy the url and paste it into helloInspec.rb in the minikube test

```
  ✔  Ruby-4.0: Hello Ruby Minikube
     ✔  HTTP GET on http://192.168.99.101:30770/ status should eq 200
     ✔  HTTP GET on http://192.168.99.101:30770/ body should match "hello Ruby"
```
