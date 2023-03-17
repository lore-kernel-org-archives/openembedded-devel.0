Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB3AC74A5B
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 18:00:09 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.26623.1679076001358617641
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Mar 2023 11:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout07.t-online.de (Postfix) with SMTP id 3F9E112458;
	Fri, 17 Mar 2023 18:59:59 +0100 (CET)
Received: from [192.168.178.83] ([79.219.227.8]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pdEMr-2MtgrQ0; Fri, 17 Mar 2023 18:59:53 +0100
Date: Fri, 17 Mar 2023 18:59:47 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] pipewire: update 0.3.66 ->
 0.3.67
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <NBFORR.MU3ZOWF0ZHV82@t-online.de>
In-Reply-To: 
	<CA+chaQdB=DO7NRErQXJqiO9oDvyGjh8HJTJoYh7enfsci1-Cfg@mail.gmail.com>
References: <20230313114130.144008-1-f_l_k@t-online.de>
	<CA+chaQdB=DO7NRErQXJqiO9oDvyGjh8HJTJoYh7enfsci1-Cfg@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-HLRLNMxA6xWpfXcHKoVJ"
X-TOI-EXPURGATEID: 150726::1679075993-C77EB4E4-9140FB8C/0/0 CLEAN NORMAL
X-TOI-MSGID: 1436ed26-b62a-4af7-8a73-5c52176b8fc2
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Mar 2023 18:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101592

--=-HLRLNMxA6xWpfXcHKoVJ
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Am Do, 16. M=E4r 2023 um 15:55:54 +0100 schrieb Martin Jansa=20
<Martin.Jansa@gmail.com>:
> | ../git/spa/meson.build:81:2: ERROR: Dependency "libcamera" not=20
> found, tried pkgconfig

Unfortunately nothing rings a bell for me here. libcamera is found for=20
my builds and I have not seen this problem yet. Is there a way to=20
reproduce? what layer are you using?


--=-HLRLNMxA6xWpfXcHKoVJ
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Am Do, 16. M=E4r 2023 um 15:55:54 +0100=
 schrieb Martin Jansa &lt;Martin.Jansa@gmail.com&gt;:<br><blockquote type=
=3D"cite">| ../git/spa/meson.build:81:2: ERROR: Dependency "libcamera" not =
found, tried pkgconfig</blockquote><div><br></div><div>Unfortunately nothin=
g rings a bell for me here. libcamera is found for my builds and I have not=
 seen this problem yet. Is there a way to reproduce? what layer are you usi=
ng?</div></div>
--=-HLRLNMxA6xWpfXcHKoVJ--


