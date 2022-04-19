FROM pandoc/latex:2.17.1.1-alpine

RUN tlmgr update --self && \
    tlmgr install \
    # File `bxjsarticle.cls' not found.
    bxjscls \
    # File `type1cm.sty' not found.
    type1cm \
    # File `luatexja.sty' not found.
    luatexja \
    # ふぉんと！
    haranoaji

COPY ./configs /opt/configs
COPY ./gen.sh /opt/gen.sh

ENTRYPOINT [ "/opt/gen.sh" ]
