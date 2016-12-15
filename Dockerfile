FROM python:2

ENV VER=${VER:-master} \
    REPO=https://github.com/twhtanghk/pam_oauth2 \
    APP=/usr/src/app

WORKDIR $APP

RUN apt-get update && \
    apt-get install -y git ssh libpam0g-dev && \
    apt-get clean && \
    git clone -b $VER $REPO $APP && \
    ln -s /usr/lib/python2.7/plat-x86_64-linux-gnu/_sysconfigdata_nd.py /usr/lib/python2.7/ && \
    pip install -r python/requirements.txt

EXPOSE 22

CMD sshd -D
