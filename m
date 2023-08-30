Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3543C6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 16:27:53 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.1837.1693412867160619104
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 09:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout11.t-online.de (Postfix) with SMTP id 57C9026782;
	Wed, 30 Aug 2023 18:27:45 +0200 (CEST)
Received: from [192.168.178.62] ([84.163.36.217]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qbO2e-0Wj5t20; Wed, 30 Aug 2023 18:27:40 +0200
Date: Wed, 30 Aug 2023 18:27:37 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 2/5] phodav: add recipe
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <1QP70S.LHZLRLJDOXUR1@t-online.de>
In-Reply-To: <CA+chaQcirkkrsQ=or+yEA1nu4SQbviwz-2h0dmSSbdXi27VeHw@mail.gmail.com>
References: <20230825054449.2315061-1-f_l_k@t-online.de>
	<20230825054449.2315061-2-f_l_k@t-online.de>
	<CA+chaQfBkvt2hPuRaoYNVOc8O2iY=mZUzp=e8s3vDYkgMc6QWw@mail.gmail.com>
	<PN270S.7RY9ZI8V292C2@t-online.de>
	<CA+chaQcirkkrsQ=or+yEA1nu4SQbviwz-2h0dmSSbdXi27VeHw@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-h/WqPRcV7MF1PKICD0eP"
X-TOI-EXPURGATEID: 150726::1693412860-F77EA704-5681AAB0/0/0 CLEAN NORMAL
X-TOI-MSGID: da603a2d-54ba-424c-978b-4db1a3cb38de
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 16:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104672

--=-h/WqPRcV7MF1PKICD0eP
Content-Type: text/plain; charset=us-ascii; format=flowed

On Wed, Aug 30 2023 at 05:02:00 PM +02:00:00, Martin Jansa 
<martin.jansa@gmail.com> wrote:
> but was there some 3/3 (possibly with fix for libosinfo?

Yes, 3/3 should have been the fix for libosinfo but it returned to 
sender. I've sent it once again


--=-h/WqPRcV7MF1PKICD0eP
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Wed, Aug 30 2023 at 05:02:00 PM +02:00:00, Martin Jansa &lt;martin.jansa@gmail.com&gt; wrote:<br><blockquote type="cite"> but was there some 3/3 (possibly with fix for libosinfo?</blockquote><div><br></div><div>Yes, 3/3 should have been the fix for libosinfo but it returned to sender. I've sent it once again</div></div>
--=-h/WqPRcV7MF1PKICD0eP--


