Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web08.7432.1610217751827910073
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Jan 2021 10:42:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rQfyUMKc;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id z20so8808898qtq.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Jan 2021 10:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rMzLr7zOs3WO+gt2pswoEO9rdWtJzUaWfgaO/W3CcHc=;
        b=rQfyUMKcIPgMgwRuFBCPgOWjiPaEQ/WiK9ZQOBEOGu0tmys9UgXWahB/6LS0s+Awik
         rABLfkahAjNOePCsAf0t4CFjZD9GF1jG3vIz0xgibP8CbiWhGGJGkmdthmo1kd2t5gEJ
         1F8Vz5ejCPQceDzzAlxrQRLkB/DVmNNFDsdus9WSzmiHCSWaLJDtU0yDagZQVVcXEKjB
         tnr9OzThpmrkFsqBKcMYghTHvNNI87VHeC1ubwph3Wp7tftMyGsGxA+n6zoI2c3bEp9a
         spx3bWkmuGKgvNZL/1CoBz9X86mumGsNxYVQhg6HdepzkHMulWDSw9DJb6qJW1JfLhqJ
         UEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rMzLr7zOs3WO+gt2pswoEO9rdWtJzUaWfgaO/W3CcHc=;
        b=Lwe6KBgORtHXbU3qjEsPEj9h58lhdhTfKirJC13sjEtvpJzmIrX0o/Sviwr3HUSbN3
         c6A9XsRGUT2o7APFzhiBjxgQ9HLVkmqCSyGueyNDU1lfFPJQUR8IrpKyYbJJcu+9GiUZ
         vLooCw4Pzq3/cV3BfYPjpCVlrLfTOpOled9BIesZYvdc9QvCh4pQXrlXRh0xtcYcSe1W
         Bhaf1zS5IR00IJm07N8C72GmeuVmLJBlYE7obNt/Z+d6H55jBze2QYCVshCMp8qyUFAw
         3XQKkvn42uOtMkeEDIrv8YDXfA/+r5f6KZD7LCBDYs8kSstbPEMcJ9qac6+b8ZJREpiR
         d9JA==
X-Gm-Message-State: AOAM53225tj51WSNFDN68AsOcQ2hX8QHddWikwTh5eb8b5XvoVlYjD1T
	Z6bJF1TV43o/f/2KblOpV1GSWA4o/douYpXE8vOBrmHPmhM=
X-Google-Smtp-Source: ABdhPJx4fzsbq1ag5sQ/fSZZfs5qonTIOv0LIgxtYAobRFAm68Mu+zzGM4LBfMOi1X7KzMRY2Frjxp7kAmYVYb+CmWg=
X-Received: by 2002:a05:622a:195:: with SMTP id s21mr8862767qtw.53.1610217750888;
 Sat, 09 Jan 2021 10:42:30 -0800 (PST)
MIME-Version: 1.0
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
 <20210106151717.1779543-4-schnitzeltony@gmail.com> <CAMKF1srRCWhAcsVaNM=rou6_ys+KC_16PyB4KGB+Kj2vjfvZWQ@mail.gmail.com>
 <CALbNGRTreOS2m9z9tOp_Z3sGrVVypZr=5J9RBFwwnPF+fieYcw@mail.gmail.com>
 <CAMKF1sqht8W9eaqY6sVAVEqq_fKXsefOkjCSaLF=eCt-f+6vMQ@mail.gmail.com> <CALbNGRT_Jgtqd=LzHSNxBOvowHWLDx481tNsJ2bBiR=G2uaP3A@mail.gmail.com>
In-Reply-To: <CALbNGRT_Jgtqd=LzHSNxBOvowHWLDx481tNsJ2bBiR=G2uaP3A@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 9 Jan 2021 10:42:20 -0800
Message-ID: <CAMKF1sqQFRVW7aXJbbykZR+RoQumbHBka6A_BhF1=VESe5OGkA@mail.gmail.com>
Subject: Re: [oe] [PATCH 04/28] libxfce4ui: upgrade 4.14.1 -> 4.16.0
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000d855e05b87c095a"

--0000000000000d855e05b87c095a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 8, 2021 at 12:46 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m>
wrote:

> On Fri, Jan 8, 2021 at 9:32 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Fri, Jan 8, 2021 at 12:29 PM Andreas M=C3=BCller <schnitzeltony@gmai=
l.com>
> wrote:
> > >
> > > On Fri, Jan 8, 2021 at 8:54 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > I see an odd failure on qemuriscv64
> > > > https://errors.yoctoproject.org/Errors/Details/540832/
> > > Hi Khem,
> > >
> > > Have seen this either but assumed it was caused by going back and
> > > forth during tests. Worked around this by cleansstate.
> > >
> > > I think there is some race (unrelated to qemuriscv64): when I saw the
> > > error, the file was there. I looked into that already but did not fin=
d
> > > suspicious yet. Have put libxfce4ui back on my TODO...
> > >
> >
> > yeah it seems intermittent, its already in master so will observe how
> > it fairs in CI builds over few days
> > and if its too noisy we might need a quick solution
> >
> If you look in the logs and search for
> 'TOPDIR/build/tmpfs/hosttools/install -c -m 644
> ../../libxfce4ui-4.16.0/libxfce4ui/libxfce4ui.h', you'll find it
> twice. Seems there are two make jobs doing same (sometimes at the same
> time).


That seems to be a install time race we can disable it for do_install
perhaps

>
>
> This is at least a start...
>
> Andreas
>

--0000000000000d855e05b87c095a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jan 8, 2021 at 12:46 PM Andreas M=C3=BCller &lt;<a =
href=3D"mailto:schnitzeltony@gmail.com">schnitzeltony@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">On Fri, Jan 8, 2021 at 9:32 PM =
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, Jan 8, 2021 at 12:29 PM Andreas M=C3=BCller &lt;<a href=3D"mai=
lto:schnitzeltony@gmail.com" target=3D"_blank">schnitzeltony@gmail.com</a>&=
gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Jan 8, 2021 at 8:54 PM Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I see an odd failure on qemuriscv64<br>
&gt; &gt; &gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/54=
0832/" rel=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org=
/Errors/Details/540832/</a><br>
&gt; &gt; Hi Khem,<br>
&gt; &gt;<br>
&gt; &gt; Have seen this either but assumed it was caused by going back and=
<br>
&gt; &gt; forth during tests. Worked around this by cleansstate.<br>
&gt; &gt;<br>
&gt; &gt; I think there is some race (unrelated to qemuriscv64): when I saw=
 the<br>
&gt; &gt; error, the file was there. I looked into that already but did not=
 find<br>
&gt; &gt; suspicious yet. Have put libxfce4ui back on my TODO...<br>
&gt; &gt;<br>
&gt;<br>
&gt; yeah it seems intermittent, its already in master so will observe how<=
br>
&gt; it fairs in CI builds over few days<br>
&gt; and if its too noisy we might need a quick solution<br>
&gt;<br>
If you look in the logs and search for<br>
&#39;TOPDIR/build/tmpfs/hosttools/install -c -m 644<br>
../../libxfce4ui-4.16.0/libxfce4ui/libxfce4ui.h&#39;, you&#39;ll find it<br=
>
twice. Seems there are two make jobs doing same (sometimes at the same<br>
time).</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">That seems=
 to be a install time race we can disable it for do_install perhaps=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
This is at least a start...<br>
<br>
Andreas<br>
</blockquote></div></div>

--0000000000000d855e05b87c095a--
