Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94152CE7A8B
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 21:29:25 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.48306.1695590963725645786
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Sep 2023 14:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout07.t-online.de (Postfix) with SMTP id A3EDFF42E;
	Sun, 24 Sep 2023 23:29:21 +0200 (CEST)
Received: from [192.168.178.62] ([84.163.34.4]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qkWfJ-0mJNkO0; Sun, 24 Sep 2023 23:29:21 +0200
Date: Sun, 24 Sep 2023 23:29:28 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 2/2] udisks2: Upgrade 2.9.4 -> 2.10.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <4DEI1S.RGXZVSAXE3I31@t-online.de>
In-Reply-To: <CAMKF1speG8B1=YdbzUvfu_cN83XDLH1kYEkJRc0vb-bLRXQrgQ@mail.gmail.com>
References: <20230924204711.3073-1-f_l_k@t-online.de>
	<20230924204711.3073-2-f_l_k@t-online.de>
	<CAMKF1speG8B1=YdbzUvfu_cN83XDLH1kYEkJRc0vb-bLRXQrgQ@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-dchkCd00RaYmdWwgsJ1T"
X-TOI-EXPURGATEID: 150726::1695590961-9B7E9CF5-6FEAA5F6/0/0 CLEAN NORMAL
X-TOI-MSGID: 6c6bde0e-c19e-4e15-afbf-eea83089bb9c
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 21:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105113

--=-dchkCd00RaYmdWwgsJ1T
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sun, Sep 24 2023 at 02:25:50 PM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> How does this end up in shared object perhaps that needs to be looked 
> at as such specifying build dir in a makefile should be fine I guess

<https://github.com/storaged-project/udisks/blob/c7027d888c00381851d918f33a13102e7b86e188/src/udisksmodulemanager.c#L192>

i guess its this place


--=-dchkCd00RaYmdWwgsJ1T
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sun, Sep 24 2023 at 02:25:50 PM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite">How does this end up in shared object perhaps that needs to be looked at as such specifying build dir in a makefile should be fine I guess&nbsp;</blockquote><div><br></div><div><a href="https://github.com/storaged-project/udisks/blob/c7027d888c00381851d918f33a13102e7b86e188/src/udisksmodulemanager.c#L192">https://github.com/storaged-project/udisks/blob/c7027d888c00381851d918f33a13102e7b86e188/src/udisksmodulemanager.c#L192</a></div><div><br></div><div>i guess its this place</div></div>
--=-dchkCd00RaYmdWwgsJ1T--


