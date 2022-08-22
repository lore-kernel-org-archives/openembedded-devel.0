Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC500C32772
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 15:48:35 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web08.19841.1661183307317855068
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 08:48:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 3EABD4D03;
	Mon, 22 Aug 2022 17:48:25 +0200 (CEST)
Received: from [192.168.178.83] ([84.154.174.226]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oQ9f5-3wReWu0; Mon, 22 Aug 2022 17:48:23 +0200
Date: Mon, 22 Aug 2022 17:48:17 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCHv7] pipewire: update to v0.3.56
To: Khem Raj <raj.khem@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-devel@lists.openembedded.org
Message-Id: <H8X0HR.QCRTTK2ME0XI1@t-online.de>
In-Reply-To: 
	<CAMKF1sr+5CqvUjPiaX0n4h1+Dxs7fRGibeWD=GjTYC49GHRZSQ@mail.gmail.com>
References: <20220820191150.5699-1-f_l_k@t-online.de>
	<52f6ee030dbf4e88a86e3702a5303d57@axis.com>
	<DMXYGR.GU3KE5WIU42D1@t-online.de>
	<301d7b0dabda40eba9b037c87a8fbd4e@axis.com>
	<CAMKF1sr+5CqvUjPiaX0n4h1+Dxs7fRGibeWD=GjTYC49GHRZSQ@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-nXYcOKuz7pyMFQcy3eOy"
X-TOI-EXPURGATEID: 150726::1661183303-0144CE29-8E201E8F/0/0 CLEAN NORMAL
X-TOI-MSGID: 783b77ad-9323-4591-a559-7089a1147230
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Aug 2022 15:48:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98368

--=-nXYcOKuz7pyMFQcy3eOy
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 22. Aug 2022 um 07:14:06 -0700 schrieb Khem Raj 
<raj.khem@gmail.com>:
> I think we should not introduce distro feature here but propose it in 
> core first and after that make the change if agreed upon

No, of course not. If these DISTRO_FEATURES were both not used before, 
they should not be introduced here. I have changed the patches again 
and removed the DISTRO_FEATURE


--=-nXYcOKuz7pyMFQcy3eOy
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 22. Aug 2022 um 07:14:06 -0700 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type="cite">I think we should not introduce distro feature here but propose it in core first and after that make the change if agreed upon&nbsp;</blockquote><div><br></div><div>No, of course not. If these DISTRO_FEATURES were both not used before, they should not be introduced here. I have changed the patches again and removed the DISTRO_FEATURE</div></div>
--=-nXYcOKuz7pyMFQcy3eOy--


