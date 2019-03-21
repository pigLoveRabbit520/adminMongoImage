FROM node:10.15


RUN npm install -g cnpm  --registry=https://registry.npm.taobao.org

# 修改时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir /usr/src/app && cd /usr/src/app &&  git clone https://github.com/mrvautin/adminMongo.git && cd adminMongo && npm install --prod

WORKDIR /usr/src/app/adminMongo

EXPOSE 1234

CMD [ "npm", "start" ]
