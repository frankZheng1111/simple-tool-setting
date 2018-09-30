#### 安装

- 拉取官方镜像

```
docker pull memcached
```

- 运行(在45001端口)

```
docker run --name dockermemcached -m 256m -d -p 45001:11211 memcached
```

