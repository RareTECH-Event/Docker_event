FROM mysql:8.0-debian

RUN mv /etc/apt/sources.list.d/mysql.list /etc/apt/sources.list.d/mysql.list.disabled

RUN apt-get update && apt-get install -y locales
RUN sed -i 's/# ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/' /etc/locale.gen && locale-gen ja_JP.UTF-8

RUN mv /etc/apt/sources.list.d/mysql.list.disabled /etc/apt/sources.list.d/mysql.list

ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
ENV TZ Asia/Tokyo
