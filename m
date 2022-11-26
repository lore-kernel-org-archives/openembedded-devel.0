Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F92C43217
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 21:36:49 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.79360.1669498600292969062
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Nov 2022 13:36:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout08.t-online.de (Postfix) with SMTP id 9FBEE9A65
	for <openembedded-devel@lists.openembedded.org>; Sat, 26 Nov 2022 22:36:38 +0100 (CET)
Received: from [192.168.178.83] ([79.219.224.10]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oz2qi-17mZVY0; Sat, 26 Nov 2022 22:36:37 +0100
Date: Sat, 26 Nov 2022 22:36:31 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-gnome][PATCH 1/4] geary: use gtk4 by default
To: openembedded-devel@lists.openembedded.org
Message-Id: <VC5ZLR.0OXLLJADGP0F1@t-online.de>
In-Reply-To: <20221126131612.1435270-1-f_l_k@t-online.de>
References: <20221126131612.1435270-1-f_l_k@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-UfRbQ0TLxgfpuT4IP0e+"
X-TOI-EXPURGATEID: 150726::1669498597-EEFF2A26-3BC81954/0/0 CLEAN NORMAL
X-TOI-MSGID: 6ee57d14-fa34-4b31-a98c-21792d87798f
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Nov 2022 21:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99751

--=-UfRbQ0TLxgfpuT4IP0e+
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Sa, 26. Nov 2022 um 14:16:09 +0100 schrieb Markus Volk 
<f_l_k@t-online.de>:
>  meta-gnome/recipes-connectivity/geary/geary_43.0.bb | 2 +-

The geary patch is wrong. I updated gnome-shell this afternoon and  
needed to update some more gnome recipes.
I think its best to drop this 4 patches. I'll send a v2 and will 
include them.

Will be quite an invasive change and also would need patching in 
oe-core. No hurry for merging them.


--=-UfRbQ0TLxgfpuT4IP0e+
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Sa, 26. Nov 2022 um 14:16:09 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;"> meta-gnome/recipes-connectivity/geary/geary_43.0.bb | 2 +-</div></blockquote><div><br></div><div><div>The geary patch is wrong. I updated gnome-shell this afternoon and &nbsp;needed to update some more gnome recipes.</div><div>I think its best to drop this 4 patches. I'll send a v2 and will include them.</div><div><br></div><div>Will be quite an invasive change and also would need patching in oe-core. No hurry for merging them.</div></div></div>
--=-UfRbQ0TLxgfpuT4IP0e+--


