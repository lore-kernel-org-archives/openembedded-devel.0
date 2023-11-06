Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3770C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:44:39 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.50908.1699267469894363733
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 02:44:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout07.t-online.de (Postfix) with SMTP id 2EE864B393;
	Mon,  6 Nov 2023 11:44:22 +0100 (CET)
Received: from [192.168.178.62] ([79.219.229.73]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qzx5f-1uaTgW0; Mon, 6 Nov 2023 11:44:20 +0100
Date: Mon, 06 Nov 2023 11:44:47 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 2/2] libchamplain: Upgrade 0.12.20 ->
 0.12.21
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <N67P3S.FPIQZBXVEJXA1@t-online.de>
In-Reply-To: <25a84986-1752-41ab-bfce-cbbf48012c43@smile.fr>
References: <20231106102411.58424-1-f_l_k@t-online.de>
	<20231106102411.58424-2-f_l_k@t-online.de>
	<25a84986-1752-41ab-bfce-cbbf48012c43@smile.fr>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-IU+yiNUbUpccFREJG93X"
X-TOI-EXPURGATEID: 150726::1699267460-F914733D-DDBFFAEC/0/0 CLEAN NORMAL
X-TOI-MSGID: 69baa165-171f-4d06-bbf0-99cd03a491ce
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 10:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106410

--=-IU+yiNUbUpccFREJG93X
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Nov 6 2023 at 11:29:44 AM +01:00:00, Yoann Congal 
<yoann.congal@smile.fr> wrote:
> Just by curiosity, do you use the auto upgrade helper (AUH) output to 
> do this?

Hi Yoann,
I'm not doing automated updates because I always want to have a look at 
the NEWS file and possible changes in the buildsystem . Usually I also 
verify that updates don't break runtime for me before sending them out.
But I found the AUH update report quite useful to see what needs to be 
done.


--=-IU+yiNUbUpccFREJG93X
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Nov 6 2023 at 11:29:44 AM +01:00:00, Yoann Congal &lt;yoann.congal@smile.fr&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Just by curiosity, do you use the auto upgrade helper (AUH) output to do this?</div></blockquote><div><br></div><div>Hi Yoann,</div><div>I'm not doing automated updates because I always want to have a look at the NEWS file and possible changes in the buildsystem . Usually I also verify that updates don't break runtime for me before sending them out.</div><div>But I found the AUH<span style="white-space: break-spaces;"> update report quite useful to see what needs to be done.</span></div></div>
--=-IU+yiNUbUpccFREJG93X--


