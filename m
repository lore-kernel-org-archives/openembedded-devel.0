Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9319CDB472
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 02:22:35 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9331.1763086950698147820
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 18:22:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout10.t-online.de (Postfix) with SMTP id 8C6BB38B6F;
	Fri, 14 Nov 2025 03:22:28 +0100 (CET)
Received: from [192.168.178.36] ([84.163.32.97]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vJjSF-0NggDI0; Fri, 14 Nov 2025 03:22:28 +0100
Date: Fri, 14 Nov 2025 03:22:22 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] fex: add recipe
To: "Khem Raj via lists.openembedded.org"
	<raj.khem=gmail.com@lists.openembedded.org>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <AL2P5T.3D8NSHCMJ63C2@t-online.de>
In-Reply-To: <CAMKF1srJz=zBHjUWNECb2OAn9Q6v0gV4YNkjoVefGz_yaSnENA@mail.gmail.com>
References: <20251114020447.2540986-1-f_l_k@t-online.de>
	<CAMKF1srJz=zBHjUWNECb2OAn9Q6v0gV4YNkjoVefGz_yaSnENA@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-y27EmPUiyoGzJh6emrJH"
X-TOI-EXPURGATEID: 150726::1763086948-A1FF947B-572589AE/0/0 CLEAN NORMAL
X-TOI-MSGID: 8abaa667-3769-4e72-9473-6f02a014d6a5
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 02:22:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121666

--=-y27EmPUiyoGzJh6emrJH
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Nov 13 2025 at 18:18:40 -08:00:00, Khem Raj via 
lists.openembedded.org <raj.khem=gmail.com@lists.openembedded.org> 
wrote:
> LDFLAGS += "-fuse-ld=lld"

Thanks. I will test if that works as well. I needed to set it to lld 
because by default it wanted to use gold linker and failed with file 
not found


--=-y27EmPUiyoGzJh6emrJH
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, Nov 13 2025 at 18:18:40 -08:00:00, Khem Raj via lists.openembedded.org &lt;raj.khem=gmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite">LDFLAGS&nbsp;+= "-fuse-ld=lld"</blockquote><div><br></div><div>Thanks. I will test if that works as well. I needed to set it to lld because by default it wanted to use gold linker and failed with file not found</div></div>
--=-y27EmPUiyoGzJh6emrJH--


