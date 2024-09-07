Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B65ECE569
	for <webhook@archiver.kernel.org>; Sat,  7 Sep 2024 20:05:40 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.15744.1725739532473793419
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Sep 2024 13:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout05.t-online.de (Postfix) with SMTP id 93806145AA;
	Sat,  7 Sep 2024 22:05:30 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.32.86]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sn1gW-1aSbk80; Sat, 7 Sep 2024 22:05:28 +0200
Date: Sat, 07 Sep 2024 22:06:56 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] iwd: use internal ell
To: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
Message-Id: <K7LGJS.PHRO19PESZM61@t-online.de>
In-Reply-To: <CAMKF1srknG+hwSXAn5A2uoV1ZhOBqCyzL5yubt=-u6rTzDgVeA@mail.gmail.com>
References: <20240907083446.80928-1-f_l_k@t-online.de>
	<CAMKF1sqt1BZt_frP-rbPVFzKz4QCo9LrTFVxHsRR9Kp1MjE+qA@mail.gmail.com>
	<CA+chaQdHMh6W920EHbHvE4UfrfDAacWS6C_4X8gsU=mahrkFAQ@mail.gmail.com>
	<RFGGJS.TVMQIX4IAUA23@t-online.de>
	<CAMKF1srknG+hwSXAn5A2uoV1ZhOBqCyzL5yubt=-u6rTzDgVeA@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-VQJo7KTbDUIjasRFaSjX"
X-TOI-EXPURGATEID: 150726::1725739528-A8FF75AD-679641FB/0/0 CLEAN NORMAL
X-TOI-MSGID: d5ccd7f9-65a1-4089-b99b-d7a849ce703b
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Sep 2024 20:05:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112119

--=-VQJo7KTbDUIjasRFaSjX
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sat, Sep 7 2024 at 12:56:04 PM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> If they think that
> it should be vendored in apps then thats what we should do

By default, all three known recipes that use ell are probably vendored 
by default. The --enable-external-ell option is set in the recipe for 
all of them.


--=-VQJo7KTbDUIjasRFaSjX
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sat, Sep 7 2024 at 12:56:04 PM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">If they think that
it should be vendored in apps then thats what we should do</div></blockquote><div><br></div><div>By default, all three known recipes that use ell are probably vendored by default. The --enable-external-ell option is set in the recipe for all of them.</div></div>
--=-VQJo7KTbDUIjasRFaSjX--


