Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D92CD5BD0
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 12:14:24 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14621.1779711258714636140
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 May 2026 05:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=DObOJRoH;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout05.t-online.de (Postfix) with SMTP id 079F0279
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2026 14:13:50 +0200 (CEST)
Received: from [192.168.178.36] ([79.219.225.82]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wRUBp-3xklxQ0; Mon, 25 May 2026 14:13:49 +0200
Date: Mon, 25 May 2026 14:13:43 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 1/3] playerctl: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <VYDLFT.TSRTXA6REEGG@t-online.de>
In-Reply-To: <CADySD0GZTZpc7VpPmGd-k40X7iknMDu_kYQUcwnaP9HpMksUCw@mail.gmail.com>
References: <20260524125709.9164-1-f_l_k@t-online.de>
	<CADySD0GZTZpc7VpPmGd-k40X7iknMDu_kYQUcwnaP9HpMksUCw@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-u/bRSzz3SF2CHb6hFVpC"
X-TOI-EXPURGATEID: 150726::1779711229-9FFFC850-BAF5B8F9/0/0 CLEAN NORMAL
X-TOI-MSGID: 1a2fd77d-02a9-424d-8fcc-b48ccb69679e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1779711229; i=f_l_k@t-online.de;
	bh=rDRn6EUfqlwsr8QFRGld+VIQx5Dfsfk0M1u06N1kAXc=;
	h=Date:From:Subject:To:In-Reply-To:References;
	b=DObOJRoHfE/hMVyeJff+DCmUasZz8BB4JioYC8hIVdEdpE9kcb7srP2iK36Auvsxj
	 FjmVe55h0m9Vg/csMpLVpQj8kGwpH26bpbQ6EhLlAwl8DEcBJoiJCYs88miXyO6RCK
	 gcz326x+nbP1H7WvYeC3+GdUeQbz7akTde9f/MaypW/rBahRKW6RAQxC4e655ZBi9E
	 xvF9sjznMrqLsk9MDYcUGBYsQcAUwMS9EKOUBft2GZRhgmF9suYvZtj+arh5kwEcig
	 ftaIXSg/EI6QfbZduqgBzoMGvO9O/6xoDJ1DqUdTGCh72qj2zOGbnEDMFYsUQZbfDM
	 IqF0AyG0imc2g==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2026 12:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127199

--=-u/bRSzz3SF2CHb6hFVpC
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

On Mon, May 25 2026 at 17:12:09 +12:00:00, Ankur Tyagi via=20
lists.openembedded.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org>=20
wrote:
> Last release and commit was Sep 2021, is upstream still active?

You're right. The maintainer hasn't been active for the past five=20
years. However, I've been using the =E2=80=9Cplayerctl=E2=80=9D binary for =
many=20
years now without problems.
It has simply done what I expected it to do. Since it offers mpris=20
support for a wide range of programs such as browsers, vlc, spotify,=20
xmms, rhythmbox, mpd, mpv and so on,
it still has some significance, and most distributions continue to make=20
it available in their standard repositories.
That=E2=80=99s why I thought it might fit in meta-oe, but if you decide it=20
doesn=E2=80=99t meet the standard, I can of course keep it in meta-wayland.


--=-u/bRSzz3SF2CHb6hFVpC
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Mon, May 25 2026 at 17:12:09 +12:00:=
00, Ankur Tyagi via lists.openembedded.org &lt;ankur.tyagi85=3Dgmail.com@li=
sts.openembedded.org&gt; wrote:<br><blockquote type=3D"cite"><div class=3D"=
plaintext" style=3D"white-space: break-spaces;">Last release and commit was=
 Sep 2021, is upstream still active?</div></blockquote><div><br></div><div>=
<div>You're right. The maintainer hasn't been active for the past five year=
s. However, I've been using the =E2=80=9Cplayerctl=E2=80=9D binary for many=
 years now without problems.</div><div>It has simply done what I expected i=
t to do. Since it offers mpris support for a wide range of programs such as=
 browsers, vlc, spotify, xmms, rhythmbox, mpd, mpv and so on,</div><div>it =
still has some significance, and most distributions continue to make it ava=
ilable in their standard repositories.</div><div>That=E2=80=99s why I thoug=
ht it might fit in meta-oe, but if you decide it doesn=E2=80=99t meet the s=
tandard, I can of course keep it in meta-wayland.</div></div></div>
--=-u/bRSzz3SF2CHb6hFVpC--


