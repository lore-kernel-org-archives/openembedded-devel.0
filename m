Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63127C53210
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:52:12 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.47472.1673193128998556820
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:52:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout11.t-online.de (Postfix) with SMTP id 2A6D27F4E;
	Sun,  8 Jan 2023 16:52:06 +0100 (CET)
Received: from [192.168.178.83] ([79.219.228.124]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pEXxs-06GY6a0; Sun, 8 Jan 2023 16:52:04 +0100
Date: Sun, 08 Jan 2023 16:51:59 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 5/5] gnome-chess: import recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <N2C6OR.QDUZIZ9J0GBU3@t-online.de>
In-Reply-To: 
	<CAMKF1srmoqxmdWFs6Ga22kyFLS_Az6DWi+U=2Nj30mpF3xBfqg@mail.gmail.com>
References: <20230108130743.983639-1-f_l_k@t-online.de>
	<20230108130743.983639-5-f_l_k@t-online.de>
	<CAMKF1srmoqxmdWFs6Ga22kyFLS_Az6DWi+U=2Nj30mpF3xBfqg@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-1zt+9ONNeaNjVaGU61XG"
X-TOI-EXPURGATEID: 150726::1673193124-60A0E2DC-10B819AC/0/0 CLEAN NORMAL
X-TOI-MSGID: 609f9f59-33c7-4863-a883-e2b1a55d5972
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:52:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100475

--=-1zt+9ONNeaNjVaGU61XG
Content-Type: text/plain; charset=us-ascii; format=flowed

Am So, 8. Jan 2023 um 07:47:47 -0800 schrieb Khem Raj 
<raj.khem@gmail.com>:
> | error: Package `librsvg-2.0' not found in specified Vala API

librsvg needs to be built with vala support. I'll send a patch to 
oe-core for that


--=-1zt+9ONNeaNjVaGU61XG
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am So, 8. Jan 2023 um 07:47:47 -0800 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">| error: Package `librsvg-2.0' not found in specified Vala API</div></blockquote><div><br></div><div>librsvg needs to be built with vala support. I'll send a patch to oe-core for that</div></div>
--=-1zt+9ONNeaNjVaGU61XG--


