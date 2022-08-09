# README

## 开发配置

### 数据库创建，在 cmd 里运行

```
docker run -d      --name db-for-peach      -e POSTGRES_USER=peach      -e POSTGRES_PASSWORD=123456      -e POSTGRES_DB=peach_dev      -e PGDATA=/var/lib/postgresql/data/pgdata      -v peach-data:/var/lib/postgresql/data      --network=network1      postgres:14
```

或者使用

```
docker start db-for-peach
```
