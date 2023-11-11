Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D341C4167B
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 20:48:27 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.3800.1699735702748170888
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 12:48:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout12.t-online.de (Postfix) with SMTP id 56EAA3759;
	Sat, 11 Nov 2023 21:48:20 +0100 (CET)
Received: from [192.168.178.62] ([84.163.34.215]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r1utv-3XbCYC0; Sat, 11 Nov 2023 21:48:19 +0100
Date: Sat, 11 Nov 2023 21:48:33 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH] gnome-teminal: build with vte9
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <XG8Z3S.CN41UGW9J99G1@t-online.de>
In-Reply-To: <1796AB40174FD05F.28092@lists.openembedded.org>
References: <1796AB40174FD05F.28092@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-iA3y0UKRxBV30XCb6SYg"
X-TOI-EXPURGATEID: 150726::1699735699-0CA7E850-2F25E084/0/0 CLEAN NORMAL
X-TOI-MSGID: ed515e24-ef23-4d05-9bf9-d7f64f2caf24
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 20:48:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106573

--=-iA3y0UKRxBV30XCb6SYg
Content-Type: text/plain; charset=us-ascii; format=flowed

This patch can be dropped. With the vte update available, its also 
possible to update gnome-terminal. I'll send a patch for that

On Sat, Nov 11 2023 at 09:23:29 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb       | 2 
> +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb 
> b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
> index 8f91f7cca..d1c088369 100644
> --- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
> @@ -14,7 +14,7 @@ DEPENDS = " \
>      desktop-file-utils-native \
>      gtk+3 \
>      gsettings-desktop-schemas \
> -    vte \
> +    vte9 \
>      dconf \
>      libpcre2 \
>  "
> --
> 2.42.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106572): 
> <https://lists.openembedded.org/g/openembedded-devel/message/106572>
> Mute This Topic: <https://lists.openembedded.org/mt/102532266/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-iA3y0UKRxBV30XCb6SYg
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>This patch can be dropped. With the vte update available, its also possible to update gnome-terminal. I'll send a patch for that</div></div><div id="geary-quote" dir="auto"><br>On Sat, Nov 11 2023 at 09:23:29 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
index 8f91f7cca..d1c088369 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
@@ -14,7 +14,7 @@ DEPENDS = " \
     desktop-file-utils-native \
     gtk+3 \
     gsettings-desktop-schemas \
-    vte \
+    vte9 \
     dconf \
     libpcre2 \
 "
<div>-- 
</div>2.42.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#106572): <a href="https://lists.openembedded.org/g/openembedded-devel/message/106572">https://lists.openembedded.org/g/openembedded-devel/message/106572</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/102532266/3618223">https://lists.openembedded.org/mt/102532266/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-iA3y0UKRxBV30XCb6SYg--


