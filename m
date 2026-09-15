Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F82C88E73
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:49:21 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18156.1789458557973869446
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=tuDIbDuf;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout05.t-online.de (Postfix) with SMTP id 2100B343
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:49:16 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.162.202]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Nuk-1FEoim0; Tue, 15 Sep 2026 09:49:14 +0200
Date: Tue, 15 Sep 2026 09:49:08 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 31/31] gnome-chess: upgrade 50.0 -> 50.1
To: openembedded-devel@lists.openembedded.org
Message-Id: <W1BELT.TUQSK87ZIZYP1@t-online.de>
In-Reply-To: <18D56ECF31D6F003.1847987@lists.openembedded.org>
References: <20260915074347.6003-1-f_l_k@t-online.de>
	<18D56ECF31D6F003.1847987@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-fDXMdZOiI/g18z3p5UqX"
X-TOI-EXPURGATEID: 150726::1789458554-E67FB9A2-9E828F46/0/0 CLEAN NORMAL
X-TOI-MSGID: 52a0be0f-2f42-4f4e-8cb2-0ac904c19bb8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458556; i=f_l_k@t-online.de;
	bh=AmRDKufRWqa66o9CpQX5FffTwgwxIDeOD3rqjoqPa5E=;
	h=Date:From:Subject:To:In-Reply-To:References;
	b=tuDIbDuf1YY1w+d6rv9nmBX9+jo/BDGvm6aTqgAUqnj2oez6gr535W5CqKAsin1UO
	 a8RHg3qyt/s4KWpt1dtKt/dJJHxjIPe2lkGi5Q65dsxQ+qog8MJ8WCkdfRlMMKAHXY
	 sn4JeNMoUfBD22F8dZZpl36obCWC3nYhLMws5ybWvYTEB3Enp+gIfcl7WFNNcz0RxG
	 bYrI1tLjThcrrrvbdzTj64SQsucDf61pnxIGuRZYgkb0h6QmE/Cpr1vaCtMK8MgSbV
	 TaK5OF7TYQJ3JfJV8JJKtXdChFCwomuwWRXEmqxhLvbPftjRt/QjtFTTqOyVKlUh2J
	 D/tyEsozk63uw==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130067

--=-fDXMdZOiI/g18z3p5UqX
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: quoted-printable

All of these should be buildable with the current oe-core master except=20
for mutter, which requires the =91gsettings-desktop-schemas=92 update=20
from oe-core master-next
and have also been runtime-tested. Still missing are=20
gnome-control-center-51 and nautilus-51 because they would require a=20
glib-2.0 and libadwaita bump in oe-core.


--=-fDXMdZOiI/g18z3p5UqX
Content-Type: text/html; charset=windows-1251
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>All of these should be buildable w=
ith the current oe-core master except for mutter, which requires the =91gse=
ttings-desktop-schemas=92 update from oe-core master-next</div><div>and hav=
e also been runtime-tested. Still missing are gnome-control-center-51 and n=
autilus-51 because they would require a glib-2.0 and libadwaita bump in oe-=
core.</div></div>
--=-fDXMdZOiI/g18z3p5UqX--


