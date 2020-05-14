Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web10.274.1589487975718902749
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2020 13:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GMRX12fI;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id f4so109860iov.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2020 13:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HOO8xvLqOuLVNA028LjrZ19stKVzAW1It+rGRaKnYSw=;
        b=GMRX12fIQc/7uy/zA6NgCIaRyYkfPhtdoNsuoA7zJRgQfVNzciLHldVt3Sx7SmMqZ2
         db/kwmVYXgCrXb2dEYNPZXZ/phgXTiFVCq0CtjvD9SmdtfmHYul6nFgrSfbySLW2WDXX
         jK6cbLDAWFaY9ONXOG8cJDdXYhIW8FSYF4Jy6BZVczrqVHghIkta8Ul9+sXuFw8NupEj
         6YZ91VdVWcZoDu4j5ZjXJ2u1SoYbmSVQUWEUGOGm8eRg47bY66tuw/S7enKKkCd/QLqt
         uVMm5wJVYdztyJg/6vWPtsdwrgFsTNbZ33dPfFWOkDEZTgA/oHzynY+Cgj7MgFOXb4mG
         q0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HOO8xvLqOuLVNA028LjrZ19stKVzAW1It+rGRaKnYSw=;
        b=rxlCnb9975Q6iYD/eS+OaxFKr14cfxEa/GjlPcTmSneBQkLWv6JbVGHoV1UaxlY2w1
         ouV+2hW/2Q62fUtrMZkE+w16KlytpqVkoqoxfRTcp+NshsYHtxkfZ2WpyVysrmcYkxld
         SGLP8JeDyEUbPAqkouPXpfsdP7ZIbnl4C9rZHKdCzpOKEY7cK8vvUMpa+d5euLJ2qjd7
         Je8PgEkiGeASkOU9hP4kl6uznZGhPntlBZwbfc+kopbFv/rv+sn94TFJJReF0j1d8o/7
         eCJU2HAoOK+eKmVQgil5AFaMyUGFhxvIMpeO3ZuWgLfLtZxL0SP3FKsQKOODYDpMiGOs
         HUoQ==
X-Gm-Message-State: AOAM530HhGYxNXxJ2wZc1DXyGit0F3Xk9KcDXxFzN0X976VcN0YnoPSy
	XfTjGEPYB2jerFa6ftbonZrVmx92hnHJAUiYvng=
X-Google-Smtp-Source: ABdhPJyY9tEoh40jYftUk813SQ33c7XIcIlcqMikOPSJtxGaHIQ5XI55jhcYPdjyInICe5Zd3h3hqAQFzEKC0sxx7qk=
X-Received: by 2002:a02:3909:: with SMTP id l9mr70875jaa.10.1589487974896;
 Thu, 14 May 2020 13:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200514194721.848173-1-trevor.gamblin@windriver.com>
In-Reply-To: <20200514194721.848173-1-trevor.gamblin@windriver.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Thu, 14 May 2020 13:26:03 -0700
Message-ID: <CANx9H-BCGRuZd2uZDb54UGqGGcmUGTpUvTfxtPqnzOKcTCL8jg@mail.gmail.com>
Subject: Re: [meta-python][PATCH] meta-python: add self as maintainer
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: derek@asterius.io, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001e56ee05a5a1825e"

--0000000000001e56ee05a5a1825e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I=E2=80=99ve discussed privately with Trevor previously.
He has already made many solid contributions and his assistance should be
recognized.

On Thu, May 14, 2020 at 12:48 PM Trevor Gamblin <
trevor.gamblin@windriver.com> wrote:

> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>


Acked-by: Tim Orling <ticotimo@gmail.com>

>
> ---
>  meta-python/README | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-python/README b/meta-python/README
> index 705b035d9..ca0a290d9 100644
> --- a/meta-python/README
> +++ b/meta-python/README
> @@ -46,4 +46,5 @@ Maintenance
>  Layer Maintainers:
>          Tim "moto-timo" Orling <TicoTimo@gmail.com>
>          Derek Straka <derek@asterius.io>
> +        Trevor Gamblin <trevor.gamblin@windriver.com>
>
> --
> 2.25.4
>
>

--0000000000001e56ee05a5a1825e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">I=E2=80=99ve discussed privately with Trevor previou=
sly.</div></div><div dir=3D"auto">He has already made many solid contributi=
ons and his assistance should be recognized.</div><div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 14, 2020 at 12=
:48 PM Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windriver.com">t=
revor.gamblin@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@=
windriver.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;</bloc=
kquote><div dir=3D"auto"><br></div><div dir=3D"auto">Acked-by: Tim Orling &=
lt;<a href=3D"mailto:ticotimo@gmail.com">ticotimo@gmail.com</a>&gt;</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><br>
---<br>
=C2=A0meta-python/README | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta-python/README b/meta-python/README<br>
index 705b035d9..ca0a290d9 100644<br>
--- a/meta-python/README<br>
+++ b/meta-python/README<br>
@@ -46,4 +46,5 @@ Maintenance<br>
=C2=A0Layer Maintainers:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Tim &quot;moto-timo&quot; Orling &lt;<a h=
ref=3D"mailto:TicoTimo@gmail.com" target=3D"_blank">TicoTimo@gmail.com</a>&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Derek Straka &lt;<a href=3D"mailto:derek@=
asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Trevor Gamblin &lt;<a href=3D"mailto:trevor.ga=
mblin@windriver.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;=
<br>
<br>
-- <br>
2.25.4<br>
<br>
</blockquote></div></div>

--0000000000001e56ee05a5a1825e--
