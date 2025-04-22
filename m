Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E626CC369CB
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 03:49:11 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.32197.1745293748572822569
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 20:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout12.t-online.de (Postfix) with SMTP id 7554AB8D;
	Tue, 22 Apr 2025 05:49:06 +0200 (CEST)
Received: from [192.168.178.20] ([84.163.42.91]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u74d6-3v4PMu0; Tue, 22 Apr 2025 05:49:04 +0200
Date: Tue, 22 Apr 2025 05:48:58 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 3/9] libsdl2-image: build with cmake
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Message-Id: <M9P3VS.BOZVDNC1WYLK3@t-online.de>
In-Reply-To: <1179f882-e39c-4943-a1d6-91a52cc82c4d@gmail.com>
References: <20250421094832.67450-1-f_l_k@t-online.de>
	<20250421094832.67450-3-f_l_k@t-online.de>
	<1179f882-e39c-4943-a1d6-91a52cc82c4d@gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-n+KWbi337SDVXwm2e8lT"
X-TOI-EXPURGATEID: 150726::1745293744-C3FFC92C-D3CB9F68/10/34264404896 SUSPECT URL
X-TOI-MSGID: ecd04658-45d3-415a-a77d-4a917ef14361
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 03:49:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117016

--=-n+KWbi337SDVXwm2e8lT
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Apr 21 2025 at 13:54:20 -07:00:00, Khem Raj via 
lists.openembedded.org <raj.khem=gmail.com@lists.openembedded.org> 
wrote:
> fails to configure see <http://0x0.st/8Vz4.7805>

Yes, I accidentially added libsdl2 instead of libsdl3 as a dependency 
and (probably) because I also
had set PREFERRED_PROVIDER_libsdl2 = "libsdl2-compat" it didn't fail 
for me. Thanks for fixing this.


--=-n+KWbi337SDVXwm2e8lT
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Apr 21 2025 at 13:54:20 -07:00:00, Khem Raj via lists.openembedded.org &lt;raj.khem=gmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">fails to configure see <a href="http://0x0.st/8Vz4.7805">http://0x0.st/8Vz4.7805</a>
</div></blockquote><div><br></div><div>Yes, I accidentially added libsdl2 instead of libsdl3 as a dependency and (probably) because I also</div><div>had set PREFERRED_PROVIDER_libsdl2 = "libsdl2-compat" it didn't fail for me. Thanks for fixing this.</div></div>
--=-n+KWbi337SDVXwm2e8lT--


