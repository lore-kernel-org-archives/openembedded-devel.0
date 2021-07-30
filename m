Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.24384.1627652745499516846
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jul 2021 06:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UPUA8OqQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id mt6so15280565pjb.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jul 2021 06:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=ibwKLTM7ypA1mUuKTW8ToWvweTsOm+CW5UA6iZZU/rg=;
        b=UPUA8OqQvcD/nmXMQI16UjjG651R7ubyk35CLXEF3Cy7gfs2IA/MLmlHDw/VWmStXW
         H0EubtVcQOFTbkz1uy0Fx50TrN1KRQIfqKsIjFx3y6Awv6zmbFFp6KmgXjOojvOsgG+3
         cqe4QGHzCxfCgGvwS5cbF/ETrAGW+5X6VHlAM2DMwvCMZJW0oMOqKYknU3ouHxkluUuM
         Hb4o8+3W+ft29l4BDUpQiwTJCECIB20XkPa4rPUinzXrnFAoLc6Mbih/SObvsHK7ez6v
         lV8M75mySoY+WjX452hTGdRkR7p8BVQLtn5GCBGOp1sJJ2OyuGb8m5rFxbTULgN2+HSy
         PkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ibwKLTM7ypA1mUuKTW8ToWvweTsOm+CW5UA6iZZU/rg=;
        b=g3TAOvpXWk0gCQ43+nxFbHQfCDKlzvAdWwrIUvrhdqsjWN1TwcyRlXl8ADQLNdJSdf
         xpwrQW/0VSa9TEKqwfoqZXLOo9PG7L1pCahuIlvO4jR939PaMzGM8ytudnKOgxQ6OWPt
         fD9mRq5WQ1djmHFH9yy9Rb5hwrBmKFGCccwZCshRVtaxj4jg967ifvK9+GkvOGAb5WsE
         UwRlQQciwHSVpRk+4DLMspvnQcQUXdKQZy0q0Wc2u9Ge8ewbVS8N/w9nficr2W3oXwhy
         RgUYGBDXSsi/V3jwSmcRFK5t2lji3Vi69sd8LjpYpi/y1fod1r/Bf4F0FV4Cw5sT3rw+
         nR3w==
X-Gm-Message-State: AOAM532fvH6WM1LU2tLBE+uGpfFtqzHD91z28JIJJ+lBQMEqMWktBv/x
	vr/nXPd4rzDqIZJUkicbnA5xjl9WDef9Vw==
X-Google-Smtp-Source: ABdhPJyMyU/2QVq8cX5oN89p+VoqQWqHxhXCsvUr8pJuyplVgfq7aHJeuOZZkDmefFFoKaPw7+kU1A==
X-Received: by 2002:a17:902:b48c:b029:12c:8cf6:cd17 with SMTP id y12-20020a170902b48cb029012c8cf6cd17mr980898plr.16.1627652744750;
        Fri, 30 Jul 2021 06:45:44 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:ca91:39d9:9a60:f69f? ([2601:202:4180:a5c0:ca91:39d9:9a60:f69f])
        by smtp.gmail.com with ESMTPSA id q16sm1476218pfk.153.2021.07.30.06.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 06:45:44 -0700 (PDT)
Subject: Re: [oe] [meta-oe][hardknott][PATCH] lmdb: add recipe
To: Sakib Sajal <sakib.sajal@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20210729182156.16834-1-sakib.sajal@windriver.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <31c118d9-7c29-e8f0-5f04-80ffacef09af@gmail.com>
Date: Fri, 30 Jul 2021 06:45:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729182156.16834-1-sakib.sajal@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/29/21 11:21 AM, Sakib Sajal wrote:
> lmdb provides a high-performance embedded transactional
> database in the form of a key-value store.
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Adding a new package to a stable branch is not allowed per process.

Your request is denied.

- Armin
> ---
>  meta-oe/recipes-dbs/lmdb/files/run-ptest | 25 +++++++++++++++
>  meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb  | 39 ++++++++++++++++++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 meta-oe/recipes-dbs/lmdb/files/run-ptest
>  create mode 100644 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
>
> diff --git a/meta-oe/recipes-dbs/lmdb/files/run-ptest b/meta-oe/recipes-dbs/lmdb/files/run-ptest
> new file mode 100644
> index 000000000..a6a7549b9
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/lmdb/files/run-ptest
> @@ -0,0 +1,25 @@
> +#!/bin/sh
> +
> +cd tests
> +
> +retval=0
> +for t in mtest*
> +do
> +    mkdir testdb
> +    ./$t > /dev/null && ./mdb_stat testdb > /dev/null
> +    if [ $? -ne 0 ]; then
> +            echo "FAIL: $t"
> +            retval=$(( ${retval} + 1))
> +    else
> +            echo "PASS: $t"
> +    fi
> +    rm -rf testdb
> +done
> +
> +if [ $retval -eq 0 ] ; then
> +    echo "PASS: lmdb"
> +else
> +    echo "FAIL: lmdb"
> +fi
> +
> +exit $retval
> \ No newline at end of file
> diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
> new file mode 100644
> index 000000000..0746da141
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
> @@ -0,0 +1,39 @@
> +# SPDX-FileCopyrightText: 2017-2019 Volker Krause <vkrause@kde.org>
> +# SPDX-FileCopyrightText: 2019 Hannah Kiekens <hannahkiekens@gmail.com>
> +#
> +# SPDX-License-Identifier: MIT
> +
> +SUMMARY = "Lightning Memory-Mapped Database (LMDB)"
> +HOMEPAGE = "https://symas.com/lightning-memory-mapped-database/"
> +LICENSE = "OLDAP-2.8"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972"
> +
> +SRC_URI = "git://github.com/LMDB/lmdb.git;nobranch=1 \
> +           file://run-ptest \
> +"
> +
> +SRCREV = "LMDB_${PV}"
> +
> +inherit base ptest
> +
> +S = "${WORKDIR}/git/libraries/liblmdb"
> +
> +LDFLAGS += "-Wl,-soname,lib${PN}.so.${PV}"
> +
> +do_compile() {
> +    oe_runmake CC="${CC}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}"
> +}
> +
> +do_install() {
> +    oe_runmake CC="${CC}" DESTDIR="${D}" prefix="${prefix}" libprefix="${libdir}" manprefix="${mandir}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}" install
> +    cd ${D}/${libdir}
> +    ln -s liblmdb.so.${PV} liblmdb.so
> +    rm liblmdb.a
> +}
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    for test in mtest mtest2 mtest3 mtest4 mtest5 mdb_stat; do
> +        install -m 755 ${S}/$test ${D}${PTEST_PATH}/tests
> +    done
> +}
>
> 
>

