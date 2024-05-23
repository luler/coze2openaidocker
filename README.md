# coze2openaidocker

参考源项目：https://github.com/fatwang2/coze2openai

优化点：

- 直接打包成docker镜像，方便快速部署

# 安装

docker-compose.yml，运行前需要去coze获取指定的机器人ID，登录coze，点击对应的bot，类似下面地址https://www
.coze.com/space/732xxxx652166/bot/7372240xxxxx ，其中bot后面的就是BOT_ID,替换下面的BOT_ID

```
version: '3'
services:
  coze2openai:
    image: ghcr.io/luler/coze2openaidocker:latest
    restart: always
    ports:
      - 15150:3000
    environment:
      - BOT_ID=xxxx
```

运行

```
docker-compose up -d
```

# 访问

可以访问openai类似的chat接口，授权token来自于coze的api token,获取地址：https://www.coze.com/open/api

```
curl http://127.0.0.1:15150/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer coze_api_token" \
  -d '{
    "model": "gpt-4o",
    "messages": [
      {
        "role": "user",
        "content": "你是？"
      }
    ],
    "stream": false
    }'
```