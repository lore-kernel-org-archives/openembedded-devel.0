Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90138C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 14:09:41 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.15836.1741874976306645097
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 07:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout11.t-online.de (Postfix) with SMTP id 2A896A34;
	Thu, 13 Mar 2025 15:09:34 +0100 (CET)
Received: from [192.168.178.20] ([79.219.231.110]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tsjFc-1LfXdY0; Thu, 13 Mar 2025 15:09:32 +0100
Date: Thu, 13 Mar 2025 15:10:13 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] libsdl3: add recipe
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <1DF2TS.Y8WAY5YN9AW73@t-online.de>
In-Reply-To: <d74fe178-d5ae-4bb9-b77d-5197bbbaae66@gmail.com>
References: <20250313120340.176779-1-f_l_k@t-online.de>
	<d74fe178-d5ae-4bb9-b77d-5197bbbaae66@gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-tsf0JbEvUlX04aXZZq7L"
X-TOI-EXPURGATEID: 150726::1741874972-80FF7594-94CBF1FD/10/3626336762 SUSPECT URL
X-TOI-MSGID: 04fa2dd8-f521-4563-bada-a326018d0f38
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 14:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115972

--=-tsf0JbEvUlX04aXZZq7L
Content-Type: text/plain; charset=us-ascii; format=flowed

yes, thanks!

It was rmeoved in:
<https://github.com/libsdl-org/SDL/commit/0f351cd6af832663ebd00e20719010d15c853417>

On Thu, Mar 13 2025 at 13:44:36 +01:00:00, Gyorgy Sarvari 
<skandigraun@gmail.com> wrote:
> On 13.03.25 13:03, Markus Volk via lists.openembedded.org wrote:
>>  +LIC_FILES_CHKSUM:append = " ${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'arm-neon', 
>> '<file://src/video/arm/pixman-arm-neon-asm.h;md5=9a9cc1e51abbf1da58f4d9528ec9d49b;beginline=1;endline=24',> 
>> '', d)}"
> This file doesn't seem to exist.


--=-tsf0JbEvUlX04aXZZq7L
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>yes, thanks!</div><div><br></div><div>It was rmeoved in:</div><div><a href="https://github.com/libsdl-org/SDL/commit/0f351cd6af832663ebd00e20719010d15c853417">https://github.com/libsdl-org/SDL/commit/0f351cd6af832663ebd00e20719010d15c853417</a></div></div><div id="geary-quote" dir="auto"><br>On Thu, Mar 13 2025 at 13:44:36 +01:00:00, Gyorgy Sarvari &lt;skandigraun@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">On 13.03.25 13:03, Markus Volk via lists.openembedded.org wrote:
<blockquote> +LIC_FILES_CHKSUM:append = " <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'arm-neon', '<a href="file://src/video/arm/pixman-arm-neon-asm.h;md5=9a9cc1e51abbf1da58f4d9528ec9d49b;beginline=1;endline=24',">file://src/video/arm/pixman-arm-neon-asm.h;md5=9a9cc1e51abbf1da58f4d9528ec9d49b;beginline=1;endline=24',</a> '', d)}"
</blockquote>This file doesn't seem to exist.
</div></blockquote></div>
--=-tsf0JbEvUlX04aXZZq7L--


