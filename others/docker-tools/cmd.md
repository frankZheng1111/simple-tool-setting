#### 停止并移除所有的容器

```
docker stop $(docker ps -q) & docker rm $(docker ps -aq)
```
