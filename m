Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web08.74809.1629403240139121209
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 13:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QEthqisk;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id f6so1694386iox.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Aug 2021 13:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4JaHquibabUWsgXdJCUCwOgmv1boVN0drnC/lYokAIs=;
        b=QEthqisknpv5swzhOJkN3/GpaL41lM5Qoriyx61SA2kEFSkrr9qbk1KpMSIeyEFVGC
         16asLBxM9w9I3rtXFDx0RhmzyIYVLeeLaBJ1WuTb0E+iRW/xe9++REmyEOVYq+AgUVlH
         EKYRKGw0rz90keQPvtsLsPagOsfmzobdQtWiRyxK0XaFRh+jYiV+I2naMoyjS8vyDJN5
         ukGjiefT6TlUUpNeAdgw54qsmWL1wLAUnzS4kFME/f37rC//8T31WphlSHJgMt0Ujlxz
         OLRrAzfM4Fc8facD0FW9pKOYww38T4MawAiq1Q7vtpxE1cZfGU8BKPWJOKGaskFPjFfd
         NKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4JaHquibabUWsgXdJCUCwOgmv1boVN0drnC/lYokAIs=;
        b=GEwIEvlWy3oOxR3ULlhf/XXSsp1r9jLagwpR+93VzBXC3PZtsaHQnvaKkNW0H4uhZU
         H+SoN9CYpVlpxjF5Ay/flnaYnojbSGnvn1CENyYPZKVvL3s6vjbd7DuAiEWQijiAJSn6
         W8KEXj1dmhekHOsoj0+2IC2CvR36i6hl+pkyMrwuNivqEvAGfJ9gBNfQyKCE2gSY0j8B
         Fq/yvfGeuqX5rcj3+Popi4/MYRhll//Q2sImi64kB/MckP02OFibmlUlyu55+PMiflYE
         DfOleGSWQ8AaJYyHPdnEthi6aB5u9pvou6xdL661fduXI4yKN9fRs3ac5Fh8dXvUJh8E
         eOug==
X-Gm-Message-State: AOAM533ODPEUAz25LdpXRMMZiPWc/Z5ZfjvxvO+++bhuVKLgy64KlHFM
	MUZ8KUlu670SCMTJhe3YGG5WI/b+f/G+CJlbZTc=
X-Google-Smtp-Source: ABdhPJy93kv/YHxnfv2jgHhk2YK4DBp81ldp5PcnJU3wHEjofwadByMt5Gf8UYloHnFlkHU6gC8C2UMvsmR9tcOHaJ4=
X-Received: by 2002:a6b:c8c7:: with SMTP id y190mr6380237iof.210.1629403239355;
 Thu, 19 Aug 2021 13:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210819173150.3607310-1-ticotimo@gmail.com> <5987cfa7-19a9-bb39-88d7-00275e20322d@gmail.com>
In-Reply-To: <5987cfa7-19a9-bb39-88d7-00275e20322d@gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Thu, 19 Aug 2021 13:00:28 -0700
Message-ID: <CANx9H-B2u96tH3BrvQrrOX0ceHGiP+iWgUtYNd+10t_1PFmOrQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] bootchart: drop; unfetchable
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000471dc105c9ef01dd"

--000000000000471dc105c9ef01dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 19, 2021 at 10:38 AM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 8/19/21 10:31 AM, Tim Orling wrote:
> > This was replaced by bootchart2 long ago in oe-core.
> > gitorious.org no longer exists, so this is unfetchable.
> >
> > Also, this has seen no development since bootchart2 was
> > created.
> >
>
> it needs to be removed from packagegroup-meta-oe as well.
>
Right. I=E2=80=99ll do a v3 later today.


> > Signed-off-by: Tim Orling <ticotimo@gmail.com>
>
<snip>

--000000000000471dc105c9ef01dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Aug 19, 2021 at 10:38 AM Khem Raj &lt;<a href=3D"ma=
ilto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><br>
<br>
On 8/19/21 10:31 AM, Tim Orling wrote:<br>
&gt; This was replaced by bootchart2 long ago in oe-core.<br>
&gt; <a href=3D"http://gitorious.org" rel=3D"noreferrer" target=3D"_blank">=
gitorious.org</a> no longer exists, so this is unfetchable.<br>
&gt; <br>
&gt; Also, this has seen no development since bootchart2 was<br>
&gt; created.<br>
&gt; <br>
<br>
it needs to be removed from packagegroup-meta-oe as well.<br>
</blockquote><div dir=3D"auto">Right. I=E2=80=99ll do a v3 later today.</di=
v><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" ta=
rget=3D"_blank">ticotimo@gmail.com</a>&gt;<br>
</blockquote><div dir=3D"auto">&lt;snip&gt;</div></div></div>

--000000000000471dc105c9ef01dd--
