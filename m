Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFDCCA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 13:51:05 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.21432.1756389059404278968
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Aug 2025 06:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout02.t-online.de (Postfix) with SMTP id DAC612A52B;
	Thu, 28 Aug 2025 15:50:56 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.170.236]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1urd1e-4OFF560; Thu, 28 Aug 2025 15:50:51 +0200
Date: Thu, 28 Aug 2025 15:50:45 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] packagegroup-gnome-desktop is not a desktop
To: mike.looijmans@topic.nl
Cc: openembedded-devel@lists.openembedded.org,
	"Mike Looijmans via lists.openembedded.org"
	<mike.looijmans=topic.nl@lists.openembedded.org>
Message-Id: <LGIP1T.9VKP6WIGP7RN2@t-online.de>
In-Reply-To: <185FF0782C5BBC40.31147@lists.openembedded.org>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.13b3af35-2da3-4280-b2c7-1a64bf69f8ab@emailsignatures365.codetwo.com>
	<AM8PR04MB777917B82BD9D98FD50CF2E1ED38A@AM8PR04MB7779.eurprd04.prod.outlook.com>
	<DCEO1T.WIMW7AB6YK7K3@t-online.de>
	<76eb2d12-a879-412c-8790-8f1993686e95@topic.nl>
	<185FF0782C5BBC40.31147@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-LW82HbpXYomfytXa5zqn"
X-TOI-EXPURGATEID: 150726::1756389051-03FFC9DF-9B669814/0/0 CLEAN NORMAL
X-TOI-MSGID: 2703b8e3-f4cc-4679-9446-5d6425538146
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Aug 2025 13:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119130

--=-LW82HbpXYomfytXa5zqn
Content-Type: text/plain; charset=us-ascii; format=flowed

I do it like this:
<https://codeberg.org/flk/meta-gnome-image/src/branch/master/recipes-gnome/gdm/gdm_%25.bbappend>

> 
> gdm should be started automatically using systemd service:
> 


--=-LW82HbpXYomfytXa5zqn
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>I do it like this:</div><div><a href="https://codeberg.org/flk/meta-gnome-image/src/branch/master/recipes-gnome/gdm/gdm_%25.bbappend">https://codeberg.org/flk/meta-gnome-image/src/branch/master/recipes-gnome/gdm/gdm_%25.bbappend</a></div></div><div id="geary-quote" dir="auto"><br><blockquote type="cite"><div id="geary-body" dir="auto"><div><br></div><div>gdm should be started automatically using systemd service:</div><div><br></div></div>
</blockquote></div>
--=-LW82HbpXYomfytXa5zqn--


