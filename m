Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF435CD3421
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 23:01:49 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.5680.1695078105517598913
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 16:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout08.t-online.de (Postfix) with SMTP id 22D4B2ACCF;
	Tue, 19 Sep 2023 01:01:44 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.161.214]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiNFG-07RQ480; Tue, 19 Sep 2023 01:01:34 +0200
Date: Tue, 19 Sep 2023 01:01:41 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 02/18] gnome-settings-daemon: upgrade
 44.1 -> 45.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <TME71S.OJOCF9REJGR03@t-online.de>
In-Reply-To: <CAMKF1sq3nYBUov1xMxmHRKwEDhApx-gbWvxHV9YFXtV2GJPROQ@mail.gmail.com>
References: <20230918215156.1920452-1-f_l_k@t-online.de>
	<20230918215156.1920452-2-f_l_k@t-online.de>
	<CAMKF1sq3nYBUov1xMxmHRKwEDhApx-gbWvxHV9YFXtV2GJPROQ@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-5Ff0oFikYP4zL9Vf4cFF"
X-TOI-EXPURGATEID: 150726::1695078094-EBFF2029-E4C172CF/0/0 CLEAN NORMAL
X-TOI-MSGID: c2083553-4036-4027-bc53-4abe8b985694
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 23:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104950

--=-5Ff0oFikYP4zL9Vf4cFF
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Sep 18 2023 at 03:39:24 PM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> then make it
> 
>  ${libdir}/gnome-settings-daemon-${@gnome_verdir("${PV}")}/libgsd.so

nice :)



--=-5Ff0oFikYP4zL9Vf4cFF
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Sep 18 2023 at 03:39:24 PM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">then make it

 ${libdir}/gnome-settings-daemon-${@gnome_verdir("${PV}")}/libgsd.so
</div></blockquote><div><br></div><div>nice :)</div><div><br></div></div>
--=-5Ff0oFikYP4zL9Vf4cFF--


