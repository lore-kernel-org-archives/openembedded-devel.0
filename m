Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C4DEC54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 21:30:12 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.34684.1747949408275485876
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 May 2025 14:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout06.t-online.de (Postfix) with SMTP id 0F10F1C6B;
	Thu, 22 May 2025 23:30:06 +0200 (CEST)
Received: from [192.168.178.20] ([84.154.171.126]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uIDUK-2MUOMS0; Thu, 22 May 2025 23:30:04 +0200
Date: Thu, 22 May 2025 23:29:59 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] libsdl2-compat: use nonarch_libdir
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <ZDMOWS.3FCY125573503@t-online.de>
In-Reply-To: <CAMKF1soZntLZtMrPaC1ro1qMHiNBBXmArJfaddM2ykBP6Zv+1w@mail.gmail.com>
References: <20250521151544.3831931-1-f_l_k@t-online.de>
	<CAMKF1soZntLZtMrPaC1ro1qMHiNBBXmArJfaddM2ykBP6Zv+1w@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-gnfdKPXvv19vUT/Z1ftF"
X-TOI-EXPURGATEID: 150726::1747949404-E2FFB4C7-393E775D/0/0 CLEAN NORMAL
X-TOI-MSGID: 92ae2416-1548-48ef-91f3-45612e57620e
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 21:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117597

--=-gnfdKPXvv19vUT/Z1ftF
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, May 22 2025 at 07:30:27 -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> Can you check if sdl2.pc is identical in both multilib builds ?

Checked it. This patch seems pointless and can be ignored


--=-gnfdKPXvv19vUT/Z1ftF
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, May 22 2025 at 07:30:27 -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Can you check if sdl2.pc is identical in both multilib builds ?</div></blockquote><div><br></div><div>Checked it. This patch seems pointless and can be ignored</div></div>
--=-gnfdKPXvv19vUT/Z1ftF--


