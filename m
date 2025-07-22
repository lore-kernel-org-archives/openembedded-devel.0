Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C69BFC83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 17:34:24 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.19848.1753205654317951519
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jul 2025 10:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout03.t-online.de (Postfix) with SMTP id 77A20E17A;
	Tue, 22 Jul 2025 19:34:12 +0200 (CEST)
Received: from [192.168.178.20] ([84.163.37.113]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ueGsV-1MbHuK0; Tue, 22 Jul 2025 19:34:11 +0200
Date: Tue, 22 Jul 2025 19:34:06 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 3/3] gnome-shell-extensions: uodate 48.0
 -> 48.3
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	"Gyorgy Sarvari via lists.openembedded.org"
	<skandigraun=gmail.com@lists.openembedded.org>
Message-Id: <U4ATZS.XYKT0CF125XO3@t-online.de>
In-Reply-To: <165f85b2-64cc-4fc5-ba44-c2d876b983f4@gmail.com>
References: <20250722165344.105075-1-f_l_k@t-online.de>
	<20250722165344.105075-3-f_l_k@t-online.de>
	<165f85b2-64cc-4fc5-ba44-c2d876b983f4@gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-VLSGy8iHDy6KJisvurBI"
X-TOI-EXPURGATEID: 150726::1753205651-E2FF353D-D0342EF5/0/0 CLEAN NORMAL
X-TOI-MSGID: 9bf00e04-0af5-4d53-b43a-8131233a8a70
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118701

--=-VLSGy8iHDy6KJisvurBI
Content-Type: text/plain; charset=us-ascii; format=flowed

yes, thanks. Unfortunaltely the file was already renamed in this patch: 
gnome-shell: update 48.0 -> 48.3

I'll clean that up

On Tue, Jul 22 2025 at 19:28:57 +02:00:00, Gyorgy Sarvari via 
lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org> 
wrote:
> On 7/22/25 18:53, Markus Volk via lists.openembedded.org wrote:
>>  ---
>>   .../recipes-gnome/gnome-shell/gnome-shell-extensions_48.3.bb    | 
>> 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>>  diff --git 
>> a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.3.bb 
>> b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.3.bb
>>  index f2f3e8654d..5537b3521e 100644
>>  --- 
>> a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.3.bb
>>  +++ 
>> b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.3.bb
> It looks the original file name is incorrect, it should say 48.0 
> instead
> of 48.3
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118700): 
> <https://lists.openembedded.org/g/openembedded-devel/message/118700>
> Mute This Topic: <https://lists.openembedded.org/mt/114289767/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-VLSGy8iHDy6KJisvurBI
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>yes, thanks. Unfortunaltely the file was already renamed in this patch: gnome-shell: update 48.0 -&gt; 48.3</div><div><br></div><div>I'll clean that up</div></div><div id="geary-quote" dir="auto"><br>On Tue, Jul 22 2025 at 19:28:57 +02:00:00, Gyorgy Sarvari via lists.openembedded.org &lt;skandigraun=gmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">On 7/22/25 18:53, Markus Volk via lists.openembedded.org wrote:
<blockquote> ---
  .../recipes-gnome/gnome-shell/gnome-shell-extensions_48.3.bb    | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

 diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.3.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.3.bb
 index f2f3e8654d..5537b3521e 100644
 --- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.3.bb
 +++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.3.bb
</blockquote>It looks the original file name is incorrect, it should say 48.0 instead
of 48.3

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#118700): <a href="https://lists.openembedded.org/g/openembedded-devel/message/118700">https://lists.openembedded.org/g/openembedded-devel/message/118700</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/114289767/3618223">https://lists.openembedded.org/mt/114289767/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-VLSGy8iHDy6KJisvurBI--


