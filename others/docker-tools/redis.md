#### 安装

- 拉取官方镜像

```
docker pull redis
```

- 运行

```
docker run --name dockerredis -p 6379:6379 -d redis redis-server
```

