Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273BFFA3740
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 08:57:50 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web09.7050.1667206662311161982
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 01:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout01.t-online.de (Postfix) with SMTP id 025417E48
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 09:57:40 +0100 (CET)
Received: from [192.168.178.122] ([79.219.229.64]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1opQbz-0ic2xU0; Mon, 31 Oct 2022 09:57:39 +0100
Date: Mon, 31 Oct 2022 09:57:33 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-openembedded][PATCH] rest: upgrade 8.0.1 -> 9.0.0
To: openembedded-devel@lists.openembedded.org
Message-Id: <XV0MKR.6MQI6FREUIUO@t-online.de>
In-Reply-To: <20221031065118.2316643-1-f_l_k@t-online.de>
References: <20221031065118.2316643-1-f_l_k@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-T7Ecq/5PihdJgp6FJvL2"
X-TOI-EXPURGATEID: 150726::1667206659-EF7F5A26-D9EDE1E1/0/0 CLEAN NORMAL
X-TOI-MSGID: c9f54737-5bd4-4c37-97ce-af55ace1678b
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99375

--=-T7Ecq/5PihdJgp6FJvL2
Content-Type: text/plain; charset=us-ascii; format=flowed

Hi Khem,

do not apply this one yet. It will require that we also use soup3 for 
goa. I have updated the gnome-online-accounts recipe and switched to 
soup3 and it will compile as long as webkitgtk also uses soup3. So this 
will need changes to oe-core. While I made sure it compiles, I have no 
idea if this change would cause problems with oe-core

> 


--=-T7Ecq/5PihdJgp6FJvL2
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Hi Khem,</div><div><br></div><div>do not apply this one yet. It will require that we also use soup3 for goa. I have updated the gnome-online-accounts recipe and switched to soup3 and it will compile as long as webkitgtk also uses soup3. So this will need changes to oe-core. While I made sure it compiles, I have no idea if this change would cause problems with oe-core</div></div>
--=-T7Ecq/5PihdJgp6FJvL2--


