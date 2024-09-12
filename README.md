[**VeighNa发布v3.7.0 - 量化交易容器解决方案VeighNa Docker！**](https://www.vnpy.com/forum/topic/31812-veighnafa-bu-v3-7-0-liang-hua-jiao-yi-rong-qi-jie-jue-fang-an-veighna-docker)

```
docker run -d --name notebook -u root \
  -v ~/notebook_home_jovyan:/home/jovyan \
  -e JUPYTER_TOKEN=i-want-money \
  -p 10000:8888 \
  yanhao98/jupyter-vnpy:latest
```

```
docker run -d --name notebook -u root \
  -v ~/notebook_home_jovyan:/home/jovyan \
  -e JUPYTER_TOKEN=i-want-money \
  -p 10000:8888 \
  quay.io/jupyter/all-spark-notebook
```