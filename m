Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.21951.1590180729045565908
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 13:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DL/EKJfd;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: domaryscorrea@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id n22so9345284qtv.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2020 13:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9aGdIIXzmdpbWbiXfMH8tV2POq7BEhJbRXgW4CyWUmg=;
        b=DL/EKJfds0dM9TrbQq2L8VOPgxfDN2VndhFGmRSyLMmjSnpNdQpPLtoUqhlnXdYRdf
         oGPlcCL9be7PqW/vmaD7oRx87WeJo7sQ52HsNSm5cCShaO7C7WgwNFQPKMmiilaMjmT5
         7nyAmf97RW5EDNChCrhznrW3OLBs8IwhJrkF3G2CUJFO0t8yqXqWLvovfBwreAHolmY6
         QoMJRWbH/Ry1QRKmIgWyFc6T+pAolRfW+anHur85LS17xhKKn2mpUI43ioPfYbEQ1cjX
         AhhRoPipCkf0YQmYv5r6K0kCbr2i85+7iQ2H6wINGs0cwCNAIYw2oaNPZJfpUkVBPU+c
         f2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9aGdIIXzmdpbWbiXfMH8tV2POq7BEhJbRXgW4CyWUmg=;
        b=T9CxE4b0jGpFS+Gv0Ttq89soFLq9YM9tE6V2oLMGfXBczcRNmdERIabeVZXc/iOk5S
         yfRG46bsRfs0ZbPyyTQ47smxprZe4PL9Ww2T2s5IiCGRGZLdKB0xQmCVFwRXB4aQUzC/
         Ae9wnvIwG6AdMIryUlWiQqQR7egnDSNkBb3ASQ9lgoxlPKryWvERovMJOIOgVSS7KJZn
         BViy/a/AStN874BaDyfCuB76QeDzKl8uO0lDUET57nRlnE6H3EGtlzsht1zBdSrtAZg/
         K1MeQF2qHHCJf5pdWE/Wtd1Xa0fi5/aUmm92vdjUbipriCNj6beS9/mro5eaOgtH7IOv
         XNaw==
X-Gm-Message-State: AOAM533v3ftJmpIktRtX17ZG5zD2YJcrwMTkMzxwT5iZAWn2tL8J5KZe
	7GT8K/wXnqtKRQtq9uHdhq/Z/CJUhla8g6VXn6E=
X-Google-Smtp-Source: ABdhPJzki/PaIBpyBZLNXEiGpzVSB8O71OyGotQ1wwEfS3IQfTFSdyEEWuLtsk0xNj+88NtzmPNcNRcEds4Cdb5QGQk=
X-Received: by 2002:ac8:74d0:: with SMTP id j16mr18299776qtr.23.1590180728111;
 Fri, 22 May 2020 13:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200522121333.25045-1-domarys.correa@ossystems.com.br>
 <20200522121333.25045-2-domarys.correa@ossystems.com.br> <CAMKF1sq92HXavsXKHabghWhfMJQoxFfW1ER_-O7G6BtAESQXCg@mail.gmail.com>
 <CAJA1DWvAoAXHKzNkjZ5nJQJ9OFJqPnmiH+xwKqoRtQF-2VMsmg@mail.gmail.com>
 <CAMKF1sosNy+780rp7pPJtixmguePdKKrbO4psRiuBEb7PC_GKA@mail.gmail.com> <CAMKF1soJ+m21B+o5yqy4TBQev12zMaRjcc4kYnPP-fXjkkJeJg@mail.gmail.com>
