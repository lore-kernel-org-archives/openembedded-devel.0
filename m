Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28094C38162
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:09 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web09.2042.1649355235944763652
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 11:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V1NMupXm;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id hu11so5611839qvb.7
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 11:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vYtF17fx26k+V/T3w7xmpSQkM1Iuhpzeys9IU1wZhBY=;
        b=V1NMupXmFbzSRS26caJN8ArynjXzPqYBV12sAuYoQXXgSEa4sbRfitFq/3LsOPqivy
         KvTV5Pr4XS0kUJtXTA6SQ9amyHkibhbS/Cbph7WlAjXLJ3Zew/hfYkae0CB1+L9WDftY
         20e820GfdIurISLtpaGuZwdmu+hzgc6lU5fV2Zog/RzZpjj+We+EsSx7S8lJ2HJ3x9VX
         5NB9l1HQoxNkTqaz2NEXAenYDfDnbbVMziso5d35AU9AcpGtjzqMzeNfe0SPRkAX/vYX
         GvBSu5BUvnUjwa3JVZdfDNhBKPJ3ZUFB8BwHFSH4pFz+VU25zRjpbJhOD576KzXXn4Mf
         0YEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vYtF17fx26k+V/T3w7xmpSQkM1Iuhpzeys9IU1wZhBY=;
        b=Dm6HYpVQ/cVwU7AbzCzrVIB2XzijsH0xnQK2vPYtIENTo33TGJiD/Qcj2htu4AFb1W
         CsQ8gqqXLNtPSHA5KDfqhUMvl/t+QQcfysaXMDefI5US9UVHlM/MOvO9bDYb+5O1fnJk
         TT+e/fTkoaOf/LAQLZM8rmeiAZNVX88YOVO+bdifEYACEZ4nYOap+bzCJyejFyJgW3I9
         n7nxf+VZKoAPAVlPyb64+nb4PiP/1ZtgSzLk1I4dDref21a96O/wCI2E7en2/gk9swFv
         g2CsrA6/datBt4tYcCf7ivEfWEF3YjyyIrls0Z0ZuieOlcIi+arBExJlYj6gjyylP3fI
         jfLA==
X-Gm-Message-State: AOAM531KXDRC6Mzfm8pDS5TPq9y9Md4/y1qmXN07rHuEKwnSc+4P4JMX
	nDaNqv+tzGtE9w3HVJa61UZ2lNpfISLREy6a8TU=
X-Google-Smtp-Source: 
 ABdhPJxk+ZIGiz5LVbh+NHmTHhO67wUKJi+vQG4OKorD9Yvx0njRY/SVHFnhzcTksb+G4pNIS/GP4b+um0upJmcdZS0=
X-Received: by 2002:a0c:f9cc:0:b0:443:cec3:c9b5 with SMTP id
 j12-20020a0cf9cc000000b00443cec3c9b5mr12949452qvo.36.1649355234799; Thu, 07
 Apr 2022 11:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220407090354.4040-1-f_l_k@t-online.de>
In-Reply-To: <20220407090354.4040-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Apr 2022 14:13:43 -0400
Message-ID: 
 <CAMKF1srAxBiDVVXVShDGPRnsV-KozNW0fdBZn4k90ByzR9H4kg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCHv2] gparted: update to v1.4.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e0f5f705dc14706f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96454

--000000000000e0f5f705dc14706f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 7, 2022 at 5:04 AM Markus Volk <f_l_k@t-online.de> wrote:

