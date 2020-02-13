###Как установить Docker на Linux :

Сначала обновляем существующий перечень пакетов:
```
	sudo apt update
```
Затем устанавливаем необходимые пакеты, которые позволяют apt использовать пакеты по HTTPS:
```
	sudo apt install apt-transport-https ca-certificates curl software-properties-common
```
Затем добавляем в свою систему ключ GPG официального репозитория Docker:
```
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
Добавляем репозиторий Docker в список источников пакетов APT:
```
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
```
Затем обновим базу данных пакетов информацией о пакетах Docker из вновь добавленного репозитория:
```
	sudo apt update
```
Далее устанавливаем Docker:
```
    sudo apt install docker-ce -y
```
Чтобы не вводить sudo каждый раз при запуске команды docker, добавьте имя своего пользователя в группу docker:
```
	sudo usermod -aG docker ${USER}
```
Проверим что служба успешно запустилась:
```
    sudo service docker status
```


###Запуск docer-conteiner
```
    docker-compose -f docker-compose.yml up -d --build
```