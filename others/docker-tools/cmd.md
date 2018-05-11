#### 停止并移除所有的容器

```
docker stop $(docker ps -q) & docker rm $(docker ps -aq)
```

#### 进入容器

```
docker exec -it CONTAINER_ID SHELL(sh, bash。。。)
```

#### 拷贝文件

```
docker cp LOCALPATH CONTAINER:CONTAINER_PATH
```
