Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2BCCD1284
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 17:11:53 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.712.1712077908835750584
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Apr 2024 10:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout02.t-online.de (Postfix) with SMTP id DDB751E3B3;
	Tue,  2 Apr 2024 19:11:46 +0200 (CEST)
Received: from [192.168.178.67] ([84.154.174.110]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rrhfj-2GkZ4i0; Tue, 2 Apr 2024 19:11:43 +0200
Date: Tue, 02 Apr 2024 19:11:55 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] Reproducibility of mesa with opencl feature enabled
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <VRRBBS.I1HHBM2I9ZGU3@t-online.de>
In-Reply-To: <CAMKF1sp7G0spAO3xz6M=gAh5XvMe+TgJBLHOsaFwxBXdhJw5vg@mail.gmail.com>
References: <KEOBBS.B6BGV9A2K5PV@t-online.de>
	<CAMKF1sp7G0spAO3xz6M=gAh5XvMe+TgJBLHOsaFwxBXdhJw5vg@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-ahIJlTaEW4h+lHgXLUnE"
X-TOI-EXPURGATEID: 150726::1712077903-09FF8923-20846CDA/0/0 CLEAN NORMAL
X-TOI-MSGID: c68993db-47d0-4c0f-862b-6a3d57c42b28
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 17:11:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109785

--=-ahIJlTaEW4h+lHgXLUnE
Content-Type: text/plain; charset=us-ascii; format=flowed

On Tue, Apr 2 2024 at 10:06:55 AM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> Can we inject LLVM_LIBRARY_DIR from recipe ?

Not in a direct way. Unfortunately only with patch or sed


--=-ahIJlTaEW4h+lHgXLUnE
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Tue, Apr 2 2024 at 10:06:55 AM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Can we inject LLVM_LIBRARY_DIR from recipe ?</div></blockquote><div><br></div><div>Not in a direct way. Unfortunately only with patch or sed</div></div>
--=-ahIJlTaEW4h+lHgXLUnE--


