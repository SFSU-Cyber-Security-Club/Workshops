FROM ubuntu:focal 

RUN apt-get update -y && \
    apt-get install -y xinetd && \ 
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*  
        
RUN useradd -m user

COPY seccomp /usr/lib/
COPY app /home/user/              
COPY run.sh /                     
COPY xinetd /etc/xinetd.d/user    

WORKDIR /home/user

RUN chown -R root:root . && \     
    chmod 444 oskar && \    
    chmod a+x shellcodeme ld-linux-x86-64.so.2 libc.so.6 && \
    chmod a+x /usr/lib/libseccomp.so.2 && \
    chmod +x /run.sh 


EXPOSE 1337                     

CMD ["/usr/sbin/xinetd", "-dontfork"]
