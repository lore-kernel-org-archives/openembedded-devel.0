Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6771FC4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 20:14:25 +0000 (UTC)
Received: from so254-41.mailgun.net (so254-41.mailgun.net [198.61.254.41])
 by mx.groups.io with SMTP id smtpd.web11.4324.1705090463385061201
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 12:14:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@asterius.io header.s=mailo header.b=caRc4RSM;
 spf=pass (domain: asterius.io, ip: 198.61.254.41, mailfrom: bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io;
 q=dns/txt; s=mailo; t=1705090462; x=1705097662; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=NhmpYbpb3jIMfRJfR9LQFO+IzjWuWdPPXGWyIBndiKs=;
 b=caRc4RSMEMuV0JlltJP309IIdZoXviInd9KbOuXV8eVlPbikeKoDwUX6vI0mfUiZc2G9tTochyBOTIT+GZNQDJQ+sx5bWTCP5OeylhBsupC4TE+ZPrjX0Jx8gfDNVpyIvpkVc/iB1CaQHCgcV6QtHGUkoxSBs/dl9jyjrBWNmis=
X-Mailgun-Sending-Ip: 198.61.254.41
X-Mailgun-Sid: WyIzN2NkMyIsIm9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwiM2E1Njg1Il0=
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53]) by
 f085c903c522 with SMTP id 65a19d9e646052fdabd97db5 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Fri, 12 Jan 2024 20:14:22 GMT
Sender: derek@asterius.io
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a28bf46ea11so1200694566b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 12:14:22 -0800 (PST)
X-Gm-Message-State: AOJu0Yxj0Jax7I1PU8CnbG3YyzG+yNYYCN/httFPGYuExmSTCHA+41yA
	7WhybankpdjZdZSEdZ1VwgaBaHx8LPaBe7BUyLc=
X-Google-Smtp-Source: AGHT+IERl992drMi8KlLJkixckxG765lSyVR3dzX5JclpaXwjh5HbJBl/moFyz2bwPWmr9Q1OOwG1SFOVF8JFZ2V9+Y=
X-Received: by 2002:a17:907:8692:b0:a29:b898:93cc with SMTP id
 qa18-20020a170907869200b00a29b89893ccmr3223128ejc.28.1705090461735; Fri, 12
 Jan 2024 12:14:21 -0800 (PST)
MIME-Version: 1.0
References: <20240112191944.3025922-1-derek@asterius.io> <CAOMZO5BfN63x0Hf8M6Sdgnms2=zgfexX0-8AqOAcDDi2D8AinA@mail.gmail.com>
In-Reply-To: <CAOMZO5BfN63x0Hf8M6Sdgnms2=zgfexX0-8AqOAcDDi2D8AinA@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 12 Jan 2024 14:14:10 -0600
X-Gmail-Original-Message-ID: <CADNbA1odQCYwP+vd3rOmMA2_e9DQWjH56kVUQKwZXUazZszaFg@mail.gmail.com>
Message-ID: <CADNbA1odQCYwP+vd3rOmMA2_e9DQWjH56kVUQKwZXUazZszaFg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python-4.8.2: update to version 4.8.2
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000481ff8060ec54ff1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 20:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108254

--000000000000481ff8060ec54ff1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes!  Got distracted.  Resent a v2

On Fri, Jan 12, 2024 at 1:23=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:

> On Fri, Jan 12, 2024 at 4:19=E2=80=AFPM Derek Straka <derek@asterius.io> =
wrote:
> >
> > Signed-off-by: Derek Straka <derek@asterius.io>
>
> Maybe change the Subject to:
>
> python3-engineio: update to version 4.8.2
>

--000000000000481ff8060ec54ff1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes!=C2=A0 Got distracted.=C2=A0 Resent a v2</div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 12=
, 2024 at 1:23=E2=80=AFPM Fabio Estevam &lt;<a href=3D"mailto:festevam@gmai=
l.com">festevam@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Fri, Jan 12, 2024 at 4:19=E2=80=AFPM Derek Stra=
ka &lt;<a href=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asteriu=
s.io</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io" t=
arget=3D"_blank">derek@asterius.io</a>&gt;<br>
<br>
Maybe change the Subject to:<br>
<br>
python3-engineio: update to version 4.8.2<br>
</blockquote></div>

--000000000000481ff8060ec54ff1--

