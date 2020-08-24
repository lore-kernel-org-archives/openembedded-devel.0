Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web12.2738.1598297815807420725
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 12:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EI/0RE3d;
 spf=pass (domain: gmail.com, ip: 209.85.221.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id l184so2272717vki.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2020 12:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3vXjbuU3frgOzpYviG4Riw7bJ6PMpQ0XfK4KK7v9XY8=;
        b=EI/0RE3dItiC0cpc9j7MJhHizjIS3al3I2DUoYN6O88YADxfQ3HRJVqGuyei9kcXOo
         gAouin9gTGiaMxSmwB+LcDrQsHv3yDIQsqziwUVvDsrUsuhn8aB5xeXD4wD2JiBKkkzn
         ai7WEUOyC1aljQ7SnVcEJ6AqNcjJrBtSKiUJnPzK/TLuof7eLMPq8AoMdnYPP/5h8SHu
         na6LzoyMXQG04CrU85Lm1MtronnSxSpFCdxJXvEpQcMdjz91aWQT3NuLP4nplvS0XffZ
         HYk037EI4j4I39/74i1pbFhbITi0CDr2p4jiWinZ1Z7kXW+pGygwkymmmJ2ViLkn3C1u
         iG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3vXjbuU3frgOzpYviG4Riw7bJ6PMpQ0XfK4KK7v9XY8=;
        b=Zp5rueduyrt+22yMFL8FPiQyLOm2SrwnkpnQwMOIzbj6/x3mmFECXYrfoEvEVklIzj
         g9ElF314ShgoCLe+L6Idf9Io2Ha3b3AvObEJyaaTpRwwJFGv5LFOdXZrHFhSzGjT3f9J
         m2Z0whYdEORQ226cVnQWvoMu1ATsgfH5zBgOfWmrZtRkvkaEEYmps/45YeWAJyKrw9zv
         +gwIKjdyfC51t4xPMxXD4p4Zw4bRv2wK2eRk3z1q4NXPLbwNoGP94GQayPoneIM4N4Jo
         uU+EHkhwHZ1pIO3zVj3lIzraOX4tnY6I+AP1ZYuePSxO+ikciH2jzZ6zNO2rkcBXanMV
         uJVA==
X-Gm-Message-State: AOAM533RNJAsEGakFeJdNg5ZQ8zmeGxeOeqOnFXLYUc4J1DWTC/8jqZs
	qha74EZWFc0hpq+nqtL4wc/mRi8dymieJh0Rlks=
X-Google-Smtp-Source: ABdhPJzda9wbNqLyiTxBO3QTyj0vN1j1wvOzYFG6mjWTQCDyE96X0pq4FF03zBTzkguzjbVVJP/I12Eu0BuMAxWa8Bc=
X-Received: by 2002:ac5:c8a7:: with SMTP id o7mr3787629vkl.29.1598297814945;
 Mon, 24 Aug 2020 12:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200824062225.GD65616@pcleri> <30416287-890a-4fd1-2262-21b2a9b68ffd@gmail.com>
 <20200824083345.GG65616@pcleri> <CANNYZj9BA_nPnJCHDAUcxtzz9Lz3zn8WSPh7jeKJY9omCTHRaA@mail.gmail.com>
 <20200824091401.GB2286@pcleri> <CANNYZj_+KTOwyvBhrDQ7NuecOBFe=Poh8Khc_ntDU4M5iGL=Gg@mail.gmail.com>
 <20200824093831.GC2286@pcleri> <CANNYZj_LT1m2gSbhL+Di1PaFGzSYGmPVYsEus0YnSx19sOZ8jw@mail.gmail.com>
 <162E2BC2BA50B6B6.12673@lists.openembedded.org>
In-Reply-To: <162E2BC2BA50B6B6.12673@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 24 Aug 2020 21:36:42 +0200
Message-ID: <CANNYZj8fWMk1Ya+G-HbC2VVbC4HWV6x=4T=ni_cdW5-qNG1YnA@mail.gmail.com>
Subject: Re: [oe] [meta-java] Changes from master-next merged to master
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Leitner <richard.leitner@skidata.com>, Jacob Kroon <jacob.kroon@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008152e605ada4b54e"

--0000000000008152e605ada4b54e
Content-Type: text/plain; charset="UTF-8"

I think the site and the downloads are now properly back.

Alex

On Mon, 24 Aug 2020 at 11:57, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> Right, it started to download after some minutes, but is extremely
> sluggish:
>
> jdk8u265-ga.tar.bz2                                      [      <=>
>
>                           ] 159,58K  7,35KB/s
>
> Looks like trouble at the hosting site/network.
>
> Alex
>
> On Mon, 24 Aug 2020 at 11:55, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> On Mon, 24 Aug 2020 at 11:38, Richard Leitner <
>> richard.leitner@skidata.com> wrote:
>>
>>> > I usually start with that, and if the tarball is regularly removed, it
>>> is
>>> > possible to switch over to https://snapshot.debian.org/ which is
>>> stable for
>>> > any given timestamp (but the downside is that no new releases show up
>>> so
>>> > the latest version check has to look elsewhere).
>>>
>>> Thanks for the info. So snapshots.debian.org is OK for OE/YP?
>>>
>>
>> Yes, it is used in several places in oe-core, and is a de facto standard
>> approach for dead upstreams.
>>
>>
>>>
>>> >
>>> > But I would wait a few days; there is a high chance the official site
>>> will
>>> > come back soon.
>>>
>>> Yeah, looks like it works again. At least my downloads succeeded now.
>>>
>>
>> Still not working for me (or it is taking a really really long time):
>>
>> ak@linux-f9zs:~/development/meta-java> wget
>> https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2
>> --2020-08-24 11:50:18--
>> https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2
>> Resolving hg.openjdk.java.net (hg.openjdk.java.net)... 137.254.56.63
>> Connecting to hg.openjdk.java.net (hg.openjdk.java.net)|137.254.56.63|:443...
>> connected.
>> HTTP request sent, awaiting response...
>>
>> Alex
>>
>>
>>>
>>> >
>>> > Alex
>>>
>>> regards;rl
>>>
>> 
>

--0000000000008152e605ada4b54e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think the site and the downloads are now properly b=
ack.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 24 Aug 2020 at 11:57, A=
lexander Kanavin via <a href=3D"http://lists.openembedded.org">lists.openem=
bedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openemb=
edded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Right, it =
started to download after some minutes, but is extremely sluggish:</div><di=
v><br></div><div>jdk8u265-ga.tar.bz2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0[ =C2=A0 =C2=A0 =C2=A0&lt;=3D&gt; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 159,58K =
=C2=A07,35KB/s =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br></div>=
<div></div><div><br></div><div>Looks like trouble at the hosting site/netwo=
rk.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 24 Aug 2020 at 11:55, Al=
exander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_bl=
ank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, 24 Aug 2020 at 11:38, Richard Lei=
tner &lt;<a href=3D"mailto:richard.leitner@skidata.com" target=3D"_blank">r=
ichard.leitner@skidata.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">&gt; I usually start with that, and if the tarbal=
l is regularly removed, it is<br>
&gt; possible to switch over to <a href=3D"https://snapshot.debian.org/" r=
el=3D"noreferrer" target=3D"_blank">https://snapshot.debian.org/</a> which =
is stable for<br>
&gt; any given timestamp (but the downside is that no new releases show up=
 so<br>
&gt; the latest version check has to look elsewhere).<br>
<br>
Thanks for the info. So <a href=3D"http://snapshots.debian.org" rel=3D"nor=
eferrer" target=3D"_blank">snapshots.debian.org</a> is OK for OE/YP?<br></b=
lockquote><div><br></div><div>Yes, it is used in several places in oe-core,=
 and is a de facto standard approach for dead upstreams.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; But I would wait a few days; there is a high chance the official site=
 will<br>
&gt; come back soon.<br>
<br>
Yeah, looks like it works again. At least my downloads succeeded now.<br><=
/blockquote><div><br></div><div>Still not working for me (or it is taking a=
 really really long time):</div><div><br></div><div>ak@linux-f9zs:~/develop=
ment/meta-java&gt; wget <a href=3D"https://hg.openjdk.java.net/jdk8u/jdk8u/=
archive/jdk8u265-ga.tar.bz2" target=3D"_blank">https://hg.openjdk.java.net/=
jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2</a><br>--2020-08-24 11:50:18-- =C2=
=A0<a href=3D"https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.=
tar.bz2" target=3D"_blank">https://hg.openjdk.java.net/jdk8u/jdk8u/archive/=
jdk8u265-ga.tar.bz2</a><br>Resolving <a href=3D"http://hg.openjdk.java.net"=
 target=3D"_blank">hg.openjdk.java.net</a> (<a href=3D"http://hg.openjdk.ja=
va.net" target=3D"_blank">hg.openjdk.java.net</a>)... 137.254.56.63<br>Conn=
ecting to <a href=3D"http://hg.openjdk.java.net" target=3D"_blank">hg.openj=
dk.java.net</a> (<a href=3D"http://hg.openjdk.java.net" target=3D"_blank">h=
g.openjdk.java.net</a>)|137.254.56.63|:443... connected.<br>HTTP request se=
nt, awaiting response...</div><div><br></div><div>Alex<br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; Alex<br>
<br>
regards;rl<br>
</blockquote></div></div>
</blockquote></div>
<br>
</blockquote></div>

--0000000000008152e605ada4b54e--