In-Reply-To: <CAMKF1soJ+m21B+o5yqy4TBQev12zMaRjcc4kYnPP-fXjkkJeJg@mail.gmail.com>
From: "Domarys" <domaryscorrea@gmail.com>
Date: Fri, 22 May 2020 17:51:56 -0300
Message-ID: <CAA0Ve-dm7q22o1J4FBdcD=Qpe+yHQ-yQQ+9L05cvxOA634zi5Q@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/3] python3-pyudev: Update 0.21.0 -> 0.22.0
To: Khem Raj <raj.khem@gmail.com>
Cc: =?UTF-8?Q?Domarys_da_Silva_Corr=C3=AAa?= <domarys.correa@ossystems.com.br>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006d85ea05a642cd9f"

--0000000000006d85ea05a642cd9f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

of course, I see.

On Fri, May 22, 2020 at 5:43 PM Khem Raj <raj.khem@gmail.com> wrote:

> They don't apply cleanly on top of master-next, can you see whats going =
on?
>
> On Fri, May 22, 2020 at 1:37 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > I don't think so. Just rebase would be good
> >
> > On Fri, May 22, 2020 at 12:17 PM Domarys da Silva Corr=C3=AAa <
> domarys.correa@ossystems.com.br> wrote:
> >>
> >> Hello,
> >>
> >> I did the rebase, and tested it again successfully. Is there a specif=
ic
> point that I should review?
> >>
> >> att,
> >>
> >> On Fri, May 22, 2020 at 12:59 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>>
> >>> Please rebase on top of master or master-next,
> >>>
> >>> Thanks
> >>> Khem
> >>>
> >>> On Fri, May 22, 2020 at 5:13 AM Domarys Correa
> >>> <domarys.correa@ossystems.com.br> wrote:
> >>> >
> >>> > Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
> >>> > ---
> >>> >  ...hon3-pyudev_0.21.0.bb =3D> python3-pyudev_0.22.0.bb} | 11
> +++++++----
> >>> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >>> >  rename meta-python/recipes-devtools/python/{
> python3-pyudev_0.21.0.bb =3D> python3-pyudev_0.22.0.bb} (70%)
> >>> >
> >>> > diff --git a/meta-python/recipes-devtools/python/
> python3-pyudev_0.21.0.bb b/meta-python/recipes-devtools/python/
> python3-pyudev_0.22.0.bb
> >>> > similarity index 70%
> >>> > rename from meta-python/recipes-devtools/python/
> python3-pyudev_0.21.0.bb
> >>> > rename to meta-python/recipes-devtools/python/
> python3-pyudev_0.22.0.bb
> >>> > index f39847ffa..d5bf058ed 100644
> >>> > --- a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
> >>> > +++ b/meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
> >>> > @@ -1,9 +1,9 @@
> >>> >  SUMMARY =3D "A libudev binding"
> >>> > +
> >>> >  LICENSE =3D "LGPLv2.1+"
> >>> >  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37343"
> >>> >
> >>> > -SRC_URI[md5sum] =3D "cf4d9db7d772622144ca1be6b5d9353b"
> >>> > -SRC_URI[sha256sum] =3D
> "094b7a100150114748aaa3b70663485dd360457a709bfaaafe5a977371033f2b"
> >>> > +SRC_URI[sha256sum] =3D
> "69bb1beb7ac52855b6d1b9fe909eefb0017f38d917cba9939602c6880035b276"
> >>> >
> >>> >  inherit pypi setuptools3
> >>> >
> >>> > @@ -12,10 +12,13 @@ do_configure_prepend() {
> >>> >      sed -i "s/str(pyudev.__version__)/'${PV}'/g" ${S}/setup.py
> >>> >  }
> >>> >
> >>> > -RDEPENDS_${PN} =3D "\
> >>> > +RDEPENDS_${PN} +=3D "\
> >>> > +    libudev \
> >>> >      ${PYTHON_PN}-ctypes \
> >>> > +    ${PYTHON_PN}-fcntl \
> >>> >      ${PYTHON_PN}-misc \
> >>> >      ${PYTHON_PN}-six \
> >>> >      ${PYTHON_PN}-threading \
> >>> > -    libudev \
> >>> >  "
> >>> > +
> >>> > +BBCLASSEXTEND =3D "native nativesdk"
> >>> > --
> >>> > 2.17.1
> >>> >
> >>> >
> >>
> >>
> >>
> >> --
> >> Domarys Corr=C3=AAa
> >> (55) 5399100-2700
> >> domaryscorrea@gmail.com
> >> domarys.correa@ossystems.com.br
>=20
>


