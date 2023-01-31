Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1481DC38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 18:58:07 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.2790.1675191480228150477
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 10:58:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout03.t-online.de (Postfix) with SMTP id CA28B6FC9;
	Tue, 31 Jan 2023 19:57:57 +0100 (CET)
Received: from [192.168.178.83] ([79.219.224.44]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pMvpN-0VWZdI0; Tue, 31 Jan 2023 19:57:57 +0100
Date: Tue, 31 Jan 2023 19:57:51 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 2/3] system-config-printer: add recipe
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Message-Id: <F06DPR.KWQFYVR9PX4L1@t-online.de>
In-Reply-To: 
	<CA+chaQevn5APTRFUKY-cR92siPkxnCpRxQxS8Vvz0+9Td5Ah6A@mail.gmail.com>
References: <20230131170848.367522-1-f_l_k@t-online.de>
	<20230131170848.367522-2-f_l_k@t-online.de>
	<CAMKF1soE_5+D+cg0zZRLUnB2fNqQaPu7mH4G_WYgdu4izGxN2g@mail.gmail.com>
	<6H5DPR.NKQBKFK7B6GJ2@t-online.de>
	<CA+chaQevn5APTRFUKY-cR92siPkxnCpRxQxS8Vvz0+9Td5Ah6A@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-o9YmNA81b9Ix7bBGqBu4"
X-TOI-EXPURGATEID: 150726::1675191477-11794992-ED7AB629/0/0 CLEAN NORMAL
X-TOI-MSGID: 5c530f27-ed59-4b3b-b40a-464547053895
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 18:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100886

--=-o9YmNA81b9Ix7bBGqBu4
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Di, 31. Jan 2023 um 19:53:45 +0100 schrieb Martin Jansa 
<Martin.Jansa@gmail.com>:
> Doesn't python3-core in RDEPENDS:${PN} resolve that?

nice, it does :)


--=-o9YmNA81b9Ix7bBGqBu4
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Di, 31. Jan 2023 um 19:53:45 +0100 schrieb Martin Jansa &lt;Martin.Jansa@gmail.com&gt;:<br><blockquote type="cite">Doesn't python3-core in RDEPENDS:${PN} resolve that?</blockquote><div><br></div><div>nice, it does :)</div></div>
--=-o9YmNA81b9Ix7bBGqBu4--


