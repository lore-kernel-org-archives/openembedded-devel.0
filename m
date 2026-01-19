Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD47CA5FF1
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 06:45:38 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30269.1768805128834169458
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jan 2026 22:45:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout03.t-online.de (Postfix) with SMTP id 97EBCE661;
	Mon, 19 Jan 2026 07:45:26 +0100 (CET)
Received: from [192.168.178.36] ([84.163.47.39]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vhj0w-0wYaiu0; Mon, 19 Jan 2026 07:45:26 +0100
Date: Mon, 19 Jan 2026 07:45:20 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-gnome][PATCHv4] gnome-session: update 47.0.1 -> 49.2
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel
	<openembedded-devel@lists.openembedded.org>
Message-Id: <KRM39T.YB24QIL0R4U21@t-online.de>
In-Reply-To: <CAMKF1sqckdq7nBh6k4Q00W76=9O49oLdKZTc_b=ASj-0DXa17g@mail.gmail.com>
References: <20260118134120.116239-1-f_l_k@t-online.de>
	<CAMKF1sqckdq7nBh6k4Q00W76=9O49oLdKZTc_b=ASj-0DXa17g@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-tMGtUH5cZ2fahZU07gne"
X-TOI-EXPURGATEID: 150726::1768805126-91FD2C6F-FD3C1E93/0/0 CLEAN NORMAL
X-TOI-MSGID: 32e08082-43e5-4181-b2fe-13386a795cba
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 06:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123585

--=-tMGtUH5cZ2fahZU07gne
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sun, Jan 18 2026 at 14:24:14 -08:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> e-session or gdm, they should also check for systemd distro feature 
> since the


I'll take a look at that. In the meantime, I found a silly c&p error in 
gnome-settings-daemon in the systemd PACKAGECONFIG. I'll send a v2 to 
fix that.


--=-tMGtUH5cZ2fahZU07gne
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sun, Jan 18 2026 at 14:24:14 -08:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite">e-session or gdm, they should also check for systemd distro feature since the</blockquote><div><br></div><div><br></div><div><span style="white-space-collapse: break-spaces;">I'll take a look at that. In the meantime, I found a silly c&amp;p error in gnome-settings-daemon in the systemd PACKAGECONFIG. I'll send a v2 to fix that.</span></div></div>
--=-tMGtUH5cZ2fahZU07gne--


