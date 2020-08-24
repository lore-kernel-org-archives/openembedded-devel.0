Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web10.190608.1598253872930275657
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 00:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cgPp/trY;
 spf=pass (domain: gmail.com, ip: 209.85.222.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id q68so2314130uaq.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2020 00:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fqy8n5ulQdNN0tJ7jhAMktUBJYWYapzWK993VRBSnlo=;
        b=cgPp/trY1UY0ylCnkaYEt6ASzr4yDAmiugX2CqvtF12uuIgsej0KNy4JGThaOiKoRL
         Esr7DBY5Vf+4+zjVZAhudFmh8K+zs+c7rRoAtkod6vH0FOXNa6uENIacd4jUIrfBm1X8
         t4nD2Xmgkp7zQZ/q8D08sWPdXRKZqAvSFZt6DgyEhuxI52Ty4++tI0S3IyhKFkR0cnJR
         VYfoYCiCdkV/4RK2b093DdHplGrIRFEoSp4iiv2/7ZAPZmNan/QJfV8T28IpjdFA1lmB
         Dks5GAAU2pp6GJq6MGPwZvMANFFt++KgUuuucTsAPQHgXKB7E2SpGDDeFxS/Gneif9t0
         1Odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fqy8n5ulQdNN0tJ7jhAMktUBJYWYapzWK993VRBSnlo=;
        b=P0+fAey94H1wGmw5BaVo8jQ8KFpoxAw9A+0AiSvV8ner43OqfSOBuDYma8BPazwa3t
         6cp1m3PFRg7CtseCOQrw8XjxXEh4/QHXkcr2GKN8eU0bvgWn1Ukna5ip3PYHD8c6PCfP
         jS/W2QUbMSD/V0rA/wd7SOAqKE7KsA8Dqu4oe/2HvRCtYD3hABoariHx3T2mtWgkNN+f
         Eyg8bTLCELFcqxJ9kXHpfH/kta6Zq5Godh03adl9rJs0oUDrTnTN7NBLC3pndZ/ID2v5
         8czPhsdh6wHUEd/BMGnfcHjopcM/lKPdSlNl7gBXW5Sj7zryj0PbU1GqHCus5aNtdmnr
         +KUw==
X-Gm-Message-State: AOAM530M4z27AZU3HVBAUfXNrOEgZfGpnLxwwHvqnxx7S6LobMyoHy8O
	SV8GM86MYQiDP+75xzTSLRJpsMO9ge+jV+YRoxo=
X-Google-Smtp-Source: ABdhPJwJZquAkc8MXxPb9j9kNxzqdiUwjGdjr5OQR67ojFvyFyBK3KTy5SQo8J5yVAhrI9cpEZpUl2ii2AZLuZCV1Gs=
X-Received: by 2002:ab0:6950:: with SMTP id c16mr1599830uas.71.1598253872076;
 Mon, 24 Aug 2020 00:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAE5diG1AoUDZrO=V7pMjvgv3Gu5cMk3dvPzM82Dem1Sc8X3Wvg@mail.gmail.com>
 <CANNYZj8dyU6LpUBiM--YNsF8of56SG4-+VxMsM2B9_SwY0+1dA@mail.gmail.com> <20200824065011.GE65616@pcleri>
In-Reply-To: <20200824065011.GE65616@pcleri>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 24 Aug 2020 09:24:21 +0200
Message-ID: <CANNYZj_CMwME4mhX0FfhVJbe94eW00TzjXuthWqWBCg3tJULHA@mail.gmail.com>
Subject: Re: [oe] Failed to fetch URL https://bitbucket.org/cacaovm/cacao-staging/get/2d6f6c14daf9.zip
To: Richard Leitner <richard.leitner@skidata.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, Chencheng Zhang <chencheng@wittra.se>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, ricardo@ribalda.com
Content-Type: multipart/alternative; boundary="0000000000004e59e705ad9a7aed"

--0000000000004e59e705ad9a7aed
Content-Type: text/plain; charset="UTF-8"

Thanks! But I guess dunfell needs the same set of fixes?

Alex

On Mon 24. Aug 2020 at 8.50, Richard Leitner <richard.leitner@skidata.com>
wrote:

> On Fri, Aug 21, 2020 at 04:40:26PM +0200, Alexander Kanavin wrote:
>
> > A fix should be arriving to meta-java shortly and a patch was already
>
> > posted here yesterday.
>
>
>
> fyi: I've just merged the cacao update to the master branch.
>
>
>
> >
>
> > Alex
>
> >
>
> > On Fri, 21 Aug 2020 at 16:32, Chencheng Zhang <chencheng@wittra.se>
> wrote:
>
> >
>
> > > Hi,
>
> > >
>
> > > The source of cacao seems to be invalid which makes the repice
> falsified:
>
> > > https://layers.openembedded.org/layerindex/recipe/23632/
>
> > > And this prevents Yocto from building openjre.
>
> > >
>
> > > Could someone be kind enough to update the cacao recipe?
>
> > > Thanks & Regards,
>
> > > Chencheng
>
>

--0000000000004e59e705ad9a7aed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Thanks! But I guess dunfell needs the same set of fi=
xes?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div></div><di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On M=
on 24. Aug 2020 at 8.50, Richard Leitner &lt;<a href=3D"mailto:richard.leit=
ner@skidata.com">richard.leitner@skidata.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204=
,204,204)">On Fri, Aug 21, 2020 at 04:40:26PM +0200, Alexander Kanavin wrot=
e:<br><br>&gt; A fix should be arriving to meta-java shortly and a patch wa=
s already<br><br>&gt; posted here yesterday.<br><br><br><br>fyi: I&#39;ve j=
ust merged the cacao update to the master branch.<br><br><br><br>&gt; <br><=
br>&gt; Alex<br><br>&gt; <br><br>&gt; On Fri, 21 Aug 2020 at 16:32, Chenche=
ng Zhang &lt;<a href=3D"mailto:chencheng@wittra.se" target=3D"_blank">chenc=
heng@wittra.se</a>&gt; wrote:<br><br>&gt; <br><br>&gt; &gt; Hi,<br><br>&gt;=
 &gt;<br><br>&gt; &gt; The source of cacao seems to be invalid which makes =
the repice falsified:<br><br>&gt; &gt; <a href=3D"https://layers.openembedd=
ed.org/layerindex/recipe/23632/" rel=3D"noreferrer" target=3D"_blank">https=
://layers.openembedded.org/layerindex/recipe/23632/</a><br><br>&gt; &gt; An=
d this prevents Yocto from building openjre.<br><br>&gt; &gt;<br><br>&gt; &=
gt; Could someone be kind enough to update the cacao recipe?<br><br>&gt; &g=
t; Thanks &amp; Regards,<br><br>&gt; &gt; Chencheng<br><br></blockquote></d=
iv></div>

--0000000000004e59e705ad9a7aed--
