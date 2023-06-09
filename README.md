# Hi there, I'm Kyrylo.
![example workflow](https://github.com/Hillel-i-Python-Pro-i-2022-12-27/homework__kulyk__kyrylo__hw5/actions/workflows/main-workflow.yml/badge.svg)
### Student [Hillel IT School](https://ithillel.ua/), I am from Odessa.
***
## 📝Basic project on the Django framework
Django reference project to start development of other projects.
***
### ▶️Run
Run homework.
```shell
make homework-i-run
```
### 🗑️Purge
```shell
make homework-i-purge
```
***
## 🛠️Dev
### ⚙️Initialize dev
Install dependencies and register pre-commit.
```shell
make init-dev
```
***
## 🐳Docker
Use services in dockers.
### ▶️Run
Make all actions needed for run homework from zero,  
making migrate
```shell
make d-homework-i-run
```
### ⏹️Stop
Stop services
```shell
make d-stop
```
### 🗑️Purge
Purge all data related with services
```shell
make d-homework-i-purge
```
***
## 🗄 DataBase
### ▶️Run db
Run database for local dev
```shell
make d-run-i-local-dev
```
### 🧳Make migration
Created migration file
```shell
make migrations
```
### 🛫Migrate
Migrate
```shell
make migrate
```
***
## 🐳SuperUser
### 🔩Create
Create superuser with standard parameters (username, password, email)
```shell
make init-dev-i-create-superuser
```
### 🗑️Delete
Delete all SuperUser
```shell
make init-dev-i-delete-superuser
```
***