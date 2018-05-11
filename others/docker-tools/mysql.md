#### 安装

- 拉取官方镜像

```
docker pull mysql
```

- 运行

```
docker run --name dockermysql -p 3306:3306 -d -e MYSQL_ROOT_PASSWORD=PASSWORD mysql
```

