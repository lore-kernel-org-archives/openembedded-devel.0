Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE8FC19F2A
	for <webhook@archiver.kernel.org>; Sat, 30 Jul 2022 19:57:26 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.6472.1659211044831961644
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jul 2022 12:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85,
 mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout11.t-online.de (Postfix) with SMTP id 77E3D1C750;
	Sat, 30 Jul 2022 21:57:21 +0200 (CEST)
Received: from [192.168.0.154] ([24.134.105.89]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oHsaK-3AyF1c0; Sat, 30 Jul 2022 21:57:16 +0200
Date: Sat, 30 Jul 2022 21:57:09 +0200
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-gnome][PATCH] ibus.inc: fix after branch renaming
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <9FNUFR.YL5HBRQXU9PH1@t-online.de>
In-Reply-To: 
	<CAMKF1spWqX_q_LNzhA2f5vgVLHBHjLN4p_YkFoXn=5aWVkW8Qw@mail.gmail.com>
References: <20220730152545.294982-1-f_l_k@t-online.de>
	<CAMKF1spWqX_q_LNzhA2f5vgVLHBHjLN4p_YkFoXn=5aWVkW8Qw@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-ZCXHoZ2yQiSX4UqXMaP8"
X-TOI-EXPURGATEID: 150726::1659211036-0144746C-D67052E1/0/0 CLEAN NORMAL
X-TOI-MSGID: b64f86df-c8e2-4854-b91f-d68d197daa8f
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Jul 2022 19:57:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98061

--=-ZCXHoZ2yQiSX4UqXMaP8
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sat, Jul 30 2022 at 01:25:23 PM -0400, Khem Raj <raj.khem@gmail.com> 
wrote:
> even when you do bitbake -ccleanall <recipe> && bitbake <recipe> ?

I'll test this tomorrow. But on the ibus github page there is no master 
branch anymore, so i doubt -c cleanall will help

<https://github.com/ibus/ibus>


--=-ZCXHoZ2yQiSX4UqXMaP8
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sat, Jul 30 2022 at 01:25:23 PM -0400, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">even when you do bitbake -ccleanall &lt;recipe&gt; &amp;&amp; bitbake &lt;recipe&gt; ?
</div></blockquote><div><br></div><div>I'll test this tomorrow. But on the ibus github page there is no master branch anymore, so i doubt -c cleanall will help</div><div><br></div><div><a href="https://github.com/ibus/ibus">https://github.com/ibus/ibus</a></div></div>
--=-ZCXHoZ2yQiSX4UqXMaP8--


