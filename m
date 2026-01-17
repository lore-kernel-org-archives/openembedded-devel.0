Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE7AC98314
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 08:55:18 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5375.1768640110540997505
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 00:55:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout01.t-online.de (Postfix) with SMTP id 2109A1CB43;
	Sat, 17 Jan 2026 09:55:08 +0100 (CET)
Received: from [192.168.178.36] ([79.219.237.165]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vh25K-47lgOG0; Sat, 17 Jan 2026 09:55:06 +0100
Date: Sat, 17 Jan 2026 09:55:00 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCH] xdg-desktop-portal-wlr: update
 0.7.0 -> 0.8.1
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <OF309T.INVXHWIQ3QWN2@t-online.de>
In-Reply-To: <CADySD0FQ1TaSHvtcs+7ksBe5NJTmd0VepTnYOYie44T112G9tw@mail.gmail.com>
References: <20260116075959.111147-1-f_l_k@t-online.de>
	<CADySD0FQ1TaSHvtcs+7ksBe5NJTmd0VepTnYOYie44T112G9tw@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-u+jOoIgd9031j/xQuQ8I"
X-TOI-EXPURGATEID: 150726::1768640106-95FF89BB-7B9C5B83/0/0 CLEAN NORMAL
X-TOI-MSGID: 4ab74db8-dc7b-4b3a-8ad9-3f90a55adac3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 08:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123545

--=-u+jOoIgd9031j/xQuQ8I
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sat, Jan 17 2026 at 21:49:25 +13:00:00, Ankur Tyagi via 
lists.openembedded.org <ankur.tyagi85=gmail.com@lists.openembedded.org> 
wrote:
> can please also include tag=v${PV} in the SRC_URI

I guess that will not work since as said the SRCREV is set two commits 
ahead of the release. If this is really needed, I'll probably need to
backport these two?


--=-u+jOoIgd9031j/xQuQ8I
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sat, Jan 17 2026 at 21:49:25 +13:00:00, Ankur Tyagi via lists.openembedded.org &lt;ankur.tyagi85=gmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">can please also include tag=v${PV} in the SRC_URI</div></blockquote><div><br></div><div>I guess that will not work since as said the SRCREV is set two commits ahead of the release. If this is really needed, I'll probably need to</div><div>backport these two?</div></div>
--=-u+jOoIgd9031j/xQuQ8I--


