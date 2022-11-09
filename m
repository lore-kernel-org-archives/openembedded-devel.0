Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46F6C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 13:11:10 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.3026.1667999465934529975
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Nov 2022 05:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout03.t-online.de (Postfix) with SMTP id 147757463;
	Wed,  9 Nov 2022 14:10:34 +0100 (CET)
Received: from [192.168.178.128] ([84.163.39.174]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oskqa-49CVBg0; Wed, 9 Nov 2022 14:10:28 +0100
Date: Wed, 09 Nov 2022 14:10:22 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] hwdata: allow to build native and nativesdk
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <AL03LR.GG123PSQ27573@t-online.de>
In-Reply-To: <D7B0F690-42BF-4D57-9A34-FB8650CBB7C7@arm.com>
References: <20221109093534.2718027-1-f_l_k@t-online.de>
	<D7B0F690-42BF-4D57-9A34-FB8650CBB7C7@arm.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-CwQSTACN2uLo+qVZDAT4"
X-TOI-EXPURGATEID: 150726::1667999428-4CC58B8C-A5E79C02/0/0 CLEAN NORMAL
X-TOI-MSGID: f64d4477-87fd-4939-acc2-859b955db1ab
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 13:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99497

--=-CwQSTACN2uLo+qVZDAT4
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

Am Mi, 9. Nov 2022 um 12:49:09 +0000 schrieb Ross Burton=20
<ross.burton@arm.com>:
> Why can=FFt wlroots use the target hwdata in the sysroot, if you=20
> DEPEND on hwdata?
>=20

<https://gitlab.freedesktop.org/wlroots/wlroots/-/commit/eec95e3d5e1a4f2e13=
b1f6b34cc287475ca57daf#f4c2841d6e753ee75c34eb9017589811c2f3d583_1_1>

They explicitly look for the native one.


--=-CwQSTACN2uLo+qVZDAT4
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Am Mi, 9. Nov 2022 um 12:49:09 +0000 sc=
hrieb Ross Burton &lt;ross.burton@arm.com&gt;:<br><blockquote type=3D"cite"=
><div class=3D"plaintext" style=3D"white-space: break-spaces;">Why can=FFt =
wlroots use the target hwdata in the sysroot, if you DEPEND on hwdata?

</div></blockquote><div><br></div><div><a href=3D"https://gitlab.freedeskto=
p.org/wlroots/wlroots/-/commit/eec95e3d5e1a4f2e13b1f6b34cc287475ca57daf#f4c=
2841d6e753ee75c34eb9017589811c2f3d583_1_1">https://gitlab.freedesktop.org/w=
lroots/wlroots/-/commit/eec95e3d5e1a4f2e13b1f6b34cc287475ca57daf#f4c2841d6e=
753ee75c34eb9017589811c2f3d583_1_1</a></div><div><br></div><div>They explic=
itly look for the native one.</div></div>
--=-CwQSTACN2uLo+qVZDAT4--


