Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66FCC433EF
	for <webhook@archiver.kernel.org>; Sun, 26 Sep 2021 23:49:21 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web12.24707.1632700161248080836
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Sep 2021 16:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YvCnN0Lu;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id 72so34763546qkk.7
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Sep 2021 16:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jaTprrgYJhWIvYTJLvFj5JT57LbdQ3WDuvH8hB8ioxE=;
        b=YvCnN0LulzzNQ7FZyItAGGTNRxqrPoPcMvQUUbJR2bOzYxcHHDlJ9N6aoNW6TyJvVl
         D/cpF5G/Toy8GQBkuwCo7Ts+cWJTVj4eJcIgsW4YnABN3PtCHjCkOkqV353FpweQa5ed
         cS42jJIIpSEFfkGszue1QM1EhScFfbycMBQVtJY/QteK+YE1vx2rQ4VNRqyq2YF8l6M6
         Nu5KVh4KAVeY6MMIK5MZotMzuMv3n7R7708cZfSFO5cMkeM27eFdqi5MWzF1KXPHlEMd
         XLg3j55V2Uc6wjq1Ye3wxOlm9kpGGo3u4C7Ue3a0mLEgZMoHoHB/EqSEwQ2Wwqv8BDTV
         nD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jaTprrgYJhWIvYTJLvFj5JT57LbdQ3WDuvH8hB8ioxE=;
        b=BXvfgbQHAgHPeFOhzXp1exqR2+mAyaMvmQuN9fjO2xQ8wRNcJ5uUmEU8Q3H3mVEbfD
         iWcKjxcp522I3G9ymVPP0KIgWkivqpzCOBMk2XX2+oJ/UX+DBdJb4VczkEuX0JNNbW4r
         AAQGMtorAwjwVSZXL8jlZHXzPM7u0cbHAOidJqnDiTbWHmDgWXQLz8H3eViKUPI1nzmK
         53GGQjDNZ5MkD3bHs79aM3ipGdnMgR73n4Ko+45Ml/VuAI6lXneNizimNiFRCyPv5ljW
         0IEsESvrrep792NO2C292jtp+Nr6yFpHIWsfFFV4MCFYTZQRrmmSrYGxjELiuX35GaEV
         d6GA==
X-Gm-Message-State: AOAM533RmlzSiNhM94I39Qvhg1Xyw1zdI4tBFpJUiY4bMPbfdYh+vY9u
	lpAKTWPdk2oxyRqRFS3qADg/YohoDZcg3dHT4Lg=
X-Google-Smtp-Source: 
 ABdhPJwhMBPI5JxD9vXZSm4/5U5ic2cOvQlIrGSYwmjfuFAc9NT8CIJRCSLdeWW/tjilfzII9TvfVFFh0XlvXY3LGIA=
X-Received: by 2002:a37:48f:: with SMTP id 137mr21322874qke.105.1632700160295;
 Sun, 26 Sep 2021 16:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210926221001.1834800-1-akuster808@gmail.com>
In-Reply-To: <20210926221001.1834800-1-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Sep 2021 16:49:09 -0700
Message-ID: 
 <CAMKF1spy19ixoDXn4CyKXeRYydbADXDz_s2=zeqVjsueu2-dtQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] README: update to main repo
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001446ce05cceea148"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Sep 2021 23:49:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93132

--0000000000001446ce05cceea148
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 26, 2021 at 3:10 PM Armin Kuster <akuster808@gmail.com> wrote:

> The main repo is sourced from git://git.openembedded.org not github.


I think we wanted to load balance cloning IIRC that=E2=80=99s why it pointe=
d to
GitHub repo but I guess making it consistent it still better

