Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5291DCCF9F8
	for <webhook@archiver.kernel.org>; Sat,  1 Nov 2025 08:33:22 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1862.1761985993812776457
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Nov 2025 01:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id 8D4761C779
	for <openembedded-devel@lists.openembedded.org>; Sat,  1 Nov 2025 09:33:11 +0100 (CET)
Received: from [192.168.178.36] ([84.163.34.204]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vF72s-3ly90i0; Sat, 1 Nov 2025 09:33:10 +0100
Date: Sat, 01 Nov 2025 09:33:05 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] libtinyxml2: use cmake buildsystem
To: openembedded-devel@lists.openembedded.org
Message-Id: <53H15T.HF094MQRRQGC@t-online.de>
In-Reply-To: <1873D47798357CCC.75874@lists.openembedded.org>
References: <1873D461E6D099EF.73784@lists.openembedded.org>
	<1873D47798357CCC.75874@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-0xXq8ZfKcdrRFCCMta9R"
X-TOI-EXPURGATEID: 150726::1761985990-40FF6986-19111881/0/0 CLEAN NORMAL
X-TOI-MSGID: 055d5cb6-c1e7-452d-ad93-fd7554de81b3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Nov 2025 08:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121248

--=-0xXq8ZfKcdrRFCCMta9R
Content-Type: text/plain; charset=us-ascii; format=flowed

I would also like to mention that this would change the default. With 
meson, both static and shared libraries were
created, whereas in cmake it is an either/or decision and currently 
only shared libraries are created.

On Sat, Nov 1 2025 at 09:24:36 +01:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> I accidentally sent the wrong patch in v1


--=-0xXq8ZfKcdrRFCCMta9R
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div><div>I would also like to mention that this would change the default. With meson, both static and shared libraries were</div><div>created, whereas in cmake it is an either/or decision and currently only shared libraries are created.</div></div></div><div id="geary-quote" dir="auto"><br>On Sat, Nov 1 2025 at 09:24:36 +01:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div id="geary-body" dir="auto"><div>I accidentally sent the wrong patch in v1</div></div>
</blockquote></div>
--=-0xXq8ZfKcdrRFCCMta9R--


