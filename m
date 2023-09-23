Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAD1CE7A88
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 14:55:30 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.22154.1695480922879182434
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Sep 2023 07:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout02.t-online.de (Postfix) with SMTP id 88FE32B9AC;
	Sat, 23 Sep 2023 16:55:20 +0200 (CEST)
Received: from [192.168.178.62] ([84.163.34.192]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qk42O-2RDFRo0; Sat, 23 Sep 2023 16:55:16 +0200
Date: Sat, 23 Sep 2023 16:55:13 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 2/2] gedit: Upgrade 44.2 -> 46.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <1G1G1S.VYMS5H1MDXEC@t-online.de>
In-Reply-To: <17878E96258F9244.31286@lists.openembedded.org>
References: <20230923012830.3338338-1-f_l_k@t-online.de>
	<20230923012830.3338338-2-f_l_k@t-online.de>
	<CAMKF1sro9-orWKQZz1wRSLL4+WT=D8LYuUz5Vv1=PkPFd6k3PA@mail.gmail.com>
	<17878E96258F9244.31286@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-6Z2YPK880Eg22FUikWOU"
X-TOI-EXPURGATEID: 150726::1695480916-26196295-9BD5969C/0/0 CLEAN NORMAL
X-TOI-MSGID: 0f92ddba-267f-407f-abe7-1a64297e4427
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 14:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105093

--=-6Z2YPK880Eg22FUikWOU
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sat, Sep 23 2023 at 04:49:11 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Not for now. I'll do a bitbake -c cleansstate libgedit-gtksourceview

After cleansstate I also have this message.


--=-6Z2YPK880Eg22FUikWOU
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sat, Sep 23 2023 at 04:49:11 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div>Not for now. I'll do a bitbake -c cleansstate&nbsp;libgedit-gtksourceview</div><div></div></blockquote><div><br></div><div>After cleansstate I also have this message.</div></div>
--=-6Z2YPK880Eg22FUikWOU--