>
> Don't think oe-core.git exists.
>
> Lets be constent across all sub layers.
>
> Drop Revisions and Prioriiy from repo references as they are not used.
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-gnome/README      | 6 ++----
>  meta-initramfs/README  | 3 +--
>  meta-multimedia/README | 6 ++----
>  meta-networking/README | 9 +++------
>  meta-oe/README         | 1 -
>  meta-perl/README       | 2 --
>  meta-python/README     | 2 --
>  meta-webserver/README  | 6 ++----
>  meta-xfce/README       | 7 +++----
>  9 files changed, 13 insertions(+), 29 deletions(-)
>
> diff --git a/meta-gnome/README b/meta-gnome/README
> index 1a91050004..fbb0d72476 100644
> --- a/meta-gnome/README
> +++ b/meta-gnome/README
> @@ -2,13 +2,11 @@ Dependencies
>  ------------
>  This layer depends on:
>
> -URI: git://github.com/openembedded/oe-core.git
> +URI: git://git.openembedded.org/openembedded-core
>  branch: master
> -revision: HEAD
>
> -URI: git://github.com/openembedded/meta-oe.git
> +URI: git://git.openembedded.org/meta-openembedded
>  branch: master
> -revision: HEAD
>
>  Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-gnome]' in the subject'
>
> diff --git a/meta-initramfs/README b/meta-initramfs/README
> index a8f17ba859..119293a741 100644
> --- a/meta-initramfs/README
> +++ b/meta-initramfs/README
> @@ -11,9 +11,8 @@ Dependencies
>
>  This layer depends on:
>
> -URI: git://github.com/openembedded/oe-core.git
> +URI: git://git.openembedded.org/meta-openembedded
>  branch: master
> -revision: HEAD
>
>
>  Maintenance
> diff --git a/meta-multimedia/README b/meta-multimedia/README
> index 9c649ff87c..235c34331b 100644
> --- a/meta-multimedia/README
> +++ b/meta-multimedia/README
> @@ -1,13 +1,11 @@
>  This layer depends on:
>
> -URI: git://github.com/openembedded/oe-core.git
> +URI: git://git.openembedded.org/openembedded-core
>  branch: master
> -revision: HEAD
>
> -URI: git://github.com/openembedded/meta-oe.git
> +URI: git://git.openembedded.org/meta-openembedded
>  layers: meta-oe
>  branch: master
> -revision: HEAD
>
>  Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-multimedia]' in the subject
>
> diff --git a/meta-networking/README b/meta-networking/README
> index e1ba27d83b..1aea8a6613 100644
> --- a/meta-networking/README
> +++ b/meta-networking/README
> @@ -17,21 +17,18 @@ Dependencies
>
>  This layer depends on:
>
> -URI: git://github.com/openembedded/openembedded-core.git
> +URI: git://git.openembedded.org/openembedded-core
>  branch: master
> -revision: HEAD
>
>  For some recipes, the meta-oe layer is required:
>
> -URI: git://github.com/openembedded/meta-openembedded.git
> +URI: git://git.openembedded.org/meta-openembedded
>  subdirectory: meta-oe
>  branch: master
> -revision: HEAD
>
> -URI: git://github.com/openembedded/meta-openembedded.git
> +URI: git://git.openembedded.org/meta-openembedded
>  subdirectory: meta-python
>  branch: master
> -revision: HEAD
>
>  Maintenance
>  -----------
> diff --git a/meta-oe/README b/meta-oe/README
> index 98f671d7c2..bf17415391 100644
> --- a/meta-oe/README
> +++ b/meta-oe/README
> @@ -5,7 +5,6 @@ This layer depends on:
>
>  URI: git://github.com/openembedded/openembedded-core.git
>  branch: master
> -revision: HEAD
>
>  luajit recipe requires host compiler to be able to generate 32bit code
> when target is 32bit
>  e.g. arm, so ensure that $CC -m32 is functional on build host, if
> building this recipe, needed
> diff --git a/meta-perl/README b/meta-perl/README
> index c519dff524..13014b0ff3 100644
> --- a/meta-perl/README
> +++ b/meta-perl/README
> @@ -53,8 +53,6 @@ This layer depends on:
>
>    URI: git://git.openembedded.org/openembedded-core
>    branch: master
> -  revision: HEAD
> -  prio: default
>
>  Adding the meta-perl layer to your build
>  ---------------------------------------
> diff --git a/meta-python/README b/meta-python/README
> index df6abe0e2e..194bac39c7 100644
> --- a/meta-python/README
> +++ b/meta-python/README
> @@ -14,12 +14,10 @@ The meta-python layer depends on:
>         URI: git://git.openembedded.org/openembedded-core
>         layers: meta
>         branch: master
> -       revision: HEAD
>
>         URI: git://git.openembedded.org/meta-openembedded
>         layers: meta-oe
>         branch: master
> -       revision: HEAD
>
>  Please follow the recommended setup procedures of your OE distribution.
>  For Angstrom that is:
> diff --git a/meta-webserver/README b/meta-webserver/README
> index 7b60630700..d23f6cc65c 100644
> --- a/meta-webserver/README
> +++ b/meta-webserver/README
> @@ -11,17 +11,15 @@ Dependencies
>
>  This layer depends on:
>
> -URI: git://github.com/openembedded/oe-core.git
> +URI: git://git.openembedded.org/openembedded-core
>  subdirectory: meta
>  branch: master
> -revision: HEAD
>
>  For some recipes, the meta-oe layer is required:
>
> -URI: git://github.com/openembedded/meta-oe.git
> +URI: git://git.openembedded.org/meta-openembedded
>  subdirectory: meta-oe
>  branch: master
> -revision: HEAD
>
>
>
> diff --git a/meta-xfce/README b/meta-xfce/README
> index bbf4b2edf2..1e9acc471d 100644
> --- a/meta-xfce/README
> +++ b/meta-xfce/README
> @@ -1,12 +1,11 @@
>  This layer depends on:
>
> -URI: git://github.com/openembedded/oe-core.git
> +URI: git://git.openembedded.org/openembedded-core
>  branch: master
> -revision: HEAD
>
> -URI: git://github.com/openembedded/meta-oe.git
> +URI: git://git.openembedded.org/meta-openembedded
>  branch: master
> -revision: HEAD
> +
>  meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this
> repository.
>
>  To avoid dependencies on meta-multimedia you need to mask recipes by
> adding
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93131):
> https://lists.openembedded.org/g/openembedded-devel/message/93131
> Mute This Topic: https://lists.openembedded.org/mt/85888414/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001446ce05cceea148
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Sep 26, 2021 at 3:10 PM Armin Kuster &lt;<a href=3D=
"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">The main repo is sourced from git://<a href=
=3D"http://git.openembedded.org" rel=3D"noreferrer" target=3D"_blank">git.o=
penembedded.org</a> not github.</blockquote><div dir=3D"auto"><br></div><di=
v dir=3D"auto">I think we wanted to load balance cloning IIRC that=E2=80=99=
s why it pointed to GitHub repo but I guess making it consistent it still b=
etter=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
Don&#39;t think oe-core.git exists.<br>
<br>
Lets be constent across all sub layers.<br>
<br>
Drop Revisions and Prioriiy from repo references as they are not used.<br>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com" tar=
get=3D"_blank">akuster808@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-gnome/README=C2=A0 =C2=A0 =C2=A0 | 6 ++----<br>
=C2=A0meta-initramfs/README=C2=A0 | 3 +--<br>
=C2=A0meta-multimedia/README | 6 ++----<br>
=C2=A0meta-networking/README | 9 +++------<br>
=C2=A0meta-oe/README=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta-perl/README=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 --<br>
=C2=A0meta-python/README=C2=A0 =C2=A0 =C2=A0| 2 --<br>
=C2=A0meta-webserver/README=C2=A0 | 6 ++----<br>
=C2=A0meta-xfce/README=C2=A0 =C2=A0 =C2=A0 =C2=A0| 7 +++----<br>
=C2=A09 files changed, 13 insertions(+), 29 deletions(-)<br>
<br>
diff --git a/meta-gnome/README b/meta-gnome/README<br>
index 1a91050004..fbb0d72476 100644<br>
--- a/meta-gnome/README<br>
+++ b/meta-gnome/README<br>
@@ -2,13 +2,11 @@ Dependencies<br>
=C2=A0------------<br>
=C2=A0This layer depends on:<br>
<br>
-URI: git://<a href=3D"http://github.com/openembedded/oe-core.git" rel=3D"n=
oreferrer" target=3D"_blank">github.com/openembedded/oe-core.git</a><br>
+URI: git://<a href=3D"http://git.openembedded.org/openembedded-core" rel=
=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedded-core</a=
><br>
=C2=A0branch: master<br>
-revision: HEAD<br>
<br>
-URI: git://<a href=3D"http://github.com/openembedded/meta-oe.git" rel=3D"n=
oreferrer" target=3D"_blank">github.com/openembedded/meta-oe.git</a><br>
+URI: git://<a href=3D"http://git.openembedded.org/meta-openembedded" rel=
=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openembedded</a=
><br>
=C2=A0branch: master<br>
-revision: HEAD<br>
<br>
=C2=A0Send pull requests to <a href=3D"mailto:openembedded-devel@lists.open=
embedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</=
a> with &#39;[meta-gnome]&#39; in the subject&#39;<br>
<br>
diff --git a/meta-initramfs/README b/meta-initramfs/README<br>
index a8f17ba859..119293a741 100644<br>
--- a/meta-initramfs/README<br>
+++ b/meta-initramfs/README<br>
@@ -11,9 +11,8 @@ Dependencies<br>
<br>
=C2=A0This layer depends on:<br>
<br>
-URI: git://<a href=3D"http://github.com/openembedded/oe-core.git" rel=3D"n=
oreferrer" target=3D"_blank">github.com/openembedded/oe-core.git</a><br>
+URI: git://<a href=3D"http://git.openembedded.org/meta-openembedded" rel=
=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openembedded</a=
><br>
=C2=A0branch: master<br>
-revision: HEAD<br>
<br>
<br>
=C2=A0Maintenance<br>
diff --git a/meta-multimedia/README b/meta-multimedia/README<br>
index 9c649ff87c..235c34331b 100644<br>
--- a/meta-multimedia/README<br>
+++ b/meta-multimedia/README<br>
@@ -1,13 +1,11 @@<br>
=C2=A0This layer depends on:<br>
<br>
-URI: git://<a href=3D"http://github.com/openembedded/oe-core.git" rel=3D"n=
oreferrer" target=3D"_blank">github.com/openembedded/oe-core.git</a><br>
+URI: git://<a href=3D"http://git.openembedded.org/openembedded-core" rel=
=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedded-core</a=
><br>
=C2=A0branch: master<br>
-revision: HEAD<br>
<br>
-URI: git://<a href=3D"http://github.com/openembedded/meta-oe.git" rel=3D"n=
oreferrer" target=3D"_blank">github.com/openembedded/meta-oe.git</a><br>
+URI: git://<a href=3D"http://git.openembedded.org/meta-openembedded" rel=
=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openembedded</a=
><br>
=C2=A0layers: meta-oe<br>
=C2=A0branch: master<br>
-revision: HEAD<br>
<br>
=C2=A0Send pull requests to <a href=3D"mailto:openembedded-devel@lists.open=
embedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</=
a> with &#39;[meta-multimedia]&#39; in the subject<br>
<br>
diff --git a/meta-networking/README b/meta-networking/README<br>
index e1ba27d83b..1aea8a6613 100644<br>
--- a/meta-networking/README<br>
+++ b/meta-networking/README<br>
@@ -17,21 +17,18 @@ Dependencies<br>
<br>
=C2=A0This layer depends on:<br>
<br>
-URI: git://<a href=3D"http://github.com/openembedded/openembedded-core.git=
" rel=3D"noreferrer" target=3D"_blank">github.com/openembedded/openembedded=
-core.git</a><br>
+URI: git://<a href=3D"http://git.openembedded.org/openembedded-core" rel=
=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedded-core</a=
><br>
=C2=A0branch: master<br>
-revision: HEAD<br>
<br>
=C2=A0For some recipes, the meta-oe layer is required:<br>
<br>
-URI: git://<a href=3D"http://github.com/openembedded/meta-openembedded.git=
" rel=3D"noreferrer" target=3D"_blank">github.com/openembedded/meta-openemb=
edded.git</a><br>
+URI: git://<a href=3D"http://git.openembedded.org/meta-openembedded" rel=
=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openembedded</a=
><br>
=C2=A0subdirectory: meta-oe<br>
=C2=A0branch: master<br>
-revision: HEAD<br>
<br>
-URI: git://<a href=3D"http://github.com/openembedded/meta-openembedded.git=
" rel=3D"noreferrer" target=3D"_blank">github.com/openembedded/meta-openemb=
edded.git</a><br>
+URI: git://<a href=3D"http://git.openembedded.org/meta-openembedded" rel=
=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openembedded</a=
><br>
=C2=A0subdirectory: meta-python<br>
=C2=A0branch: master<br>
-revision: HEAD<br>
<br>
=C2=A0Maintenance<br>
=C2=A0-----------<br>
diff --git a/meta-oe/README b/meta-oe/README<br>
index 98f671d7c2..bf17415391 100644<br>
--- a/meta-oe/README<br>
+++ b/meta-oe/README<br>
@@ -5,7 +5,6 @@ This layer depends on:<br>
<br>
=C2=A0URI: git://<a href=3D"http://github.com/openembedded/openembedded-cor=
e.git" rel=3D"noreferrer" target=3D"_blank">github.com/openembedded/openemb=
edded-core.git</a><br>
=C2=A0branch: master<br>
-revision: HEAD<br>
<br>
=C2=A0luajit recipe requires host compiler to be able to generate 32bit cod=
e when target is 32bit<br>
=C2=A0e.g. arm, so ensure that $CC -m32 is functional on build host, if bui=
lding this recipe, needed<br>
diff --git a/meta-perl/README b/meta-perl/README<br>
index c519dff524..13014b0ff3 100644<br>
--- a/meta-perl/README<br>
+++ b/meta-perl/README<br>
@@ -53,8 +53,6 @@ This layer depends on:<br>
<br>
=C2=A0 =C2=A0URI: git://<a href=3D"http://git.openembedded.org/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedd=
ed-core</a><br>
=C2=A0 =C2=A0branch: master<br>
-=C2=A0 revision: HEAD<br>
-=C2=A0 prio: default<br>
<br>
=C2=A0Adding the meta-perl layer to your build<br>
=C2=A0---------------------------------------<br>
diff --git a/meta-python/README b/meta-python/README<br>
index df6abe0e2e..194bac39c7 100644<br>
--- a/meta-python/README<br>
+++ b/meta-python/README<br>
@@ -14,12 +14,10 @@ The meta-python layer depends on:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 URI: git://<a href=3D"http://git.openembedded.o=
rg/openembedded-core" rel=3D"noreferrer" target=3D"_blank">git.openembedded=
.org/openembedded-core</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 layers: meta<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 branch: master<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0revision: HEAD<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 URI: git://<a href=3D"http://git.openembedded.o=
rg/meta-openembedded" rel=3D"noreferrer" target=3D"_blank">git.openembedded=
.org/meta-openembedded</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 layers: meta-oe<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 branch: master<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0revision: HEAD<br>
<br>
=C2=A0Please follow the recommended setup procedures of your OE distributio=
n.<br>
=C2=A0For Angstrom that is:<br>
diff --git a/meta-webserver/README b/meta-webserver/README<br>
index 7b60630700..d23f6cc65c 100644<br>
--- a/meta-webserver/README<br>
+++ b/meta-webserver/README<br>
@@ -11,17 +11,15 @@ Dependencies<br>
<br>
=C2=A0This layer depends on:<br>
<br>
-URI: git://<a href=3D"http://github.com/openembedded/oe-core.git" rel=3D"n=
oreferrer" target=3D"_blank">github.com/openembedded/oe-core.git</a><br>
+URI: git://<a href=3D"http://git.openembedded.org/openembedded-core" rel=
=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedded-core</a=
><br>
=C2=A0subdirectory: meta<br>
=C2=A0branch: master<br>
-revision: HEAD<br>
<br>
=C2=A0For some recipes, the meta-oe layer is required:<br>
<br>
-URI: git://<a href=3D"http://github.com/openembedded/meta-oe.git" rel=3D"n=
oreferrer" target=3D"_blank">github.com/openembedded/meta-oe.git</a><br>
+URI: git://<a href=3D"http://git.openembedded.org/meta-openembedded" rel=
=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openembedded</a=
><br>
=C2=A0subdirectory: meta-oe<br>
=C2=A0branch: master<br>
-revision: HEAD<br>
<br>
<br>
<br>
diff --git a/meta-xfce/README b/meta-xfce/README<br>
index bbf4b2edf2..1e9acc471d 100644<br>
--- a/meta-xfce/README<br>
+++ b/meta-xfce/README<br>
@@ -1,12 +1,11 @@<br>
=C2=A0This layer depends on:<br>
<br>
-URI: git://<a href=3D"http://github.com/openembedded/oe-core.git" rel=3D"n=
oreferrer" target=3D"_blank">github.com/openembedded/oe-core.git</a><br>
+URI: git://<a href=3D"http://git.openembedded.org/openembedded-core" rel=
=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedded-core</a=
><br>
=C2=A0branch: master<br>
-revision: HEAD<br>
<br>
-URI: git://<a href=3D"http://github.com/openembedded/meta-oe.git" rel=3D"n=
oreferrer" target=3D"_blank">github.com/openembedded/meta-oe.git</a><br>
+URI: git://<a href=3D"http://git.openembedded.org/meta-openembedded" rel=
=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openembedded</a=
><br>
=C2=A0branch: master<br>
-revision: HEAD<br>
+<br>
=C2=A0meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this =
repository.<br>
<br>
=C2=A0To avoid dependencies on meta-multimedia you need to mask recipes by =
adding<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93131): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93131" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93131</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/85888414/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/85888414/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000001446ce05cceea148--

