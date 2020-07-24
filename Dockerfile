FROM debian:latest
RUN apt-get update
RUN apt-get install -y texlive-latex-extra
RUN apt-get install -y python
RUN apt-get install -y graphicsmagick

RUN useradd -ms /bin/bash runtime
ADD formula.tex /home/runtime/formula.tex
ADD parse.py /home/runtime/parse.py
ADD init.sh /home/runtime/init.sh
RUN chown -R runtime /home/runtime/*
RUN /bin/bash -c "kpsewhich -a texmf.cnf | xargs -n1 -i sed -i 's|openin_any = a|openin_any = p|' {}"
USER runtime
WORKDIR /home/runtime
ENTRYPOINT ["/home/runtime/init.sh"]
