Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.2239.1621712636751785259
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 May 2021 12:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u+fAhhbu;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: wickbergster@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id s22so35322389ejv.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 May 2021 12:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I1qcUM7x5ZDyeXjNCZX3gvybU+utUu0eQaJco7jxT2Q=;
        b=u+fAhhburdhEcdaY+jRogkZp1tFtaRMB1jZXAx1YTWjpzrMaKYvOtykTMbAw8Xd6Sm
         7YEJq96pyJpGXNAQYw4v8LdoHsk7fdhOacoFMkvRFAJbnqIcbwsh34Agz5pTFiFa/7pa
         FtU6tsy6vImZbvY5NYcXvJ6ahl/eH9QGdLKWowPEh2/1apL5LcHZlfgc0yDs1ZcSJR/9
         k591Ce9OJInY/x0guvu2y4/TFcBSamL8a4+Zh5/jmPIkUJxkpwtAvxCMSC4+eEJuIOuW
         oNVprrDZoEeJU7gd0Lh7a/H4zhbJ+Z52Id78QKIpB8MkKLiJj9ZnTeT/d0xpbvEfjld3
         jAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I1qcUM7x5ZDyeXjNCZX3gvybU+utUu0eQaJco7jxT2Q=;
        b=qFiiUACRQciButViQ7q17IvC8EVAWK8W1r9fRajoNSCJVErhWlVH1jF/DtCvPuudCj
         e3nyvLWOjwMZ9WrhHqq8NXEetbDgDweVO8hNU2di4heCv0g7WyyiegpTK2UekSV6miBJ
         cW2uTi+t5Iy2G0cLVGsdwoeHB/a6Vf/sCUKW3VQorD4FaO4hxkEGGuI+2dyZkNDU8xK0
         9oEPfLd+tF5jFFo9pn/ElyiKzJr8k7e0NOU/h7aKtq541q5lmvuKcb6njatB1oJ9oFLd
         BxU1DVkIGRLPARpoZFgJtcmQzBNlW2eb5MPoTGQoJppo0VJb139R9kAY3+KsMlqwK4uw
         QOpQ==
X-Gm-Message-State: AOAM530WWT+nwcmJTl7F2II+N/f8FlsnV4ixIkADgUqFWG8UgBTsj1r7
	pdvuB43Pt0X+XUlChm8hBT8+IuguQYPcmSCUMqU=
X-Google-Smtp-Source: ABdhPJzMK1Cj+gMuzBiAB695mTJJaqfX6zD4YdRrzHSbbAhT/BpYxsWEy2BEXNUa02KrwuaKilk/ouEo6VuPvpoQXjU=
X-Received: by 2002:a17:906:ccde:: with SMTP id ot30mr16467618ejb.353.1621712635185;
 Sat, 22 May 2021 12:43:55 -0700 (PDT)
MIME-Version: 1.0
References: <21dba787-e5dd-bdac-bcf0-1b0ec84e1e77@gmail.com>
In-Reply-To: <21dba787-e5dd-bdac-bcf0-1b0ec84e1e77@gmail.com>
From: "Alexander Vickberg" <wickbergster@gmail.com>
Date: Sat, 22 May 2021 21:43:44 +0200
Message-ID: <CAAxSGfZztRjKVJ5xRSMLY2p1so-L_7tmFdsX1g-4o5hj3qH9-g@mail.gmail.com>
Subject: Re: [oe] Dunfell merge request May 22nd
To: Armin Kuster <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008c4c7d05c2f0656b"

--0000000000008c4c7d05c2f0656b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

It would be nice if hostapd fix d6ef4170747d6668fa940328334055eef3e1e1d6
from master could be included.

Best regards
Alexander Vickberg

Den l=C3=B6r 22 maj 2021 kl 21:06 skrev Armin Kuster <akuster808@gmail.com=
>:

> The following changes since commit
> 2915810edbb6599051e30efb3b7f805665ddcc23:
>
>   ostree: switch from default master branch to main to fix do_fetch
> failure (2021-05-13 21:52:34 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 11eae114522a6befa06c7f4021a83bc016133543:
>
>   linuxptp: Fix cross build (2021-05-14 10:03:51 -0700)
>
> ----------------------------------------------------------------
> Armin Kuster (2):
>       nostromo: Blacklist and exclude from world builds
>       packagegroup-meta-webserver: remove nostromo from pkg grp
>
> Cl=C3=A9ment P=C3=A9ron (1):
>       nodejs: 12.20.2 -> 12.21.0
>
> Khem Raj (1):
>       linuxptp: Fix cross build
>
> Saloni Jain (1):
>       fuse: Whitelisted CVE-2019-14860
>
> Sean Nyekjaer (1):
>       nodejs: 12.20.1 -> 12.20.2
>
>  meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb             |  5
> +++++
>  .../linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch            | 26
> ++++++++++++++++++++++++++
>  .../linuxptp/linuxptp/no-incdefs-using-host-headers.patch       | 29
> -----------------------------
>  meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb           |  7
> ++++---
>  .../nodejs/{nodejs_12.20.1.bb =3D> nodejs_12.21.0.bb}             |  2 =
+-
>  .../recipes-core/packagesgroups/packagegroup-meta-webserver.bb  |  2 +-
>  meta-webserver/recipes-httpd/nostromo/nostromo_1.9.7.bb         |  3 ++=
+
>  7 files changed, 40 insertions(+), 34 deletions(-)
>  create mode 100644
>
> meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-incdefs.=
patch
>  delete mode 100644
>
> meta-oe/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-hea=
ders.patch
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_12.20.1.bb =3D>
> nodejs_12.21.0.bb} (98%)
>
>
>=20
>
>

