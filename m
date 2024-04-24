Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE30C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 15:13:47 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.19232.1713971624788817732
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Apr 2024 08:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout09.t-online.de (Postfix) with SMTP id C8128378C8;
	Wed, 24 Apr 2024 17:13:40 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.39.163]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rzeJY-1pRUx60; Wed, 24 Apr 2024 17:13:40 +0200
Date: Wed, 24 Apr 2024 17:14:04 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 1/3] gupnp: dont package source
To: Khem Raj <raj.khem@gmail.com>
Cc: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
Message-Id: <GZCGCS.7L0JATLUHBTN3@t-online.de>
In-Reply-To: <CAMKF1so6r93QEzxrMV_j5EieO_vvbLkC0PgfBSmrh2K2SqqoQA@mail.gmail.com>
References: <20240424132329.2706-1-f_l_k@t-online.de>
	<CAMKF1so6r93QEzxrMV_j5EieO_vvbLkC0PgfBSmrh2K2SqqoQA@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-dej1QKKv6QX7jAUfQGah"
X-TOI-EXPURGATEID: 150726::1713971620-E67A7DDA-B9DA45C7/0/0 CLEAN NORMAL
X-TOI-MSGID: cbd98c9f-b831-4c27-b206-158fc1019067
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 15:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110132

--=-dej1QKKv6QX7jAUfQGah
Content-Type: text/plain; charset=us-ascii; format=flowed

On Wed, Apr 24 2024 at 04:40:21 PM +02:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> Can we root cause it instead ? Removing sources from debug info might 
> fix this issue but degrade debugging experience

I will take a look at it


--=-dej1QKKv6QX7jAUfQGah
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Wed, Apr 24 2024 at 04:40:21 PM +02:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite">Can we root cause it instead ? Removing sources from debug info might fix this issue but degrade debugging experience&nbsp;</blockquote><div><br></div><div>I will take a look at it</div></div>
--=-dej1QKKv6QX7jAUfQGah--


