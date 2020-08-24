Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.189812.1598253555819515603
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 00:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wittra.se header.s=google header.b=gP+NsOFV;
 spf=pass (domain: wittra.se, ip: 209.85.218.43, mailfrom: chencheng@wittra.se)
Received: by mail-ej1-f43.google.com with SMTP id md23so9779124ejb.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2020 00:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wittra.se; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AMGo2V1j8eQF9eD/ZfYraQZTLtczZ6ZK6m+tOi8O6FU=;
        b=gP+NsOFV9TykBebYTYgJY4ujboRa7Juy5UgLLwNcvcCYQ2BS/B427XNSubdo+E+1wP
         hxyWhpa0FffbI/eQDRz9hZi4FIHfZ5zybtU3NNypYxxwoT2fBQgxB2oPIxCZFMCUXZi5
         AHyPpesxzysxs2XPZzrwAOFF2UjCyn4UiFbDzvveLfJ4VgUCamw3Is/aH1PT/pAuvGzk
         OP8M6t+KfXMC92S6bfg5E4e0rKjs9D2fxBixAfeOAIenHiW8mXpTXq667K0Bf9nMUcej
         w+joc4w/6FQubYvVkTDt3eteYJuInQFkO+tpz9fB30k6g0YW185z5TrisCWWBQKEhORc
         INQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AMGo2V1j8eQF9eD/ZfYraQZTLtczZ6ZK6m+tOi8O6FU=;
        b=mf3u7yls7rRYP3SEy5mah4f/hEZIRYSzV7JvbH2D2F75SPomBpwgBDPWaqj61YVBP2
         tkMrzpVfWi5/ZqNeIUOEqcOl8A3+RRaRDn+z2gEJG9t9N93NOhm/YeEj9IK3A57ZPn5j
         0xbbaA44OODhu9GzozdvMWZsNcBEoMuNwYG7M31JYFP2pGqA3e5Qc4JIQEtVQNdNZq6f
         dl1Reujs3jLwcQXnHkEpW0EBst/KfHC4v4YRWwIm+JCx8szVrqup1gte7zQ8FGXViD1q
         VzQWjTRevIMDTYrpsXkubYIkutsAyY46cwXeV4koEt6X6oIdrXnoqyCHR1H/y0mH9S0B
         /ZfQ==
X-Gm-Message-State: AOAM533DMApdYleMxs4fKo/67cQDX3ecnAEj2JbfrYNmUjcUZwR6rO6v
	+2krhlvycBBkph8pgvMuM4hAWX6BS6+F/Ztw7WZ0Cw==
X-Google-Smtp-Source: ABdhPJwhrqjlJvFEV5C4oPZzlFVviLiWhaDpHozSz3IFElADHaKl0JKrzDWoaSRWpFEcIXWlpOiqTPfr1S16k0UgRJc=
X-Received: by 2002:a17:906:960a:: with SMTP id s10mr4206238ejx.60.1598253554174;
 Mon, 24 Aug 2020 00:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAE5diG1AoUDZrO=V7pMjvgv3Gu5cMk3dvPzM82Dem1Sc8X3Wvg@mail.gmail.com>
 <CANNYZj8dyU6LpUBiM--YNsF8of56SG4-+VxMsM2B9_SwY0+1dA@mail.gmail.com> <20200824065011.GE65616@pcleri>
In-Reply-To: <20200824065011.GE65616@pcleri>
From: "Chencheng Zhang" <chencheng@wittra.se>
Date: Mon, 24 Aug 2020 09:19:03 +0200
Message-ID: <CAE5diG391_PpisueBESovSM4vZNbZu9K0JMZieL1U7h9_y1L0g@mail.gmail.com>
Subject: Re: [oe] Failed to fetch URL https://bitbucket.org/cacaovm/cacao-staging/get/2d6f6c14daf9.zip
To: Richard Leitner <richard.leitner@skidata.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, ricardo@ribalda.com, 
	Alex Kiernan <alex.kiernan@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005ba38105ad9a674d"

--0000000000005ba38105ad9a674d
Content-Type: text/plain; charset="UTF-8"

Cool, thanks!
/Chencheng

On Mon, 24 Aug 2020 at 08:50, Richard Leitner <richard.leitner@skidata.com>
wrote:

> On Fri, Aug 21, 2020 at 04:40:26PM +0200, Alexander Kanavin wrote:
> > A fix should be arriving to meta-java shortly and a patch was already
> > posted here yesterday.
>
> fyi: I've just merged the cacao update to the master branch.
>
> >
> > Alex
> >
> > On Fri, 21 Aug 2020 at 16:32, Chencheng Zhang <chencheng@wittra.se>
> wrote:
> >
> > > Hi,
> > >
> > > The source of cacao seems to be invalid which makes the repice
> falsified:
> > > https://layers.openembedded.org/layerindex/recipe/23632/
> > > And this prevents Yocto from building openjre.
> > >
> > > Could someone be kind enough to update the cacao recipe?
> > > Thanks & Regards,
> > > Chencheng
>

--0000000000005ba38105ad9a674d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Cool, thanks!<div>/Chencheng</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 24 Aug 2020 at 0=
8:50, Richard Leitner &lt;<a href=3D"mailto:richard.leitner@skidata.com">ri=
chard.leitner@skidata.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Fri, Aug 21, 2020 at 04:40:26PM +0200, Alexande=
r Kanavin wrote:<br>
&gt; A fix should be arriving to meta-java shortly and a patch was already<=
br>
&gt; posted here yesterday.<br>
<br>
fyi: I&#39;ve just merged the cacao update to the master branch.<br>
<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
&gt; On Fri, 21 Aug 2020 at 16:32, Chencheng Zhang &lt;<a href=3D"mailto:ch=
encheng@wittra.se" target=3D"_blank">chencheng@wittra.se</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; The source of cacao seems to be invalid which makes the repice fa=
lsified:<br>
&gt; &gt; <a href=3D"https://layers.openembedded.org/layerindex/recipe/2363=
2/" rel=3D"noreferrer" target=3D"_blank">https://layers.openembedded.org/la=
yerindex/recipe/23632/</a><br>
&gt; &gt; And this prevents Yocto from building openjre.<br>
&gt; &gt;<br>
&gt; &gt; Could someone be kind enough to update the cacao recipe?<br>
&gt; &gt; Thanks &amp; Regards,<br>
&gt; &gt; Chencheng<br>
</blockquote></div>

--0000000000005ba38105ad9a674d--
