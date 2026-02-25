Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCF0F357C5
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 06:40:39 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40217.1772001631127515785
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 22:40:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout01.t-online.de (Postfix) with SMTP id 273191D13E;
	Wed, 25 Feb 2026 07:40:29 +0100 (CET)
Received: from [192.168.178.36] ([79.219.239.44]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vv8ZQ-45dxxo0; Wed, 25 Feb 2026 07:40:28 +0100
Date: Wed, 25 Feb 2026 07:40:22 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 2/3] libsdl3-image: update 3.2.6 -> 3.4.0
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <A750BT.KKGEY70N4ZVD2@t-online.de>
In-Reply-To: <e69dc03d-1e36-4726-9a20-43ace1cde523@gmail.com>
References: <20260218113450.32876-1-f_l_k@t-online.de>
	<20260218113450.32876-2-f_l_k@t-online.de>
	<e69dc03d-1e36-4726-9a20-43ace1cde523@gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-089ZR/XAec8QAei3bLvu"
X-TOI-EXPURGATEID: 150726::1772001628-A27DF5A5-955D578F/0/0 CLEAN NORMAL
X-TOI-MSGID: 5c6fd00c-9a46-4aa6-be20-5b9f34156827
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 06:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124609

--=-089ZR/XAec8QAei3bLvu
Content-Type: text/plain; charset=us-ascii; format=flowed

On Tue, Feb 24 2026 at 20:56:27 +01:00:00, Gyorgy Sarvari 
<skandigraun@gmail.com> wrote:
> libavif is in meta-multimedia, and it would make meta-oe depend on it
> unconditionally. This most likely will need some shuffling around.

Thanks. I added a PACKAGECONFIG for libavif so that it is disabled by 
default.


--=-089ZR/XAec8QAei3bLvu
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Tue, Feb 24 2026 at 20:56:27 +01:00:00, Gyorgy Sarvari &lt;skandigraun@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">libavif is in meta-multimedia, and it would make meta-oe depend on it
unconditionally. This most likely will need some shuffling around.</div></blockquote><div><br></div><div>Thanks. I added a PACKAGECONFIG for libavif so that it is disabled by default.</div></div>
--=-089ZR/XAec8QAei3bLvu--


