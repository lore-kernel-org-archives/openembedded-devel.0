Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web12.70431.1629382069583524718
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 07:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CWi+wrnM;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id l3so4626777qtk.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Aug 2021 07:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U9MPOr+GTWu41vmdBX7pN+wMo9gGSSYoMGHm2TfK4nI=;
        b=CWi+wrnMGhIF132CLctX6Dean+tTDxRpdLLwmESIZRVYDJcaiiw4xDm2vFaflCQ72u
         r3WLF9toCy7X7zDVVNo9RMjqSEH6ShXsNjBRbw6V6qMTcALL0ZA2tYwaQC9i+r4DYFWr
         FDJYjcVCw733e3cgYXBr2HBMpKqFjv71tl4/3bEXdXv4ZxAnOX6FkeJHtfmvPUIP7GAt
         RdlEMsMQJCBvwdPWPPfACeGzXBHWPAlI341mtDeYEovYqmOV6JNiBs037iljmdqGJ+or
         Eg7OzZwX7ht4Kqd4VVuYOjvT21fR1jKjwLtjqLESN4DdgPIxGCdQty9C+VNqiBFJBl6j
         YTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U9MPOr+GTWu41vmdBX7pN+wMo9gGSSYoMGHm2TfK4nI=;
        b=EE/y7x6xVhoRo7TuD+ZFbiLQiseoVNaaaHjaALJUyVzn3sMQKPYRbN+rsNhvphr4ZX
         zCKhs69lk4wvL2AOuIly3GlbGqIA8gGR2YYAgUcoZectWStryQt/vCnw+I62t3YlQvxt
         OSfuKkizdK4vXOOzZ/7+HllGodE6ebGsj187vTigZQOGHho+pAxNqYBPQaD8yXlklREF
         zJC7wi/EYSrUDMNZBxrw3qCaOw7YUMLiSYenwBQBZquF62GP3QO1tORDoVP+Ve7ZPksC
         QVssZgldojVxwyNc1yAhMc20It8ZuNw5oPPws2COncgta+tjZL8Bn4Kfgds9ZTPNbu97
         ntWg==
X-Gm-Message-State: AOAM532vkpVxLYSXHzRtKhzinc34PTWETS0bITWjujXRZq9itpe2FxUK
	jQgq0RAdHnQ/iZHEBCbCLkFs+mpicdmgPUk0wh4=
X-Google-Smtp-Source: ABdhPJw8cq/+JMpRshvX0m6nYIHsd6deAgFyXeF1SD3wOJVt0whMPdyjKxTuq5PRmTga5jj7tctbkBWkBx2tmQmkRzE=
X-Received: by 2002:ac8:7d48:: with SMTP id h8mr12726425qtb.299.1629382068611;
 Thu, 19 Aug 2021 07:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <0e9dfbe9-da90-b903-eb0e-dde41f4a6a33@gmail.com>
In-Reply-To: <0e9dfbe9-da90-b903-eb0e-dde41f4a6a33@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 19 Aug 2021 07:07:38 -0700
Message-ID: <CAMKF1spzCG5Kf6zxWLAA-w+sqDfnLzVQ7s0Keax6T88x7FmJkg@mail.gmail.com>
Subject: Re: hardknott merge request: Aug 18th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000067331a05c9ea1381"

--00000000000067331a05c9ea1381
Content-Type: text/plain; charset="UTF-8"

Merged thanks Armin

On Wed, Aug 18, 2021 at 9:23 PM akuster808 <akuster808@gmail.com> wrote:

