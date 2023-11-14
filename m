Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47418C531AC
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 23:39:45 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.1102.1700005184457131607
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 15:39:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout06.t-online.de (Postfix) with SMTP id A18C3F08C;
	Wed, 15 Nov 2023 00:39:22 +0100 (CET)
Received: from [192.168.178.62] ([84.154.170.36]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r3301-1BbsiO0; Wed, 15 Nov 2023 00:39:17 +0100
Date: Wed, 15 Nov 2023 00:39:49 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-oe][PATCH] cups-filters: Upgrade 1.28.17 -> 2.0.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Markus Volk
	<f_l_k@t-online.de>
Message-Id: <DE054S.RM4BNCVSRL3D2@t-online.de>
In-Reply-To: <CAMKF1srYX9KmCav5t3fXiyDUwLDGdaLCB17ycbfRQsXPdoEa8g@mail.gmail.com>
References: <20231112005941.3689515-1-f_l_k@t-online.de>
	<169990042605.4418.17328445695395731594.b4-ty@gmail.com>
	<CAMKF1srYX9KmCav5t3fXiyDUwLDGdaLCB17ycbfRQsXPdoEa8g@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-BoIHNq2X6afAtivh+i6l"
X-TOI-EXPURGATEID: 150726::1700005157-5181C95D-F1BD39AE/0/0 CLEAN NORMAL
X-TOI-MSGID: cdeb44ef-3339-474b-a22c-b62d9313c66a
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 23:39:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106726

--=-BoIHNq2X6afAtivh+i6l
Content-Type: text/plain; charset=us-ascii; format=flowed

On Tue, Nov 14 2023 at 01:11:42 PM -08:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> I wonder if its some sort of race condition ?

Possible. Unfortunately I cant reproduce but I'll send a patch that 
might fix it.


--=-BoIHNq2X6afAtivh+i6l
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Tue, Nov 14 2023 at 01:11:42 PM -08:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I wonder if its some sort of race condition ?</div></blockquote><span style="white-space-collapse: break-spaces;"><br></span><div>Possible. Unfortunately I cant reproduce but I'll send a patch that might fix it.</div></div>
--=-BoIHNq2X6afAtivh+i6l--


