Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7437DCA101F
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 05:05:54 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.25514.1757912747639492894
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Sep 2025 22:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout12.t-online.de (Postfix) with SMTP id AE08FEDFA;
	Mon, 15 Sep 2025 07:05:45 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.165.158]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uy1PK-23HAUi0; Mon, 15 Sep 2025 07:05:42 +0200
Date: Mon, 15 Sep 2025 07:05:37 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][RFC][PATCH 1/2] mozjs: update 128 > 140
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Message-Id: <D56M2T.35UUVYLUKJT12@t-online.de>
In-Reply-To: <CAMKF1srUtVScbGN0F9hBOsTrP+sjF=meH5r3u4OXWo+UAW+8tg@mail.gmail.com>
References: <186511276CF969C9.5932@lists.openembedded.org>
	<8HEK2T.LCBU3EWSYQJ13@t-online.de>
	<CAMKF1srUtVScbGN0F9hBOsTrP+sjF=meH5r3u4OXWo+UAW+8tg@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-+cXmbLpdvFxGYL7mH9jB"
X-TOI-EXPURGATEID: 150726::1757912742-737FD937-4122A210/0/0 CLEAN NORMAL
X-TOI-MSGID: 7c0900d4-61da-4454-b093-c04ff2d20629
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 05:05:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119403

--=-+cXmbLpdvFxGYL7mH9jB
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sun, Sep 14 2025 at 16:42:49 -07:00:00, Khem Raj via 
lists.openembedded.org <raj.khem=gmail.com@lists.openembedded.org> 
wrote:
> Ok, I wonder what to do about these patches then
> Do you have gnome upgrade in pipeline or something that needs it ?

I am still unable to build glycin. I just sent out the patches in case 
anyone wants to try out mozjs140.
You can ignore them for now. I will send them out as non-RFC once I 
have successfully built gnome-shell 49.


--=-+cXmbLpdvFxGYL7mH9jB
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sun, Sep 14 2025 at 16:42:49 -07:00:00, Khem Raj via lists.openembedded.org &lt;raj.khem=gmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div dir="auto">Ok, I wonder what to do about these patches then</div><div dir="auto">Do you have gnome upgrade in pipeline or something that needs it ?</div></blockquote><div><br></div><div><div>I am still unable to build glycin. I just sent out the patches in case anyone wants to try out mozjs140.</div><div>You can ignore them for now. I will send them out as non-RFC once I have successfully built gnome-shell 49.</div></div></div>
--=-+cXmbLpdvFxGYL7mH9jB--


