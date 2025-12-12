# 基础镜像：轻量的 Python 3.10
FROM python:3.13-slim

# 避免 Python 输出缓冲，确保日志实时打印
ENV PYTHONUNBUFFERED=1

# 设置工作目录
WORKDIR /app

# 复制依赖清单
COPY requirements.txt .

# 安装依赖（用清华源加速）
RUN pip install --upgrade pip \
    && pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

# 复制所有代码到工作目录
COPY . .

# 暴露端口（和 Flask 运行端口一致）
EXPOSE 5000

# 启动命令
CMD ["python", "app.py"]