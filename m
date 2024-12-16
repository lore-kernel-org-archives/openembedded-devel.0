Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBEE7E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 20:14:21 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.66316.1734380061195194380
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 12:14:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout07.t-online.de (Postfix) with SMTP id BA5CBF75;
	Mon, 16 Dec 2024 21:14:16 +0100 (CET)
Received: from [192.168.178.67] ([84.154.162.147]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tNHTq-4dl89w0; Mon, 16 Dec 2024 21:14:14 +0100
Date: Mon, 16 Dec 2024 21:14:22 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] libpeas: update 1.36.0 -> 2.0.5
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <Y7SLOS.86J6WO9IZ2GB2@t-online.de>
In-Reply-To: <CAMKF1srFAYctP2qWSh0SRTFHgjyHbECD_G2AvrGWqd3tyq3-Kg@mail.gmail.com>
References: <1811A85A00D6A22F.23577@lists.openembedded.org>
	<VX6LOS.3HWFQSO1SJD41@t-online.de>
	<CAMKF1srFAYctP2qWSh0SRTFHgjyHbECD_G2AvrGWqd3tyq3-Kg@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-uqw/BHTl5yGUa3gnf+Fd"
X-TOI-EXPURGATEID: 150726::1734380054-97FFC9BF-E8589757/0/0 CLEAN NORMAL
X-TOI-MSGID: 13a50aa2-7ef4-494f-88ab-87ef23356988
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 20:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114339

--=-uqw/BHTl5yGUa3gnf+Fd
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Dec 16 2024 at 09:47:39 AM -08:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> libpeas seems to be needed by meta-gnome only, so perhaps move this
> recipe to meta-gnome is the right thing to do.

We could also move gjs to meta-oe because it only pulls in mozjs-128 
and cairo. Both are also in meta-oe.


--=-uqw/BHTl5yGUa3gnf+Fd
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Dec 16 2024 at 09:47:39 AM -08:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">libpeas seems to be needed by meta-gnome only, so perhaps move this
recipe to meta-gnome is the right thing to do.
</div></blockquote><div><br></div><div>We could also move gjs to meta-oe because it only pulls in mozjs-128 and cairo. Both are also in meta-oe.</div></div>
--=-uqw/BHTl5yGUa3gnf+Fd--


