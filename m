Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
 by mx.groups.io with SMTP id smtpd.web11.191828.1598263032760345202
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 02:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vS3j2PaO;
 spf=pass (domain: gmail.com, ip: 209.85.217.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f66.google.com with SMTP id r7so4110535vsq.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2020 02:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dxhmLQGPGPDh6uKZekeYnphRa262//ikO0lQXBhNDgg=;
        b=vS3j2PaOgoihCPsIP9uZ2qB5tVP2Mk3DkSvJhCHCrlXZCAgPUUatmsN5rCf6YBu690
         pS7pQkKAkQhWLmJoLUeL3B855jtID0EmTMx/meoUvORbVI/4fEE26p/qiMSUHAc/GXaX
         QbgqSynLn6guzIy+N/0eK3IZzp8+jhyG4aFQZ4Tj/Z8OtH9kJpv91y3IcEtX2xmruWEI
         bXiC+v/X+nNpD7NjqEUhy7O3x4GUxxPxkxhqmmciY+U3DlRCjyx+Ys0gHSnmC0TeWMbn
         PjuSOwAsddXxkrd2vvJHdwrVxRXjE6ItRJq/je34tua1v6mzrS6p0Z3dDpf2KYFmmuXw
         QNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dxhmLQGPGPDh6uKZekeYnphRa262//ikO0lQXBhNDgg=;
        b=KRzuENFXOAKN4Ri/JBdy6HmimOQ2n4m6kNoPSl2Dqn7k6ih5+uJQslsd9ID2SdsfaC
         yTdxCz0rn3R5cS2lBRqqcTVijS4X5JMnsFeEecKlZ6mNkY6ajAbqVvzWaaIvekeabYvb
         FwORbi0B8W5CfJL/t1b0Z9sXqmMWyH2ykHHrTU5jzZrkGe6gTneD63JxgMOBydl+fcVx
         eM6CmUciWk/BWqYjyQlnNocO2KPUNmCRZ/ATnTT3Xd+xCjtTRwIemx4GQqANH2V0ayWV
         /h5+o7A/aqtD8eNSeg0OHaM8RE+Viv/vR5yoeAbOeDDGF44wGe2Nu7NdZ+3F82VUQHdE
         JG7Q==
X-Gm-Message-State: AOAM530eS/z330n9Va3HmwE1Li4NR3cFLtcGGu9gu/LXlrzgnN6jmJRu
	STQQXXmHMKBGNjQ70W1zsrdkgHJ1/wkeAX3TbgA=
X-Google-Smtp-Source: ABdhPJzFlz9+5iRxsPTyvqt07cgmO/gNdgyau9OgbouMiyvNQwQmYZfNIgKBI6BS1/YYRTDCPOldSrVyuzjfPtM2Zt8=
X-Received: by 2002:a67:ecc6:: with SMTP id i6mr1965512vsp.25.1598263031978;
 Mon, 24 Aug 2020 02:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200824062225.GD65616@pcleri> <30416287-890a-4fd1-2262-21b2a9b68ffd@gmail.com>
 <20200824083345.GG65616@pcleri> <CANNYZj9BA_nPnJCHDAUcxtzz9Lz3zn8WSPh7jeKJY9omCTHRaA@mail.gmail.com>
 <20200824091401.GB2286@pcleri> <CANNYZj_+KTOwyvBhrDQ7NuecOBFe=Poh8Khc_ntDU4M5iGL=Gg@mail.gmail.com>
 <20200824093831.GC2286@pcleri> <CANNYZj_LT1m2gSbhL+Di1PaFGzSYGmPVYsEus0YnSx19sOZ8jw@mail.gmail.com>
In-Reply-To: <CANNYZj_LT1m2gSbhL+Di1PaFGzSYGmPVYsEus0YnSx19sOZ8jw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 24 Aug 2020 11:57:00 +0200
Message-ID: <CANNYZj-9HLJi5j8a=4jDC8tkbMjV-AaSEnGCzc3K9_+5X1qNXQ@mail.gmail.com>
Subject: Re: [oe] [meta-java] Changes from master-next merged to master
To: Richard Leitner <richard.leitner@skidata.com>
Cc: Jacob Kroon <jacob.kroon@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000475d5c05ad9c9c0c"

--000000000000475d5c05ad9c9c0c
Content-Type: text/plain; charset="UTF-8"

Right, it started to download after some minutes, but is extremely sluggish:

jdk8u265-ga.tar.bz2                                      [      <=>

                        ] 159,58K  7,35KB/s

Looks like trouble at the hosting site/network.

Alex

On Mon, 24 Aug 2020 at 11:55, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Mon, 24 Aug 2020 at 11:38, Richard Leitner <richard.leitner@skidata.com>
> wrote:
>
>> > I usually start with that, and if the tarball is regularly removed, it
>> is
>> > possible to switch over to https://snapshot.debian.org/ which is
>> stable for
>> > any given timestamp (but the downside is that no new releases show up so
>> > the latest version check has to look elsewhere).
>>
>> Thanks for the info. So snapshots.debian.org is OK for OE/YP?
>>
>
> Yes, it is used in several places in oe-core, and is a de facto standard
> approach for dead upstreams.
>
>
>>
>> >
>> > But I would wait a few days; there is a high chance the official site
>> will
>> > come back soon.
>>
>> Yeah, looks like it works again. At least my downloads succeeded now.
>>
>
> Still not working for me (or it is taking a really really long time):
>
> ak@linux-f9zs:~/development/meta-java> wget
> https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2
> --2020-08-24 11:50:18--
> https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2
> Resolving hg.openjdk.java.net (hg.openjdk.java.net)... 137.254.56.63
> Connecting to hg.openjdk.java.net (hg.openjdk.java.net)|137.254.56.63|:443...
> connected.
> HTTP request sent, awaiting response...
>
> Alex
>
>
>>
>> >
>> > Alex
>>
>> regards;rl
>>
>

--000000000000475d5c05ad9c9c0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Right, it started to download after some minutes, but=
 is extremely sluggish:</div><div><br></div><div>jdk8u265-ga.tar.bz2 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ =C2=A0 =C2=A0 =C2=A0&=
lt;=3D&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ] 159,58K =C2=A07,35KB/s =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 <br></div><div></div><div><br></div><div>Looks like tr=
ouble at the hosting site/network.</div><div><br></div><div>Alex<br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, 24 Aug 2020 at 11:55, Alexander Kanavin &lt;<a href=3D"mailto:alex.k=
anavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 24 Aug 2020 at 11:38=
, Richard Leitner &lt;<a href=3D"mailto:richard.leitner@skidata.com" target=
=3D"_blank">richard.leitner@skidata.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">&gt; I usually start with that, and =
if the tarball is regularly removed, it is<br>
&gt; possible to switch over to <a href=3D"https://snapshot.debian.org/" re=
l=3D"noreferrer" target=3D"_blank">https://snapshot.debian.org/</a> which i=
s stable for<br>
&gt; any given timestamp (but the downside is that no new releases show up =
so<br>
&gt; the latest version check has to look elsewhere).<br>
<br>
Thanks for the info. So <a href=3D"http://snapshots.debian.org" rel=3D"nore=
ferrer" target=3D"_blank">snapshots.debian.org</a> is OK for OE/YP?<br></bl=
ockquote><div><br></div><div>Yes, it is used in several places in oe-core, =
and is a de facto standard approach for dead upstreams.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; But I would wait a few days; there is a high chance the official site =
will<br>
&gt; come back soon.<br>
<br>
Yeah, looks like it works again. At least my downloads succeeded now.<br></=
blockquote><div><br></div><div>Still not working for me (or it is taking a =
really really long time):</div><div><br></div><div>ak@linux-f9zs:~/developm=
ent/meta-java&gt; wget <a href=3D"https://hg.openjdk.java.net/jdk8u/jdk8u/a=
rchive/jdk8u265-ga.tar.bz2" target=3D"_blank">https://hg.openjdk.java.net/j=
dk8u/jdk8u/archive/jdk8u265-ga.tar.bz2</a><br>--2020-08-24 11:50:18-- =C2=
=A0<a href=3D"https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.t=
ar.bz2" target=3D"_blank">https://hg.openjdk.java.net/jdk8u/jdk8u/archive/j=
dk8u265-ga.tar.bz2</a><br>Resolving <a href=3D"http://hg.openjdk.java.net" =
target=3D"_blank">hg.openjdk.java.net</a> (<a href=3D"http://hg.openjdk.jav=
a.net" target=3D"_blank">hg.openjdk.java.net</a>)... 137.254.56.63<br>Conne=
cting to <a href=3D"http://hg.openjdk.java.net" target=3D"_blank">hg.openjd=
k.java.net</a> (<a href=3D"http://hg.openjdk.java.net" target=3D"_blank">hg=
.openjdk.java.net</a>)|137.254.56.63|:443... connected.<br>HTTP request sen=
t, awaiting response...</div><div><br></div><div>Alex<br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; Alex<br>
<br>
regards;rl<br>
</blockquote></div></div>
</blockquote></div>

--000000000000475d5c05ad9c9c0c--
