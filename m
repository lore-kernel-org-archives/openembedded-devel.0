Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A20C7C71133
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 06:09:23 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.7641.1692943756498384709
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 23:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout04.t-online.de (Postfix) with SMTP id 075EB151D2
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 08:08:53 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.164.212]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZQ02-0qZunQ0; Fri, 25 Aug 2023 08:08:51 +0200
Date: Fri, 25 Aug 2023 08:08:45 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 4/5] gnome-boxes: add rdepend on phodav
To: openembedded-devel@lists.openembedded.org
Message-Id: <LQNXZR.B5OZSWGSG25F@t-online.de>
In-Reply-To: <177E8A11BA8C6697.23833@lists.openembedded.org>
References: <20230825054449.2315061-1-f_l_k@t-online.de>
	<177E8A11BA8C6697.23833@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-TOWQipYs7CEWvCgOAfg6"
X-TOI-EXPURGATEID: 150726::1692943731-9B685904-98F4C4A7/0/0 CLEAN NORMAL
X-TOI-MSGID: ddd7b6bc-e33b-47e9-8818-f8f0ac235b6d
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 06:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104597

--=-TOWQipYs7CEWvCgOAfg6
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Aug 25 2023 at 07:44:48 AM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> changed

This patch shouldn't be applied. phodav is only needed on the guest 
system so installing it with gnome-boxes is nonsense.


--=-TOWQipYs7CEWvCgOAfg6
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Aug 25 2023 at 07:44:48 AM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">changed</div></blockquote><div><br></div><div>This patch shouldn't be applied. phodav is only needed on the guest system so installing it with gnome-boxes is nonsense.</div></div>
--=-TOWQipYs7CEWvCgOAfg6--


