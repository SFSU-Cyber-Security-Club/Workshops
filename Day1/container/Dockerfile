FROM ubuntu:focal 

RUN apt-get update -y && \
    apt-get install -y xinetd && \ 
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*  
        
RUN useradd -m user

COPY app /home/user/              
COPY run.sh /                     
COPY xinetd /etc/xinetd.d/user    

WORKDIR /home/user

RUN chown -R root:root . && \     
    chmod 444 flag.txt ASCIART.txt && \    
    chmod a+x bufferme ld-linux-x86-64.so.2 libc.so.6 && \ 
    chmod +x /run.sh 


EXPOSE 1337                     

CMD ["/usr/sbin/xinetd", "-dontfork"]
