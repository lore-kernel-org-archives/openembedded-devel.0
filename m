Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C073C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 14:08:00 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.53216.1742220472652807498
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Mar 2025 07:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout02.t-online.de (Postfix) with SMTP id C6855E5F;
	Mon, 17 Mar 2025 15:07:50 +0100 (CET)
Received: from [192.168.178.20] ([84.154.161.174]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tuB88-0Tz9f60; Mon, 17 Mar 2025 15:07:48 +0100
Date: Mon, 17 Mar 2025 15:08:30 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] libsdl3: add recipe
To: "Martin Jansa via lists.openembedded.org"
	<martin.jansa=gmail.com@lists.openembedded.org>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <6YT9TS.YS0RC8OOHV0C2@t-online.de>
In-Reply-To: <182D9870774557FF.29351@lists.openembedded.org>
References: <182C5B28D7D9F838.16826@lists.openembedded.org>
	<AK92TS.Q739GCR1HSTF2@t-online.de>
	<CA+chaQcVqO2qSReiy5tgc4EKhsZxJKd823wdZj=BgoHYPDYLHw@mail.gmail.com>
	<182D9870774557FF.29351@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-s0llMg1atXwJj6ahqRtW"
X-TOI-EXPURGATEID: 150726::1742220468-9EFFB51F-9239599C/10/3626336762 SUSPECT URL
X-TOI-MSGID: 3251f821-bbe3-48c0-8b1a-57baabb0213a
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 14:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116027

--=-s0llMg1atXwJj6ahqRtW
Content-Type: text/plain; charset=us-ascii; format=flowed

For libsdl2-compat it looks like at least currently x11 (and also 
opengl) is required:
<https://github.com/libsdl-org/sdl2-compat/blob/4453e2d05881c3616af8ca71f7c4267c60f993d8/src/sdl2_compat.h#L1279>




--=-s0llMg1atXwJj6ahqRtW
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">For libsdl2-compat it looks like at least currently x11 (and also opengl) is required:<div><a href="https://github.com/libsdl-org/sdl2-compat/blob/4453e2d05881c3616af8ca71f7c4267c60f993d8/src/sdl2_compat.h#L1279">https://github.com/libsdl-org/sdl2-compat/blob/4453e2d05881c3616af8ca71f7c4267c60f993d8/src/sdl2_compat.h#L1279</a></div><div><br></div><div><br></div></div>
--=-s0llMg1atXwJj6ahqRtW--


