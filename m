Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EF9C2BA18
	for <webhook@archiver.kernel.org>; Sat, 16 Sep 2023 17:54:24 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.16320.1694886858661057381
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Sep 2023 10:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout02.t-online.de (Postfix) with SMTP id A94461967E;
	Sat, 16 Sep 2023 19:54:16 +0200 (CEST)
Received: from [192.168.178.62] ([79.219.224.246]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qhZUk-1LzL9s0; Sat, 16 Sep 2023 19:54:14 +0200
Date: Sat, 16 Sep 2023 19:54:08 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 1/2] libxmlb: update 0.3.10 -> 0.3.14
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <82B31S.YU1GR8WCHOBJ2@t-online.de>
In-Reply-To: <CAMKF1sooHk8k4nbdfsdZ-V=6mhyf_sZpNEPaq0U5Yo9HLSmoMQ@mail.gmail.com>
References: <20230908114242.1417439-1-f_l_k@t-online.de>
	<CAMKF1srwFz8JWPDE+0Xn4UzveanO5-FhyL5OUTsGeJOrVCqe0g@mail.gmail.com>
	<CAMKF1sooHk8k4nbdfsdZ-V=6mhyf_sZpNEPaq0U5Yo9HLSmoMQ@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-WygTGdbh9CQSj2d7yVkR"
X-TOI-EXPURGATEID: 150726::1694886854-0BFFCC62-D992203F/0/0 CLEAN NORMAL
X-TOI-MSGID: a4333f32-422a-465e-b939-a84f7e1941fe
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Sep 2023 17:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104905

--=-WygTGdbh9CQSj2d7yVkR
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sat, Sep 16 2023 at 09:00:29 AM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> We also see build QA hinting at this subsequent runtime error during 
> build

I've added a patch that should address both issues. With this I was 
able to sucessfully run the ptest


--=-WygTGdbh9CQSj2d7yVkR
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sat, Sep 16 2023 at 09:00:29 AM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">We also see build QA hinting at this subsequent runtime error during build
</div></blockquote><div><br></div><div>I've added a patch that should addr<span style="white-space: break-spaces;">e</span>ss both issues. With this I was able to sucessfully run the ptest</div></div>
--=-WygTGdbh9CQSj2d7yVkR--


