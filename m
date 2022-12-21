Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE86FC4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 04:40:00 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.12023.1671597596500026990
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 20:39:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout10.t-online.de (Postfix) with SMTP id 673485EAC;
	Wed, 21 Dec 2022 05:39:54 +0100 (CET)
Received: from [192.168.178.83] ([84.163.46.43]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7qtV-0ZwSLQ0; Wed, 21 Dec 2022 05:39:53 +0100
Date: Wed, 21 Dec 2022 05:39:47 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 05/10] xdg-desktop-portal-wlr: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <BY48NR.M5S0PDIP9WPJ2@t-online.de>
In-Reply-To: 
	<CAMKF1sqAyUyGJjdTPV8hUTid0JQYdVfhD4yZckSp4Pn4kxawVg@mail.gmail.com>
References: <20221219131041.452949-1-f_l_k@t-online.de>
	<20221219131041.452949-5-f_l_k@t-online.de>
	<CAMKF1sp9N2VHygKfpE0ybEspjd27X8LJbGg+i1+y_AEn6f2Lfw@mail.gmail.com>
	<CAMKF1sqAyUyGJjdTPV8hUTid0JQYdVfhD4yZckSp4Pn4kxawVg@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-EYdpQp9QZGaLnvalIYWL"
X-TOI-EXPURGATEID: 150726::1671597593-E6FDD07E-928BDC0E/0/0 CLEAN NORMAL
X-TOI-MSGID: 8efd2362-c3eb-4eff-99c5-8b2aa0f58129
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 04:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100170

--=-EYdpQp9QZGaLnvalIYWL
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 19. Dez 2022 um 23:00:41 -0800 schrieb Khem Raj 
<raj.khem@gmail.com>:
> next error is with non-systemd distros see

I have both elogind and basu in meta-wayland, but they're missing in 
meta-openembedded. I'm not sure, if you want to support builds with 
either one of them. If not it would be best to set 
REQUIRED_DISTRO_FEATURE = 'systemd' ?


--=-EYdpQp9QZGaLnvalIYWL
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 19. Dez 2022 um 23:00:41 -0800 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">next error is with non-systemd distros see</div></blockquote><div><br></div><div>I have both elogind and basu in meta-wayland, but&nbsp;<span style="white-space: break-spaces;">t</span>hey're missing in meta-openembedded. I'm not sure, if you want to support builds with either one of them. If not it would be best to set REQUIRED_DISTRO_FEATURE = 'systemd' ?</div></div>
--=-EYdpQp9QZGaLnvalIYWL--


