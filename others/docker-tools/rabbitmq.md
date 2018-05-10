#### 安装

- 拉取官方镜像

```
docker pull rabbitmq:management
```

- 运行

```
docker run -d --name dockerrabbitmq -p 5671:5671 -p 5672:5672 -p 4369:4369 -p 25672:25672 -p 15671:15671 -p 15672:15672 rabbitmq:management
```

