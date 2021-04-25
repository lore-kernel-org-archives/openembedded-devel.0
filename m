Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.7067.1619386876086160033
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Apr 2021 14:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fILdPXnj;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id ja3so5602492ejc.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Apr 2021 14:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bDn2gpzrmcgnBCvYjF9WSkAfeg6tsdMO6QYpgPMBGZo=;
        b=fILdPXnjcKB6VBa5OdmjdV9YSaSlE5b+W6Jcj7KhWUflmVIDMrQskPr3awUNFvix7S
         MH7yis5jzQm8uXNDX/xdw1B1Kh8ZgzP7sM2n/tX6jVF8wlPwFUvQlriDGB061uTIFWYb
         o21ILkYARYfYPkaIgg5QyDSBHS8E8q2wda8D/2NEFLC+uGxAuVXxSe3mihjPlYN8G5i7
         BAeYZev/e5STQb/cu0KpTonVnhA6nhPKQXNEgcIwai5fdrWsEZU9BIuDsZMZ2k+ffD5C
         zLgHWKSe4PtogayWxqJCx12Yl6klm6Y6DvMJ963x+QZ4yPECR2DzAcLByWnas5LdFtwZ
         GV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bDn2gpzrmcgnBCvYjF9WSkAfeg6tsdMO6QYpgPMBGZo=;
        b=HoyVKZTJp0v8esraIhc8fCnbBAfNgI/SnCXzLeJ7Yyr74MNcpkschkeMyzCsXNGiDU
         1XnZeT8g4EHglfjzcUS5iNThTSHpggNrfclcX0tqsK/ho+u2doHRgdT2Q3QxUEmYa2Rk
         0HzbcIFn++f36FfOIR+TXfEYPkWkoSLPjEIdGJ+phmXK25AwIu4xjqL/4z9c94w6l+ts
         4C+uv7Zc/c+vSMkIyOkVd7ilSli3Zc5Itzpb4DPItCrpo1YIV2ZZQKKNT5tzPOrXQAv8
         q5v7SKNcTwmOgeYb0vzshzyb5fA1k2L6j+3c7VkemsUjddQycdE9PZsmjKOTWskwmD2F
         j5lA==
X-Gm-Message-State: AOAM532xJo/POhnW6UejlGnStmnFW7Wjq8xJi3cvFIXdCgzepMWh6+Tp
	3NngicaAMxCQHkZ1Oi9lzaJhwymrHxflJ6e0MVE=
X-Google-Smtp-Source: ABdhPJyQqvWJo1YjutgSvCK+TKnajC0pU8/v/tPYT/2pWwu/jwK55e9bYMA6gvaNpxaZZZeW66vjAHwcqp1rbhICyUk=
X-Received: by 2002:a17:906:6959:: with SMTP id c25mr4482274ejs.392.1619386874451;
 Sun, 25 Apr 2021 14:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1619258978.git.akuster808@gmail.com> <CA+chaQeSzuwXe2YRgc68xek+ZygZ7D16Q3jj=jBrTico5TvCEA@mail.gmail.com>
 <87d755d5-1068-dd5a-58e1-7ffbec9310b7@gmail.com>
In-Reply-To: <87d755d5-1068-dd5a-58e1-7ffbec9310b7@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sun, 25 Apr 2021 14:41:02 -0700
Message-ID: <CA+chaQdcK1_kimSqjafGH4b5Ek+gGE2P2fLrDYJ15dGmrNpqvA@mail.gmail.com>
Subject: Re: [oe] [hardknott 0/6] Patch review April 24th
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000067dba305c0d2e316"

--00000000000067dba305c0d2e316
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 25, 2021 at 1:56 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 4/24/21 3:36 AM, Martin Jansa wrote:
> > Please take
> >
> https://git.openembedded.org/meta-openembedded/commit/?id=b5ad9c011db2581cc84e5daa139acf73a0f6f5c0
> > as well to fix
> >
> https://git.openembedded.org/meta-openembedded/commit/?h=hardknott&id=98a26903f770aa8698770817bdaf6175367917e1
> > merged in previous PR.
>
> Hardknott already has that commit. Was this meant for Gatesgarth?
>

I don't see b5ad9c011db2581cc84e5daa139acf73a0f6f5c0 in hardknott nor in
hardknott-next:
https://git.openembedded.org/meta-openembedded/log/?h=hardknott-next&qt=grep&q=tbb

And in master it's between the last 2 commits you did cherry-pick for
hardknott in this round, so I don't understand why this one was skipped.

It's not needed in gatesgarth, because the tbb upgrade which dropped in PE
wasn't merged to gatesgarth.

--00000000000067dba305c0d2e316
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 25, 2021 at 1:56 PM akust=
er808 &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 4/24/21 3:36 AM, Martin Jansa wrote:<br>
&gt; Please take<br>
&gt; <a href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=
=3Db5ad9c011db2581cc84e5daa139acf73a0f6f5c0" rel=3D"noreferrer" target=3D"_=
blank">https://git.openembedded.org/meta-openembedded/commit/?id=3Db5ad9c01=
1db2581cc84e5daa139acf73a0f6f5c0</a><br>
&gt; as well to fix<br>
&gt; <a href=3D"https://git.openembedded.org/meta-openembedded/commit/?h=3D=
hardknott&amp;id=3D98a26903f770aa8698770817bdaf6175367917e1" rel=3D"norefer=
rer" target=3D"_blank">https://git.openembedded.org/meta-openembedded/commi=
t/?h=3Dhardknott&amp;id=3D98a26903f770aa8698770817bdaf6175367917e1</a><br>
&gt; merged in previous PR.<br>
<br>
Hardknott already has that commit. Was this meant for Gatesgarth?<br></bloc=
kquote><div><br></div><div>I don&#39;t see b5ad9c011db2581cc84e5daa139acf73=
a0f6f5c0 in hardknott nor in hardknott-next:</div><div><a href=3D"https://g=
it.openembedded.org/meta-openembedded/log/?h=3Dhardknott-next&amp;qt=3Dgrep=
&amp;q=3Dtbb">https://git.openembedded.org/meta-openembedded/log/?h=3Dhardk=
nott-next&amp;qt=3Dgrep&amp;q=3Dtbb</a></div><div><br></div><div>And in mas=
ter it&#39;s between the last 2 commits you did cherry-pick for hardknott i=
n this round, so I don&#39;t understand why this one was skipped.</div><div=
><br></div><div>It&#39;s not needed in gatesgarth, because the tbb upgrade =
which dropped in PE wasn&#39;t merged to gatesgarth.</div></div></div>

--00000000000067dba305c0d2e316--
