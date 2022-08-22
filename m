Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B770EC28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 07:54:53 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.15282.1661154887416052649
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 00:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82,
 mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout05.t-online.de (Postfix) with SMTP id 8DF8816BFC;
	Mon, 22 Aug 2022 09:54:45 +0200 (CEST)
Received: from [192.168.178.83] ([84.154.174.226]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oQ2Gi-0vnIJM0; Mon, 22 Aug 2022 09:54:44 +0200
Date: Mon, 22 Aug 2022 09:54:39 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCHv8] pipewire: update to v0.3.56
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <3BB0HR.7K7PWKWAUTT3@t-online.de>
In-Reply-To: 
	<CAMKF1sq63W60kH_cOy+3oWQKKbc9nUw=F5eMu=uZjQr0YcCoRA@mail.gmail.com>
References: <20220821140240.123638-1-f_l_k@t-online.de>
	<CAMKF1so_YYOK4KXdfJH=F6G7rOV9a8_9wRr5CkdDVCr6eOJDew@mail.gmail.com>
	<CAMKF1sq63W60kH_cOy+3oWQKKbc9nUw=F5eMu=uZjQr0YcCoRA@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-0bvxkc2A9vSqXKbDCjaI"
X-TOI-EXPURGATEID: 150726::1661154884-0144C2AD-54764842/0/0 CLEAN NORMAL
X-TOI-MSGID: 6fd3a06b-31bb-4c61-af6c-1a5fed574cbe
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Aug 2022 07:54:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98356

--=-0bvxkc2A9vSqXKbDCjaI
Content-Type: text/plain; charset=us-ascii; format=flowed

Am So, 21. Aug 2022 um 22:51:28 -0700 schrieb Khem Raj 
<raj.khem@gmail.com>:
> I still see a compile error on mips with latest version of this patch 
> see

I found some time to build Pipewire for qemumips. There were 3 patches 
that fixed the big endian problem uppstream. I have combined them into 
one patch. The compilation now succeeds on my machine.


--=-0bvxkc2A9vSqXKbDCjaI
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am So, 21. Aug 2022 um 22:51:28 -0700 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I still see a compile error on mips with latest version of this patch see
</div></blockquote><div><br></div><div>I found some time to build Pipewire for qemumips. There were 3 patches that fixed the big endian problem uppstream. I have combined them into one patch. The compilation now succeeds on my machine.</div></div>
--=-0bvxkc2A9vSqXKbDCjaI--


