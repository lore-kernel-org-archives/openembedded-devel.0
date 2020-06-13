Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web11.11848.1592065052831895041
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2020 09:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JHoExriw;
 spf=pass (domain: linaro.org, ip: 209.85.166.196, mailfrom: arthur.she@linaro.org)
Received: by mail-il1-f196.google.com with SMTP id b5so11585628iln.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2020 09:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V/751xiZ7QuD2utRHgSIEzX8+rTmtNZSJhiyuZd0XTo=;
        b=JHoExriw5VwxwElp1HUaLSxLxMp0cXy4KgcPRgQjfG75HiZH40Oji7Abh5FGdqm5nU
         bx11V2o2+yFk9Dz6GVdlMj1/5Ega96ZOh8kk7ixP6if0RglTJ07ZyXioBFhlXRU9X9Ni
         13VVfh9t0FgKx1bzcj+1gIMRpMzYwR4Ia0q4ajP8uKKfAbxGehyBvy9qKDMHkuA/uJci
         1xwV0F2TfxUJRYGCCGtCW9UGxeNBxQhJ2E4UCuoFzjmviqDnIfg/dSaIEoLcsb/sYzpN
         jmZHdeNyRkbgMfE64iyEvDo/OhpA/FmvYsV/zBstTj4w0Hx7mLZCvYuQuLiVserdVChZ
         qaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V/751xiZ7QuD2utRHgSIEzX8+rTmtNZSJhiyuZd0XTo=;
        b=MZU74ZvVVneScsBgelZkccnAXylas4jVgaQrMInOqqi6u3X4N3e44E3f4sQrTRVbcd
         ayroHL+Y5KfHOW7hDjeHJp/fOcRScoJBGo3QUMEtictOsBpf+Xi1KFKEhjYbpKUuLWFj
         tOL/p/6pVfFEWvIjS33EZpE+QSpXKp901YwiAyLXL1hNPxKZxiLeceh6JHcDFDQifZfN
         WaJzbBy2pgYRAhaZpl22bwAFt6Ob78+tZAUiZEBDXrPiG5vZ+EJQdq38OURdt+mCa55n
         cVwK/EBVcoombEMAth58KrZL2N9z5aWlT6MmqMg1n+cy+UfB0ryMF+1j//fs2+dJUdyL
         Eh3Q==
X-Gm-Message-State: AOAM532KEtdYOa688JrMcoLb1KfR1czXpVMUopxKY4vseyFhQnVDpQjE
	WZCskyp7Klpp34wgALbfChCCHCFzucFiIS1qBRPatQ==
X-Google-Smtp-Source: ABdhPJyFTccCxxvVBoVS219DtMTM2VO8Pvb/RyCM5Yca/PC/x2+HF3PF+DBkzXiGrBijcskse7GWaqEBa/avNP2M6AI=
X-Received: by 2002:a92:290c:: with SMTP id l12mr17729945ilg.279.1592065052265;
 Sat, 13 Jun 2020 09:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200609142957.187352-1-arthur.she@linaro.org>
 <CAAnfSTsaMMCGGnGGYHf6dQ3Kdjtzf-NnPy7VoXDjffC-BFPHGw@mail.gmail.com>
 <20200609215534.GW17660@denix.org> <CAAnfSTupFtc44EX0O6f=1xGX8TLeNhTk9w5J-y0WGPhdA3ZgAw@mail.gmail.com>
 <CAJ8hLzHt24_OpYUf92=qHpypsb3UpXuOhUm4MAoGoi23h1zh+g@mail.gmail.com> <b27b1907c0cbc522137a2f9f5fd8794cd8459d8d.camel@intel.com>
In-Reply-To: <b27b1907c0cbc522137a2f9f5fd8794cd8459d8d.camel@intel.com>
From: "Arthur She" <arthur.she@linaro.org>
Date: Sat, 13 Jun 2020 09:17:21 -0700
Message-ID: <CAJ8hLzHnxPZLgck3Cyxz7P7rQ6ra=vM1aE==UNqhgzxMMY=VHg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] igt-gpu-tools: add new package
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "ross@burtonini.com" <ross@burtonini.com>, "denis@denix.org" <denis@denix.org>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e667a905a7f987aa"

--000000000000e667a905a7f987aa
Content-Type: text/plain; charset="UTF-8"

Hi Anuj,
I will send it to oe-core.

Thanks,
Arthur
On Fri, Jun 12, 2020 at 2:20 AM Mittal, Anuj <anuj.mittal@intel.com> wrote:

> On Thu, 2020-06-11 at 22:27 -0700, Arthur She wrote:
> > Hi Ross, Denys,
> > Thanks for your comments.
> > I've talked to the meta-intel maintainer.
> > He agrees to remove it from meta-intel and use this one instead, once
> > it gets merged.
>
> Actually I had requested that it be sent to oe-core list to seek
> others' opinion on whether it can be included there since this provides
> a core validation functionality that is applicable not just to a single
> arch and is used by all. I would have been able to remove it from meta-
> intel in that case.
>
> Thanks,
>
> Anuj
>

--000000000000e667a905a7f987aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Anuj,<div>I will send it to oe-core.</=
div></div><div><br></div>Thanks,<div>Arthur<br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 12, 2020 at 2:20 AM Mittal=
, Anuj &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.=
mittal@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Thu, 2020-06-11 at 22:27 -0700, Arthur She wrote:<br>
&gt; Hi Ross, Denys,<br>
&gt; Thanks for your comments.<br>
&gt; I&#39;ve talked to the meta-intel maintainer.<br>
&gt; He agrees to remove it from meta-intel and use this one instead, once<=
br>
&gt; it gets merged.<br>
<br>
Actually I had requested that it be sent to oe-core list to seek<br>
others&#39; opinion on whether it can be included there since this provides=
<br>
a core validation functionality that is applicable not just to a single<br>
arch and is used by all. I would have been able to remove it from meta-<br>
intel in that case.<br>
<br>
Thanks,<br>
<br>
Anuj<br>
</blockquote></div></div></div>

--000000000000e667a905a7f987aa--