> - remove x11 features-check because there aren't dependencies that would
>   explicilty require x11 as a DISTRO_FEATURE
> - replace basename() by g_path_get_basename() to fix up musl build
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> GParted 1.4.0   (2022-03-28)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>
> Release Notes
> -------------
>   This release of GParted includes enhancements, bug fixes and
>   language translation updates.
>
>   * Add labelling of mounted btrfs, ext2/3/4 and xfs file systems
>   * Fix detection of mount points for encrypted file systems
>   * Fix crash scrolling quickly in the drive selection combobox
>   * Add bcache detection
>   * Add JBD external EXT3/4 journal detection
>
> Bug Fixes
> ---------
>   * Add labelling of mounted btrfs, ext2/3/4 and xfs file systems (#163,
> !87)
>   * Fix detection of mount points for encrypted file systems (#162, !88)
>   * Fix unmount error when unmounting below a bind mount point (!89)
>   * Fix crash scrolling quickly in the drive selection combobox (#165, !9=
1)
>   * Add initial Indonesian translation of help (!90)
>   * Add accessibility relations for screen readers like Orca (!92)
>   * Fix partition creation at sector 2048 if partition before it (#172,
> !93)
>   * Make more getter methods use return-by-constant-reference (!94)
>   * Check copy destination instead of source (!95)
>   * Add bcache detection (#183, !96)
>   * Add JBD external EXT3/4 journal detection (#89, !97)
>   * Fix translation of DocBook markup tag of the GParted Manual (!98)
>
> Code Credits
> ------------
>   Code enhancements are courtesy of Movie Ma, Pascal Eng=C3=A9libert, and
>   Mike Fleetwood.
>
> Translations (new/updated)
> --------------------------
>   cs(Marek =C4=8Cernock=C3=BD), da(Alan Mortensen), eu(Asier Sarasua Garm=
endia),
>   fur(Fabio Tomat), he(Yaron Shahrabani), hr(Goran Vidovi=C4=87),
>   hu(Bal=C3=A1zs =C3=9Ar), id(Andika Triwidada), it(Milo Casagrande),
>   ko(Seong-ho Cho), lt(Aurimas =C4=8Cernius), lv(R=C5=ABdolfs Mazurs),
>   nb(Kjell Cato Heskjestad), nl(Nathan Follens), pa(A S Alam),
>   pt(Hugo Carvalho), ru(Aleksandr Melman, Sergej A), sk(Du=C5=A1an Kazik)=
,
>   sl(Matej Urban=C4=8Di=C4=8D), sr(=D0=9C=D0=B8=D1=80=D0=BE=D1=81=D0=BB=
=D0=B0=D0=B2 =D0=9D=D0=B8=D0=BA=D0=BE=D0=BB=D0=B8=D1=9B), zh_CN(Luming Zh)
>
> Dependencies (new/updated)
> --------------------------
>   * n/a
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../gparted/files/0001-replace-gnu-basename.patch | 15 +++++++++++++++
>  .../{gparted_1.3.1.bb =3D> gparted_1.4.0.bb}        |  6 +++---
>  2 files changed, 18 insertions(+), 3 deletions(-)
>  create mode 100644
> meta-gnome/recipes-extended/gparted/files/0001-replace-gnu-basename.patch
>  rename meta-gnome/recipes-extended/gparted/{gparted_1.3.1.bb =3D>
> gparted_1.4.0.bb} (83%)
>
> diff --git
> a/meta-gnome/recipes-extended/gparted/files/0001-replace-gnu-basename.pat=
ch
> b/meta-gnome/recipes-extended/gparted/files/0001-replace-gnu-basename.pat=
ch
> new file mode 100644
> index 000000000..ff06911ab
> --- /dev/null
> +++
> b/meta-gnome/recipes-extended/gparted/files/0001-replace-gnu-basename.pat=
ch
> @@ -0,0 +1,15 @@
> +Upstream-Status: Pending


I think it would be good to submit this patch upstream it looks a good
portable change to me

>
> +
> +Signed-off-by: Markus Volk f_l_k@t-online.de
> +
> +--- a/src/BCache_Info.cc       2022-04-07 09:56:08.589006367 +0200
> ++++ b/src/BCache_Info.cc       2022-04-07 09:55:34.573186965 +0200
> +@@ -49,7 +49,7 @@
> +               return Glib::ustring("");
> +       buf[len] =3D '\0';
> +
> +-      return "/dev/" + Glib::ustring(basename(buf));
> ++      return "/dev/" + Glib::ustring(g_path_get_basename(buf));
> + }
> +
> +
> diff --git a/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb
> b/meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb
> similarity index 83%
> rename from meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb
> rename to meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb
> index d1a975930..a4b653ceb 100644
> --- a/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb
> +++ b/meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb
> @@ -3,16 +3,16 @@ HOMEPAGE =3D "http://gparted.org/index.php"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
>
> -inherit features_check autotools pkgconfig python3native gnome-help
> gtk-icon-cache
> +inherit autotools pkgconfig python3native gnome-help gtk-icon-cache
>
> -REQUIRED_DISTRO_FEATURES =3D "x11"
>
>  SRC_URI =3D " \
>
>  ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.ta=
r.gz
> \
>
>  file://0001-Install-polkit-action-unconditionally-executable-pke.patch \
>      file://0001-Do-not-use-NULL-where-boolean-is-expected.patch \
> +    file://0001-replace-gnu-basename.patch \
>  "
> -SRC_URI[sha256sum] =3D
> "5eee2e6d74b15ef96b13b3a2310c868ed2298e03341021e7d12a5a98a1d1e109"
> +SRC_URI[sha256sum] =3D
> "e5293a792e53fdbeba29c4a834113cd9603d0d639330da931a468bf3687887be"
>
>  UPSTREAM_CHECK_URI =3D "
> https://sourceforge.net/projects/gparted/files/gparted/"
>  UPSTREAM_CHECK_REGEX =3D "gparted-(?P<pver>\d+\.(\d+)+(\.\d+)+)"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96449):
> https://lists.openembedded.org/g/openembedded-devel/message/96449
> Mute This Topic: https://lists.openembedded.org/mt/90309117/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e0f5f705dc14706f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Apr 7, 2022 at 5:04 AM Markus Volk &lt;<a href=3D"m=
ailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">- remove x11 features-check because there aren&#39;t=
 dependencies that would<br>
=C2=A0 explicilty require x11 as a DISTRO_FEATURE<br>
- replace basename() by g_path_get_basename() to fix up musl build<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>
GParted 1.4.0=C2=A0 =C2=A0(2022-03-28)<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>
<br>
Release Notes<br>
-------------<br>
=C2=A0 This release of GParted includes enhancements, bug fixes and<br>
=C2=A0 language translation updates.<br>
<br>
=C2=A0 * Add labelling of mounted btrfs, ext2/3/4 and xfs file systems<br>
=C2=A0 * Fix detection of mount points for encrypted file systems<br>
=C2=A0 * Fix crash scrolling quickly in the drive selection combobox<br>
=C2=A0 * Add bcache detection<br>
=C2=A0 * Add JBD external EXT3/4 journal detection<br>
<br>
Bug Fixes<br>
---------<br>
=C2=A0 * Add labelling of mounted btrfs, ext2/3/4 and xfs file systems (#16=
3, !87)<br>
=C2=A0 * Fix detection of mount points for encrypted file systems (#162, !8=
8)<br>
=C2=A0 * Fix unmount error when unmounting below a bind mount point (!89)<b=
r>
=C2=A0 * Fix crash scrolling quickly in the drive selection combobox (#165,=
 !91)<br>
=C2=A0 * Add initial Indonesian translation of help (!90)<br>
=C2=A0 * Add accessibility relations for screen readers like Orca (!92)<br>
=C2=A0 * Fix partition creation at sector 2048 if partition before it (#172=
, !93)<br>
=C2=A0 * Make more getter methods use return-by-constant-reference (!94)<br=
>
=C2=A0 * Check copy destination instead of source (!95)<br>
=C2=A0 * Add bcache detection (#183, !96)<br>
=C2=A0 * Add JBD external EXT3/4 journal detection (#89, !97)<br>
=C2=A0 * Fix translation of DocBook markup tag of the GParted Manual (!98)<=
br>
<br>
Code Credits<br>
------------<br>
=C2=A0 Code enhancements are courtesy of Movie Ma, Pascal Eng=C3=A9libert, =
and<br>
=C2=A0 Mike Fleetwood.<br>
<br>
Translations (new/updated)<br>
--------------------------<br>
=C2=A0 cs(Marek =C4=8Cernock=C3=BD), da(Alan Mortensen), eu(Asier Sarasua G=
armendia),<br>
=C2=A0 fur(Fabio Tomat), he(Yaron Shahrabani), hr(Goran Vidovi=C4=87),<br>
=C2=A0 hu(Bal=C3=A1zs =C3=9Ar), id(Andika Triwidada), it(Milo Casagrande),<=
br>
=C2=A0 ko(Seong-ho Cho), lt(Aurimas =C4=8Cernius), lv(R=C5=ABdolfs Mazurs),=
<br>
=C2=A0 nb(Kjell Cato Heskjestad), nl(Nathan Follens), pa(A S Alam),<br>
=C2=A0 pt(Hugo Carvalho), ru(Aleksandr Melman, Sergej A), sk(Du=C5=A1an Kaz=
ik),<br>
=C2=A0 sl(Matej Urban=C4=8Di=C4=8D), sr(=D0=9C=D0=B8=D1=80=D0=BE=D1=81=D0=
=BB=D0=B0=D0=B2 =D0=9D=D0=B8=D0=BA=D0=BE=D0=BB=D0=B8=D1=9B), zh_CN(Luming Z=
h)<br>
<br>
Dependencies (new/updated)<br>
--------------------------<br>
=C2=A0 * n/a<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../gparted/files/0001-replace-gnu-basename.patch | 15 ++++++++++++++=
+<br>
=C2=A0.../{<a href=3D"http://gparted_1.3.1.bb" rel=3D"noreferrer" target=3D=
"_blank">gparted_1.3.1.bb</a> =3D&gt; <a href=3D"http://gparted_1.4.0.bb" r=
el=3D"noreferrer" target=3D"_blank">gparted_1.4.0.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 6 +++---<br>
=C2=A02 files changed, 18 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 meta-gnome/recipes-extended/gparted/files/0001-rep=
lace-gnu-basename.patch<br>
=C2=A0rename meta-gnome/recipes-extended/gparted/{<a href=3D"http://gparted=
_1.3.1.bb" rel=3D"noreferrer" target=3D"_blank">gparted_1.3.1.bb</a> =3D&gt=
; <a href=3D"http://gparted_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">=
gparted_1.4.0.bb</a>} (83%)<br>
<br>
diff --git a/meta-gnome/recipes-extended/gparted/files/0001-replace-gnu-bas=
ename.patch b/meta-gnome/recipes-extended/gparted/files/0001-replace-gnu-ba=
sename.patch<br>
new file mode 100644<br>
index 000000000..ff06911ab<br>
--- /dev/null<br>
+++ b/meta-gnome/recipes-extended/gparted/files/0001-replace-gnu-basename.p=
atch<br>
@@ -0,0 +1,15 @@<br>
+Upstream-Status: Pending</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">I think it would be good to submit this patch upstream it looks a=
 good portable change to me=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=
=3D"auto"><br>
+<br>
+Signed-off-by: Markus Volk <a href=3D"mailto:f_l_k@t-online.de" target=3D"=
_blank">f_l_k@t-online.de</a><br>
+<br>
+--- a/src/BCache_Info.cc=C2=A0 =C2=A0 =C2=A0 =C2=A02022-04-07 09:56:08.589=
006367 +0200<br>
++++ b/src/BCache_Info.cc=C2=A0 =C2=A0 =C2=A0 =C2=A02022-04-07 09:55:34.573=
186965 +0200<br>
+@@ -49,7 +49,7 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return Glib::ustrin=
g(&quot;&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buf[len] =3D &#39;\0&#39;;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 return &quot;/dev/&quot; + Glib::ustring(basename(bu=
f));<br>
++=C2=A0 =C2=A0 =C2=A0 return &quot;/dev/&quot; + Glib::ustring(g_path_get_=
basename(buf));<br>
+ }<br>
+ <br>
+ <br>
diff --git a/meta-gnome/recipes-extended/gparted/<a href=3D"http://gparted_=
1.3.1.bb" rel=3D"noreferrer" target=3D"_blank">gparted_1.3.1.bb</a> b/meta-=
gnome/recipes-extended/gparted/<a href=3D"http://gparted_1.4.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">gparted_1.4.0.bb</a><br>
similarity index 83%<br>
rename from meta-gnome/recipes-extended/gparted/<a href=3D"http://gparted_1=
.3.1.bb" rel=3D"noreferrer" target=3D"_blank">gparted_1.3.1.bb</a><br>
rename to meta-gnome/recipes-extended/gparted/<a href=3D"http://gparted_1.4=
.0.bb" rel=3D"noreferrer" target=3D"_blank">gparted_1.4.0.bb</a><br>
index d1a975930..a4b653ceb 100644<br>
--- a/meta-gnome/recipes-extended/gparted/<a href=3D"http://gparted_1.3.1.b=
b" rel=3D"noreferrer" target=3D"_blank">gparted_1.3.1.bb</a><br>
+++ b/meta-gnome/recipes-extended/gparted/<a href=3D"http://gparted_1.4.0.b=
b" rel=3D"noreferrer" target=3D"_blank">gparted_1.4.0.bb</a><br>
@@ -3,16 +3,16 @@ HOMEPAGE =3D &quot;<a href=3D"http://gparted.org/index.ph=
p" rel=3D"noreferrer" target=3D"_blank">http://gparted.org/index.php</a>&qu=
ot;<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D94d55d512a9ba36caa9b7=
df079bae19f&quot;<br>
<br>
-inherit features_check autotools pkgconfig python3native gnome-help gtk-ic=
on-cache<br>
+inherit autotools pkgconfig python3native gnome-help gtk-icon-cache<br>
<br>
-REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV=
}/${BPN}-${PV}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-Install-polkit-action-unconditionally-execu=
table-pke.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-Do-not-use-NULL-where-boolean-is-expected.p=
atch \<br>
+=C2=A0 =C2=A0 file://0001-replace-gnu-basename.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[sha256sum] =3D &quot;5eee2e6d74b15ef96b13b3a2310c868ed2298e0334102=
1e7d12a5a98a1d1e109&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e5293a792e53fdbeba29c4a834113cd9603d0d639330d=
a931a468bf3687887be&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://sourceforge.net/proje=
cts/gparted/files/gparted/" rel=3D"noreferrer" target=3D"_blank">https://so=
urceforge.net/projects/gparted/files/gparted/</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;gparted-(?P&lt;pver&gt;\d+\.(\d+)+(\.\=
d+)+)&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#96449): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/96449" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/96449</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90309117/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90309117/1997914</a><br>
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

--000000000000e0f5f705dc14706f--

