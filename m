Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E6AC4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 17:28:10 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.67.1668187689960332285
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Nov 2022 09:28:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout05.t-online.de (Postfix) with SMTP id EAB471C3B2;
	Fri, 11 Nov 2022 18:28:07 +0100 (CET)
Received: from [192.168.178.83] ([79.219.225.57]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1otXp1-0gPNeS0; Fri, 11 Nov 2022 18:28:07 +0100
Date: Fri, 11 Nov 2022 18:28:01 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCHv12] pipewire: update to v0.3.56
To: crg7475@mailbox.org
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <PU17LR.6HATELSCM57B@t-online.de>
In-Reply-To: <17268605DB982F0F.19634@lists.openembedded.org>
References: <20220822171940.4736-1-f_l_k@t-online.de>
	<8c1dd697-ddee-d297-fc92-fe59391ff7a3@mailbox.org>
	<17268605DB982F0F.19634@lists.openembedded.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-zPQg3BS82JuWnHimidPH"
X-TOI-EXPURGATEID: 150726::1668187687-737F181F-FD7C9560/0/0 CLEAN NORMAL
X-TOI-MSGID: 63424147-e716-42e5-9760-b7bed8765e7c
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Nov 2022 17:28:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99557

--=-zPQg3BS82JuWnHimidPH
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Fr, 11. Nov 2022 um 13:00:59 +0100 schrieb Markus Volk 
<f_l_k@t-online.de>:
> As to why wireplumber is not the default

I would suggest that you create a patch that changes the default to 
wireplumber and send it to the mailing list.


--=-zPQg3BS82JuWnHimidPH
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Fr, 11. Nov 2022 um 13:00:59 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite">As to why wireplumber is not the default</blockquote><div><br></div><div>I would suggest that you create a patch that changes the default to wireplumber and send it to the mailing list.</div></div>
--=-zPQg3BS82JuWnHimidPH--


