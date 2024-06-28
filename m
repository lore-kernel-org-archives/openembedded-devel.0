Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36193C2BBCA
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 09:30:25 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.13413.1719567021986743618
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jun 2024 02:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout10.t-online.de (Postfix) with SMTP id 00E0A6FE5;
	Fri, 28 Jun 2024 11:30:19 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.42.131]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sN7vv-441K400; Fri, 28 Jun 2024 11:30:19 +0200
Date: Fri, 28 Jun 2024 11:31:16 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] flatpak: add PACKAGECONFIG knob for
 malcontent
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <4GASFS.HG1TDAHCUPBH@t-online.de>
In-Reply-To: <CA+chaQdiVC7nGWa4YT=MVcxK=DxvCC43YU8hno0+O_2KKqDRVQ@mail.gmail.com>
References: <20240521164945.333290-1-f_l_k@t-online.de>
	<CA+chaQe4am_vJwBgT+zsWMFuxHMbD=zAXvrQOzVjKLuoaqXd7Q@mail.gmail.com>
	<ZQ7SFS.CUMW4YF9DVM23@t-online.de>
	<CA+chaQdiVC7nGWa4YT=MVcxK=DxvCC43YU8hno0+O_2KKqDRVQ@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-nxJ0kfY0sbNMJm8JRxkf"
X-TOI-EXPURGATEID: 150726::1719567019-EC84DDDA-C39C1395/0/0 CLEAN NORMAL
X-TOI-MSGID: ed39d9e8-d3e8-4364-b178-38752a18ada2
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 09:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111148

--=-nxJ0kfY0sbNMJm8JRxkf
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Jun 28 2024 at 10:47:25 AM +02:00:00, Martin Jansa 
<martin.jansa@gmail.com> wrote:
> I'm not using flatpak so it's fine with me (I don't know what runtime
> features missing dconf support affects).

Maybe we could add a bbappend to meta-gnome that enables dconf? For 
Gnome it would be nice to have i guess


--=-nxJ0kfY0sbNMJm8JRxkf
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Jun 28 2024 at 10:47:25 AM +02:00:00, Martin Jansa &lt;martin.jansa@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I'm not using flatpak so it's fine with me (I don't know what runtime
features missing dconf support affects).</div></blockquote><div><br></div><div>Maybe we could add a bbappend to meta-gnome that enables dconf? For Gnome it would be nice to have i guess</div></div>
--=-nxJ0kfY0sbNMJm8JRxkf--