> The following changes since commit
> 5a4b2ab29d38c02535f24d5308cc40615739f557:
>
>   python3-urllib3: Upgrade 1.26.4 -> 1.26.5 (2021-07-30 16:20:20 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded hardknott-next
>
> for you to fetch changes up to d323115ecd437e397bd504758ba52988900f4747:
>
>   fvwm: Fix build time paths in target perl/python scripts (2021-08-15
> 07:09:56 -0700)
>
> ----------------------------------------------------------------
> Anastasios Kavoukis (1):
>       pm-qa: fix paths for shell scripts
>
> Armin Kuster (1):
>       wireshark: update to 3.4.7
>
> Changqing Li (1):
>       ndpi: fix CVE-2021-36082
>
> Devendra Tewari (1):
>       Suppress eol in functionfs setup scripts (#147)
>
> Gianfranco (1):
>       vboxguestdrivers: upgrade 6.1.22 -> 6.1.24
>
> Joe Slater (1):
>       php: move to version 7.4.21
>
> Kai Kang (1):
>       libdbi-perl: fix CVE-2014-10402
>
> Khem Raj (2):
>       fvwm: Package extra files and man pages
>       fvwm: Fix build time paths in target perl/python scripts
>
> Li Wang (1):
>       openlldp: fix segfault
>
> Michael Opdenacker (1):
>       bigbuckbunny-1080p: fix sample video URL
>
> Mingli Yu (2):
>       mariadb: redefine log-error item
>       mariadb: Update SRC_URI
>
> Paulo Neves (1):
>       htop: Add ncurses-terminfo-base to RDEPENDS
>
> Tony Battersby (3):
>       net-snmp: fix QA Issue after LDFLAGS change
>       curlpp: fix QA Issue after LDFLAGS change
>       ldns: fix QA Issue after LDFLAGS change
>
> Tony Tascioglu (1):
>       redis: fix CVE-2021-32625
>
> wangmy (2):
>       nghttp2: upgrade 1.43.0 -> 1.44.0
>       libtalloc: upgrade 2.3.2 -> 2.3.3
>
>  .../recipes-multimedia/sample-content/bigbuckbunny-1080p.bb     |   2 +-
>  meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb    |   5 +
>  .../openlldp/files/lldp_head-remove-all-references.patch        | 331
> ++++++++++++++++++++++++++++
>  meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb    |   1 +
>  meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb          |   7 +
>  .../libtalloc/{libtalloc_2.3.2.bb => libtalloc_2.3.3.bb}        |   6 +-
>  .../nghttp2/{nghttp2_1.43.0.bb => nghttp2_1.44.0.bb}            |   2 +-
>  .../recipes-support/ntopng/files/CVE-2021-36082.patch           | 116
> ++++++++++
>  meta-networking/recipes-support/ntopng/ndpi_3.4.bb              |   1 +
>  .../wireshark/{wireshark_3.4.6.bb => wireshark_3.4.7.bb}        |   2 +-
>  meta-oe/recipes-dbs/mysql/mariadb.inc                           |   7 +-
>  meta-oe/recipes-dbs/mysql/mariadb/my.cnf                        |   2 +-
>  .../android-tools-conf-configfs/android-gadget-cleanup          |   2 +-
>  .../android-tools-conf-configfs/android-gadget-setup            |   4 +-
>  .../android-tools-conf-configfs/android-gadget-start            |   2 +-
>  meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb                     |   7 +
>  meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch  |  56
> +++++
>  meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb              |   4 +-
>  meta-oe/recipes-devtools/php/{php_7.4.16.bb => php_7.4.21.bb}   |   3 +-
>  meta-oe/recipes-extended/redis/redis/fix-CVE-2021-32625.patch   |  61
> +++++
>  meta-oe/recipes-extended/redis/redis_6.2.2.bb                   |   1 +
>  meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb                     |  23 +-
>  meta-oe/recipes-support/htop/htop_3.0.5.bb                      |   2 +
>  .../vboxguestdrivers/40-linux-5.13-support.patch                | 276
> -----------------------
>  .../{vboxguestdrivers_6.1.22.bb => vboxguestdrivers_6.1.26.bb}  |   6 +-
>  meta-oe/recipes-test/pm-qa/pm-qa_git.bb                         |   3 +-
>  26 files changed, 628 insertions(+), 304 deletions(-)
>  create mode 100644
>
> meta-networking/recipes-protocols/openlldp/files/lldp_head-remove-all-references.patch
>  rename meta-networking/recipes-support/libtalloc/{libtalloc_2.3.2.bb =>
> libtalloc_2.3.3.bb} (91%)
>  rename meta-networking/recipes-support/nghttp2/{nghttp2_1.43.0.bb =>
> nghttp2_1.44.0.bb} (93%)
>  create mode 100644
> meta-networking/recipes-support/ntopng/files/CVE-2021-36082.patch
>  rename meta-networking/recipes-support/wireshark/{wireshark_3.4.6.bb =>
> wireshark_3.4.7.bb} (97%)
>  create mode 100644
> meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch
>  rename meta-oe/recipes-devtools/php/{php_7.4.16.bb => php_7.4.21.bb}
> (99%)
>  create mode 100644
> meta-oe/recipes-extended/redis/redis/fix-CVE-2021-32625.patch
>  delete mode 100644
>
> meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/40-linux-5.13-support.patch
>  rename
> meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.22.bb =>
> vboxguestdrivers_6.1.26.bb} (94%)
>
>

--00000000000067331a05c9ea1381
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Merged thanks Armin</div><div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 18, 2021 at 9:23 PM a=
kuster808 &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The following change=
s since commit 5a4b2ab29d38c02535f24d5308cc40615739f557:<br>
<br>
=C2=A0 python3-urllib3: Upgrade 1.26.4 -&gt; 1.26.5 (2021-07-30 16:20:20 -0=
700)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded" rel=3D"no=
referrer" target=3D"_blank">https://git.openembedded.org/meta-openembedded<=
/a> hardknott-next<br>
<br>
for you to fetch changes up to d323115ecd437e397bd504758ba52988900f4747:<br=
>
<br>
=C2=A0 fvwm: Fix build time paths in target perl/python scripts (2021-08-15=
<br>
07:09:56 -0700)<br>
<br>
----------------------------------------------------------------<br>
Anastasios Kavoukis (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm-qa: fix paths for shell scripts<br>
<br>
Armin Kuster (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wireshark: update to 3.4.7<br>
<br>
Changqing Li (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ndpi: fix CVE-2021-36082<br>
<br>
Devendra Tewari (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Suppress eol in functionfs setup scripts (#1=
47)<br>
<br>
Gianfranco (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vboxguestdrivers: upgrade 6.1.22 -&gt; 6.1.2=
4<br>
<br>
Joe Slater (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 php: move to version 7.4.21<br>
<br>
Kai Kang (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libdbi-perl: fix CVE-2014-10402<br>
<br>
Khem Raj (2):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fvwm: Package extra files and man pages<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fvwm: Fix build time paths in target perl/py=
thon scripts<br>
<br>
Li Wang (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 openlldp: fix segfault<br>
<br>
Michael Opdenacker (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bigbuckbunny-1080p: fix sample video URL<br>
<br>
Mingli Yu (2):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mariadb: redefine log-error item<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mariadb: Update SRC_URI<br>
<br>
Paulo Neves (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 htop: Add ncurses-terminfo-base to RDEPENDS<=
br>
<br>
Tony Battersby (3):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 net-snmp: fix QA Issue after LDFLAGS change<=
br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 curlpp: fix QA Issue after LDFLAGS change<br=
>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ldns: fix QA Issue after LDFLAGS change<br>
<br>
Tony Tascioglu (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 redis: fix CVE-2021-32625<br>
<br>
wangmy (2):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2: upgrade 1.43.0 -&gt; 1.44.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libtalloc: upgrade 2.3.2 -&gt; 2.3.3<br>
<br>
=C2=A0.../recipes-multimedia/sample-content/<a href=3D"http://bigbuckbunny-=
1080p.bb" rel=3D"noreferrer" target=3D"_blank">bigbuckbunny-1080p.bb</a>=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-<br>
=C2=A0meta-networking/recipes-protocols/net-snmp/<a href=3D"http://net-snmp=
_5.9.1.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.1.bb</a>=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +<br>
=C2=A0.../openlldp/files/lldp_head-remove-all-references.patch=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 331<br>
++++++++++++++++++++++++++++<br>
=C2=A0meta-networking/recipes-protocols/openlldp/<a href=3D"http://openlldp=
_1.0.1.bb" rel=3D"noreferrer" target=3D"_blank">openlldp_1.0.1.bb</a>=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +<br>
=C2=A0meta-networking/recipes-support/curlpp/<a href=3D"http://curlpp_0.8.1=
.bb" rel=3D"noreferrer" target=3D"_blank">curlpp_0.8.1.bb</a>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +<br>
=C2=A0.../libtalloc/{<a href=3D"http://libtalloc_2.3.2.bb" rel=3D"noreferre=
r" target=3D"_blank">libtalloc_2.3.2.bb</a> =3D&gt; <a href=3D"http://libta=
lloc_2.3.3.bb" rel=3D"noreferrer" target=3D"_blank">libtalloc_2.3.3.bb</a>}=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-<br>
=C2=A0.../nghttp2/{<a href=3D"http://nghttp2_1.43.0.bb" rel=3D"noreferrer" =
target=3D"_blank">nghttp2_1.43.0.bb</a> =3D&gt; <a href=3D"http://nghttp2_1=
.44.0.bb" rel=3D"noreferrer" target=3D"_blank">nghttp2_1.44.0.bb</a>}=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
2 +-<br>
=C2=A0.../recipes-support/ntopng/files/CVE-2021-36082.patch=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 116<br>
++++++++++<br>
=C2=A0meta-networking/recipes-support/ntopng/<a href=3D"http://ndpi_3.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">ndpi_3.4.bb</a>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +=
<br>
=C2=A0.../wireshark/{<a href=3D"http://wireshark_3.4.6.bb" rel=3D"noreferre=
r" target=3D"_blank">wireshark_3.4.6.bb</a> =3D&gt; <a href=3D"http://wires=
hark_3.4.7.bb" rel=3D"noreferrer" target=3D"_blank">wireshark_3.4.7.bb</a>}=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-<br>
=C2=A0meta-oe/recipes-dbs/mysql/mariadb.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +-<br>
=C2=A0meta-oe/recipes-dbs/mysql/mariadb/my.cnf=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-<br>
=C2=A0.../android-tools-conf-configfs/android-gadget-cleanup=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-<br>
=C2=A0.../android-tools-conf-configfs/android-gadget-setup=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-<br>
=C2=A0.../android-tools-conf-configfs/android-gadget-start=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-<br>
=C2=A0meta-oe/recipes-devtools/ldns/<a href=3D"http://ldns_1.7.1.bb" rel=3D=
"noreferrer" target=3D"_blank">ldns_1.7.1.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +<br>
=C2=A0meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch=C2=A0 =
|=C2=A0 56 +++++<br>
=C2=A0meta-oe/recipes-devtools/perl/<a href=3D"http://libdbi-perl_1.643.bb"=
 rel=3D"noreferrer" target=3D"_blank">libdbi-perl_1.643.bb</a>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 4 +-<br>
=C2=A0meta-oe/recipes-devtools/php/{<a href=3D"http://php_7.4.16.bb" rel=3D=
"noreferrer" target=3D"_blank">php_7.4.16.bb</a> =3D&gt; <a href=3D"http://=
php_7.4.21.bb" rel=3D"noreferrer" target=3D"_blank">php_7.4.21.bb</a>}=C2=
=A0=C2=A0 |=C2=A0=C2=A0 3 +-<br>
=C2=A0meta-oe/recipes-extended/redis/redis/fix-CVE-2021-32625.patch=C2=A0=
=C2=A0 |=C2=A0 61 +++++<br>
=C2=A0meta-oe/recipes-extended/redis/<a href=3D"http://redis_6.2.2.bb" rel=
=3D"noreferrer" target=3D"_blank">redis_6.2.2.bb</a>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +<br>
=C2=A0meta-oe/recipes-graphics/fvwm/<a href=3D"http://fvwm_2.6.9.bb" rel=3D=
"noreferrer" target=3D"_blank">fvwm_2.6.9.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 23 +-<br>
=C2=A0meta-oe/recipes-support/htop/<a href=3D"http://htop_3.0.5.bb" rel=3D"=
noreferrer" target=3D"_blank">htop_3.0.5.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +<br>
=C2=A0.../vboxguestdrivers/40-linux-5.13-support.patch=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 276=
<br>
-----------------------<br>
=C2=A0.../{<a href=3D"http://vboxguestdrivers_6.1.22.bb" rel=3D"noreferrer"=
 target=3D"_blank">vboxguestdrivers_6.1.22.bb</a> =3D&gt; <a href=3D"http:/=
/vboxguestdrivers_6.1.26.bb" rel=3D"noreferrer" target=3D"_blank">vboxguest=
drivers_6.1.26.bb</a>}=C2=A0 |=C2=A0=C2=A0 6 +-<br>
=C2=A0meta-oe/recipes-test/pm-qa/<a href=3D"http://pm-qa_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">pm-qa_git.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-<br>
=C2=A026 files changed, 628 insertions(+), 304 deletions(-)<br>
=C2=A0create mode 100644<br>
meta-networking/recipes-protocols/openlldp/files/lldp_head-remove-all-refer=
ences.patch<br>
=C2=A0rename meta-networking/recipes-support/libtalloc/{<a href=3D"http://l=
ibtalloc_2.3.2.bb" rel=3D"noreferrer" target=3D"_blank">libtalloc_2.3.2.bb<=
/a> =3D&gt;<br>
<a href=3D"http://libtalloc_2.3.3.bb" rel=3D"noreferrer" target=3D"_blank">=
libtalloc_2.3.3.bb</a>} (91%)<br>
=C2=A0rename meta-networking/recipes-support/nghttp2/{<a href=3D"http://ngh=
ttp2_1.43.0.bb" rel=3D"noreferrer" target=3D"_blank">nghttp2_1.43.0.bb</a> =
=3D&gt;<br>
<a href=3D"http://nghttp2_1.44.0.bb" rel=3D"noreferrer" target=3D"_blank">n=
ghttp2_1.44.0.bb</a>} (93%)<br>
=C2=A0create mode 100644<br>
meta-networking/recipes-support/ntopng/files/CVE-2021-36082.patch<br>
=C2=A0rename meta-networking/recipes-support/wireshark/{<a href=3D"http://w=
ireshark_3.4.6.bb" rel=3D"noreferrer" target=3D"_blank">wireshark_3.4.6.bb<=
/a> =3D&gt;<br>
<a href=3D"http://wireshark_3.4.7.bb" rel=3D"noreferrer" target=3D"_blank">=
wireshark_3.4.7.bb</a>} (97%)<br>
=C2=A0create mode 100644<br>
meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch<br>
=C2=A0rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_7.4.16.bb"=
 rel=3D"noreferrer" target=3D"_blank">php_7.4.16.bb</a> =3D&gt; <a href=3D"=
http://php_7.4.21.bb" rel=3D"noreferrer" target=3D"_blank">php_7.4.21.bb</a=
>} (99%)<br>
=C2=A0create mode 100644<br>
meta-oe/recipes-extended/redis/redis/fix-CVE-2021-32625.patch<br>
=C2=A0delete mode 100644<br>
meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/40-linux-5.13-sup=
port.patch<br>
=C2=A0rename<br>
meta-oe/recipes-support/vboxguestdrivers/{<a href=3D"http://vboxguestdriver=
s_6.1.22.bb" rel=3D"noreferrer" target=3D"_blank">vboxguestdrivers_6.1.22.b=
b</a> =3D&gt;<br>
<a href=3D"http://vboxguestdrivers_6.1.26.bb" rel=3D"noreferrer" target=3D"=
_blank">vboxguestdrivers_6.1.26.bb</a>} (94%)<br>
<br>
</blockquote></div></div>

--00000000000067331a05c9ea1381--
