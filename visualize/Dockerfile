FROM jupyter/scipy-notebook:c411f52fcc93

RUN cd ~ && \
    wget https://github.com/shreyankg/xkcd-desktop/raw/master/Humor-Sans.ttf && \
    mkdir .fonts && \
    cp Humor-Sans.ttf .fonts/ && \
    rm -rf .cache/ && \
    fc-cache 
