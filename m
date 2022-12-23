Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC3A9C4167B
	for <webhook@archiver.kernel.org>; Fri, 23 Dec 2022 03:16:25 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.64477.1671765376798706196
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Dec 2022 19:16:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout11.t-online.de (Postfix) with SMTP id 7569B1539B;
	Fri, 23 Dec 2022 04:15:55 +0100 (CET)
Received: from [192.168.178.83] ([84.163.43.10]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p8YXB-02QPke0; Fri, 23 Dec 2022 04:15:45 +0100
Date: Fri, 23 Dec 2022 04:15:40 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 06/10] xdg-desktop-portal: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <4EQBNR.TN0MBX96FF141@t-online.de>
In-Reply-To: 
	<CAMKF1sq4hns=rdZSKpXFocsXOGOaN9MShn151gsrbi8ZfLE58w@mail.gmail.com>
References: <20221219131041.452949-1-f_l_k@t-online.de>
	<20221219131041.452949-6-f_l_k@t-online.de>
	<CAMKF1sq4hns=rdZSKpXFocsXOGOaN9MShn151gsrbi8ZfLE58w@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-k/CnPzvLF/zsKxGBqqgl"
X-TOI-EXPURGATEID: 150726::1671765345-6120D2DC-FF6BC339/0/0 CLEAN NORMAL
X-TOI-MSGID: a89c8ae8-f76a-4f78-a747-41b557d50f23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Dec 2022 03:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100197

--=-k/CnPzvLF/zsKxGBqqgl
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 19. Dez 2022 um 11:25:16 -0800 schrieb Khem Raj 
<raj.khem@gmail.com>:
> 10:01:40 No eligible RPROVIDERs exist for 'xdg-desktop-portal-gnome'

I removed the circular dependency between xdg-desktop-portal and 
xdg-desktop-portal-gnome and resent the remaining 3 patches for flatpak 
support. Let me know if it still causes problems.


--=-k/CnPzvLF/zsKxGBqqgl
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 19. Dez 2022 um 11:25:16 -0800 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">10:01:40 No eligible RPROVIDERs exist for 'xdg-desktop-portal-gnome'
</div></blockquote><div><br></div><div>I removed the circular dependency between xdg-desktop-portal and xdg-desktop-portal-gnome and resent the remaining 3 patches for flatpak support. Let me know if it still causes problems.</div></div>
--=-k/CnPzvLF/zsKxGBqqgl--