--=20
*=E2=80=8BDomarys Corr=C3=AAa*
(53) 99100-2700
domaryscorrea@gmail.com
domarys.correa@ossystems.com.br

--0000000000006d85ea05a642cd9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"color:#a64d79"><span=
 class=3D"gmail-tlid-translation gmail-translation" lang=3D"en"><span title=
=
=3D"" class=3D"gmail-">of course, I see. <br></span></span></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, M=
ay 22, 2020 at 5:43 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">r=
aj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">They don&#39;t apply cleanly on top of master-next, can yo=
u see whats going on?<br>
<br>
On Fri, May 22, 2020 at 1:37 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I don&#39;t think so. Just rebase would be good<br>
&gt;<br>
&gt; On Fri, May 22, 2020 at 12:17 PM Domarys da Silva Corr=C3=AAa &lt;<a =
href=3D"mailto:domarys.correa@ossystems.com.br" target=3D"_blank">domarys.c=
orrea@ossystems.com.br</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hello,<br>
&gt;&gt;<br>
&gt;&gt; I did the rebase, and tested it again successfully. Is there a sp=
ecific point that I should review?<br>
&gt;&gt;<br>
&gt;&gt; att,<br>
&gt;&gt;<br>
&gt;&gt; On Fri, May 22, 2020 at 12:59 PM Khem Raj &lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Please rebase on top of master or master-next,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks<br>
&gt;&gt;&gt; Khem<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Fri, May 22, 2020 at 5:13 AM Domarys Correa<br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:domarys.correa@ossystems.com.br" target=
=
=3D"_blank">domarys.correa@ossystems.com.br</a>&gt; wrote:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Signed-off-by: Domarys Correa &lt;<a href=3D"mailto:doma=
rys.correa@ossystems.com.br" target=3D"_blank">domarys.correa@ossystems.com=
.br</a>&gt;<br>
&gt;&gt;&gt; &gt; ---<br>
&gt;&gt;&gt; &gt;=C2=A0 ...<a href=3D"http://hon3-pyudev_0.21.0.bb" rel=3D=
"noreferrer" target=3D"_blank">hon3-pyudev_0.21.0.bb</a> =3D&gt; <a href=3D=
"http://python3-pyudev_0.22.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-pyudev_0.22.0.bb</a>} | 11 +++++++----<br>
&gt;&gt;&gt; &gt;=C2=A0 1 file changed, 7 insertions(+), 4 deletions(-)<br=
>
&gt;&gt;&gt; &gt;=C2=A0 rename meta-python/recipes-devtools/python/{<a hre=
f=3D"http://python3-pyudev_0.21.0.bb" rel=3D"noreferrer" target=3D"_blank">=
python3-pyudev_0.21.0.bb</a> =3D&gt; <a href=3D"http://python3-pyudev_0.22.=
0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyudev_0.22.0.bb</a>} (7=
0%)<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; diff --git a/meta-python/recipes-devtools/python/<a href=
=
=3D"http://python3-pyudev_0.21.0.bb" rel=3D"noreferrer" target=3D"_blank">=
python3-pyudev_0.21.0.bb</a> b/meta-python/recipes-devtools/python/<a href=
=3D"http://python3-pyudev_0.22.0.bb" rel=3D"noreferrer" target=3D"_blank">=
python3-pyudev_0.22.0.bb</a><br>
&gt;&gt;&gt; &gt; similarity index 70%<br>
&gt;&gt;&gt; &gt; rename from meta-python/recipes-devtools/python/<a href=
=3D"http://python3-pyudev_0.21.0.bb" rel=3D"noreferrer" target=3D"_blank">=
python3-pyudev_0.21.0.bb</a><br>
&gt;&gt;&gt; &gt; rename to meta-python/recipes-devtools/python/<a href=3D=
"http://python3-pyudev_0.22.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-pyudev_0.22.0.bb</a><br>
&gt;&gt;&gt; &gt; index f39847ffa..d5bf058ed 100644<br>
&gt;&gt;&gt; &gt; --- a/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pyudev_0.21.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
pyudev_0.21.0.bb</a><br>
&gt;&gt;&gt; &gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pyudev_0.22.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
pyudev_0.22.0.bb</a><br>
&gt;&gt;&gt; &gt; @@ -1,9 +1,9 @@<br>
&gt;&gt;&gt; &gt;=C2=A0 SUMMARY =3D &quot;A libudev binding&quot;<br>
&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt; &gt;=C2=A0 LICENSE =3D &quot;LGPLv2.1+&quot;<br>
&gt;&gt;&gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Da6=
f89e2100d9b6cdffcea4f398e37343&quot;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; -SRC_URI[md5sum] =3D &quot;cf4d9db7d772622144ca1be6b5d93=
53b&quot;<br>
&gt;&gt;&gt; &gt; -SRC_URI[sha256sum] =3D &quot;094b7a100150114748aaa3b706=
63485dd360457a709bfaaafe5a977371033f2b&quot;<br>
&gt;&gt;&gt; &gt; +SRC_URI[sha256sum] =3D &quot;69bb1beb7ac52855b6d1b9fe90=
9eefb0017f38d917cba9939602c6880035b276&quot;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 inherit pypi setuptools3<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; @@ -12,10 +12,13 @@ do_configure_prepend() {<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 sed -i &quot;s/str(pyudev.__version_=
_)/&#39;${PV}&#39;/g&quot; ${S}/setup.py<br>
&gt;&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; -RDEPENDS_${PN} =3D &quot;\<br>
&gt;&gt;&gt; &gt; +RDEPENDS_${PN} +=3D &quot;\<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 libudev \<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-ctypes \<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 ${PYTHON_PN}-fcntl \<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-misc \<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-six \<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-threading \<br>
&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 libudev \<br>
&gt;&gt;&gt; &gt;=C2=A0 &quot;<br>
&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt; &gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt;&gt;&gt; &gt; --<br>
&gt;&gt;&gt; &gt; 2.17.1<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; <br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Domarys Corr=C3=AAa<br>
&gt;&gt; (55) 5399100-2700<br>
&gt;&gt; <a href=3D"mailto:domaryscorrea@gmail.com" target=3D"_blank">doma=
ryscorrea@gmail.com</a><br>
&gt;&gt; <a href=3D"mailto:domarys.correa@ossystems.com.br" target=3D"_bla=
nk">domarys.correa@ossystems.com.br</a><br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"lt=
r"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><=
div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr=
"><div style=3D"font-family:arial;font-size:small"><div><b><font color=3D"#=
a64d79">=E2=80=8BDomarys Corr=C3=AAa</font></b></div><div><font color=3D"#c=
27ba0">(53) 99100-2700</font></div><div><font color=3D"#c27ba0"><a href=3D"=
mailto:domaryscorrea@gmail.com" target=3D"_blank">domaryscorrea@gmail.com</=
a><br></font></div><div><font color=3D"#c27ba0"><a href=3D"mailto:domarys.c=
orrea@ossystems.com.br" rel=3D"noopener noreferrer" target=3D"_blank">domar=
ys.correa@ossystems.com.br</a></font></div><br><div><br></div><div><font co=
lor=3D"#c27ba0"></font></div></div></div></div></div></div></div></div></di=
v></div></div></div></div></div></div></div></div></div></div></div></div>

--0000000000006d85ea05a642cd9f--
