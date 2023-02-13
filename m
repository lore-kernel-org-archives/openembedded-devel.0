Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F53C636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 09:31:07 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.10641.1676280659633711964
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Feb 2023 01:30:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id 0D5516E71;
	Mon, 13 Feb 2023 10:30:53 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.111]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pRVAh-2QtAsS0; Mon, 13 Feb 2023 10:30:51 +0100
Date: Mon, 13 Feb 2023 10:30:46 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 1/2] fwupd: fix polkit rules.d permissions
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <AFI0QR.WGVEKDS29BLY2@t-online.de>
In-Reply-To: 
	<CAMKF1so3nbre37cM3R0SNwmf5-DuYQjMrHeCnyJR3kDK=DK6qg@mail.gmail.com>
References: <20230212170320.284295-1-f_l_k@t-online.de>
	<CAMKF1so3nbre37cM3R0SNwmf5-DuYQjMrHeCnyJR3kDK=DK6qg@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-3x+HRZDZh6bXGZk3Aw38"
X-TOI-EXPURGATEID: 150726::1676280651-81AEBD99-679D520C/0/0 CLEAN NORMAL
X-TOI-MSGID: 0fe85ff7-1ed6-4b6c-a905-4b8b415f1587
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Feb 2023 09:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101067

--=-3x+HRZDZh6bXGZk3Aw38
Content-Type: text/plain; charset=us-ascii; format=flowed

Am So, 12. Feb 2023 um 21:48:10 -0800 schrieb Khem Raj 
<raj.khem@gmail.com>:
> it seems to fail in do_install

I've sent a v2 that changes the permissions only if polkit is enabled. 
That should hopefully fix the do_install issue.


--=-3x+HRZDZh6bXGZk3Aw38
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am So, 12. Feb 2023 um 21:48:10 -0800 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">it seems to fail in do_install</div></blockquote><div><br></div><div>I've sent a v2 that changes the permissions only if polkit is enabled. That should hopefully fix the do_install issue.</div></div>
--=-3x+HRZDZh6bXGZk3Aw38--


