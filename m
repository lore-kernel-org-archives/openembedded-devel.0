Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE687C46CD2
	for <webhook@archiver.kernel.org>; Sat,  6 Jan 2024 06:57:31 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.44191.1704524250567028517
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jan 2024 22:57:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout08.t-online.de (Postfix) with SMTP id B1B5A1805A;
	Sat,  6 Jan 2024 07:57:27 +0100 (CET)
Received: from [192.168.178.67] ([84.154.174.51]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rM0cV-18Sv2W0; Sat, 6 Jan 2024 07:57:23 +0100
Date: Sat, 06 Jan 2024 07:47:50 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 1/2] libplacebo: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <QVUT6S.DZT3ZBOGOJ1I1@t-online.de>
In-Reply-To: <CAMKF1srUMiM+r6eacPmb6aMeF1PS48Mifoc8hGLPKzpW1KCmng@mail.gmail.com>
References: <20240105183648.61874-1-f_l_k@t-online.de>
	<CAMKF1srUMiM+r6eacPmb6aMeF1PS48Mifoc8hGLPKzpW1KCmng@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-AT7Hpquc50HzN5KPXjRm"
X-TOI-EXPURGATEID: 150726::1704524243-3DBF9958-2DCEE2D0/0/0 CLEAN NORMAL
X-TOI-MSGID: ece02341-7375-48a4-a856-8b69f8be7ecf
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Jan 2024 06:57:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108059

--=-AT7Hpquc50HzN5KPXjRm
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Jan 5 2024 at 02:42:51 PM -08:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> glad recipe does not exist in either core or meta-openembedded layers.

Yes, sorry. I forgot to push the recipe. Now i have sent it and also a 
v3 for mpv that adds the hack for config.h again. At first I thought it 
was no longer needed but without there still leaks buildpaths into the 
binary


--=-AT7Hpquc50HzN5KPXjRm
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Jan 5 2024 at 02:42:51 PM -08:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">glad recipe does not exist in either core or meta-openembedded layers.</div></blockquote><div><br></div><div>Yes, sorry. I forgot to push the recipe. Now i have sent it and also a v3 for mpv that adds the hack for config.h again. At first I thought it was no longer needed but without there still leaks buildpaths into the binary</div></div>
--=-AT7Hpquc50HzN5KPXjRm--


