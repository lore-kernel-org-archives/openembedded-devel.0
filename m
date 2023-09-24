Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3327CE7A8A
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 22:19:25 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.49790.1695593963216145002
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Sep 2023 15:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout10.t-online.de (Postfix) with SMTP id 0879312D2;
	Mon, 25 Sep 2023 00:19:21 +0200 (CEST)
Received: from [192.168.178.62] ([84.163.34.4]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qkXRf-0OGhcW0; Mon, 25 Sep 2023 00:19:19 +0200
Date: Mon, 25 Sep 2023 00:19:24 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 2/2] udisks2: Upgrade 2.9.4 -> 2.10.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <COGI1S.NV8QBH6TLIY63@t-online.de>
In-Reply-To: <CAMKF1srNXF8z_p3e1JuqnxbXjd7aJKAgTDggUU7OXkp0f-Qzvw@mail.gmail.com>
References: <20230924204711.3073-1-f_l_k@t-online.de>
	<20230924204711.3073-2-f_l_k@t-online.de>
	<CAMKF1speG8B1=YdbzUvfu_cN83XDLH1kYEkJRc0vb-bLRXQrgQ@mail.gmail.com>
	<4DEI1S.RGXZVSAXE3I31@t-online.de>
	<CAMKF1spaytbE+v1ufsosqbr8FNy=aTsSzL=3JVDCSeWY7xsG-A@mail.gmail.com>
	<ZCFI1S.B983R3SRJX6X1@t-online.de>
	<CAMKF1srNXF8z_p3e1JuqnxbXjd7aJKAgTDggUU7OXkp0f-Qzvw@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-XrogGbejU33RTwDLrqUF"
X-TOI-EXPURGATEID: 150726::1695593959-9BFE8CF5-EC3053D5/0/0 CLEAN NORMAL
X-TOI-MSGID: 9c545181-e08d-41cc-b654-814fb4c6ff2c
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 22:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105117

--=-XrogGbejU33RTwDLrqUF
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sun, Sep 24 2023 at 03:11:01 PM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> Ok then maybe it should be a environment variable or something that 
> can even help in cross testing if we plan to do ptests for it

Yes and we also do not need to change the way the code works. I'll send 
a v2 that maps BUILD_DIR to /usr/src


--=-XrogGbejU33RTwDLrqUF
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sun, Sep 24 2023 at 03:11:01 PM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite">Ok then maybe it should be a environment variable or something that can even help in cross testing if we plan to do ptests for it</blockquote><div><br></div><div>Yes and we also do not need to change the way the code works. I'll send a v2 that maps BUILD_DIR to /usr/src</div></div>
--=-XrogGbejU33RTwDLrqUF--


