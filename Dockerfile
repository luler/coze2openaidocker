# 使用官方Node.js 18 镜像作为基础镜像
FROM node:18

# 安装git
RUN apt-get update && apt-get install -y git

# 设置工作目录
WORKDIR /app

# 克隆项目代码
RUN git clone https://github.com/fatwang2/coze2openai.git .

# 安装 pnpm
RUN npm install -g pnpm

# 安装项目依赖
RUN pnpm install

# 暴露应用运行的端口，假设你的应用在3000端口运行
EXPOSE 3000

# 启动应用
CMD ["pnpm", "start"]