--0000000000008c4c7d05c2f0656b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br><div>It would be nice if hostapd fix=C2=A0d6ef=
4170747d6668fa940328334055eef3e1e1d6 from master could be included.</div><d=
iv><br></div></div><div>Best regards</div><div>Alexander Vickberg</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Den =
l=C3=B6r 22 maj 2021 kl 21:06 skrev Armin Kuster &lt;<a href=3D"mailto:akus=
ter808@gmail.com">akuster808@gmail.com</a>&gt;:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">The following changes since commit 291581=
0edbb6599051e30efb3b7f805665ddcc23:<br>
<br>
=C2=A0 ostree: switch from default master branch to main to fix do_fetch<b=
r>
failure (2021-05-13 21:52:34 -0700)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded" rel=3D"n=
oreferrer" target=3D"_blank">https://git.openembedded.org/meta-openembedded=
</a> dunfell-next<br>
<br>
for you to fetch changes up to 11eae114522a6befa06c7f4021a83bc016133543:<b=
r>
<br>
=C2=A0 linuxptp: Fix cross build (2021-05-14 10:03:51 -0700)<br>
<br>
----------------------------------------------------------------<br>
Armin Kuster (2):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nostromo: Blacklist and exclude from world =
builds<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-meta-webserver: remove nostrom=
o from pkg grp<br>
<br>
Cl=C3=A9ment P=C3=A9ron (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nodejs: 12.20.2 -&gt; 12.21.0<br>
<br>
Khem Raj (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linuxptp: Fix cross build<br>
<br>
Saloni Jain (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fuse: Whitelisted CVE-2019-14860<br>
<br>
Sean Nyekjaer (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nodejs: 12.20.1 -&gt; 12.20.2<br>
<br>
=C2=A0meta-filesystems/recipes-support/fuse/<a href=3D"http://fuse_2.9.9.b=
b" rel=3D"noreferrer" target=3D"_blank">fuse_2.9.9.bb</a>=C2=A0=C2=A0=C2=A0=
=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +++++<br>
=C2=A0.../linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 26<br>
++++++++++++++++++++++++++<br>
=C2=A0.../linuxptp/linuxptp/no-incdefs-using-host-headers.patch=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 29<br>
-----------------------------<br>
=C2=A0meta-oe/recipes-connectivity/linuxptp/<a href=3D"http://linuxptp_2.0=
.bb" rel=3D"noreferrer" target=3D"_blank">linuxptp_2.0.bb</a>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7<br>
++++---<br>
=C2=A0.../nodejs/{<a href=3D"http://nodejs_12.20.1.bb" rel=3D"noreferrer" =
target=3D"_blank">nodejs_12.20.1.bb</a> =3D&gt; <a href=3D"http://nodejs_12=
.21.0.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_12.21.0.bb</a>}=C2=A0=
=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 2 +-<br>
=C2=A0.../recipes-core/packagesgroups/<a href=3D"http://packagegroup-meta-=
webserver.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-webser=
ver.bb</a>=C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta-webserver/recipes-httpd/nostromo/<a href=3D"http://nostromo_1.9=
.7.bb" rel=3D"noreferrer" target=3D"_blank">nostromo_1.9.7.bb</a>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++<br>
=C2=A07 files changed, 40 insertions(+), 34 deletions(-)<br>
=C2=A0create mode 100644<br>
meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-incdefs.pa=
tch<br>
=C2=A0delete mode 100644<br>
meta-oe/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-heade=
rs.patch<br>
=C2=A0rename meta-oe/recipes-devtools/nodejs/{<a href=3D"http://nodejs_12.=
20.1.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_12.20.1.bb</a> =3D&gt;=
<br>
<a href=3D"http://nodejs_12.21.0.bb" rel=3D"noreferrer" target=3D"_blank">=
nodejs_12.21.0.bb</a>} (98%)<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000008c4c7d05c2f0656b--
