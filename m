Return-Path: <alexander@amelkin.msk.ru>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F29BC77B7D
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 19:52:34 +0000 (UTC)
Received: from mail.fiord.ru (mail.fiord.ru [62.140.247.50])
 by mx.groups.io with SMTP id smtpd.web10.2479.1684439551200251740
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 May 2023 12:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: amelkin.msk.ru, ip: 62.140.247.50, mailfrom: alexander@amelkin.msk.ru)
Received: from [::1] (helo=mail.fiord.ru)
	by mail.fiord.ru with esmtp (Exim 4.94.2)
	(envelope-from <alexander@amelkin.msk.ru>)
	id 1pzjfn-002jEY-Hs; Thu, 18 May 2023 22:52:27 +0300
MIME-Version: 1.0
Date: Thu, 18 May 2023 22:52:27 +0300
From: Alexander Amelkin <alexander@amelkin.msk.ru>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] ipmitool: Update links
In-Reply-To: <CAMKF1spcReLzKP=s0PMmoNbYZ96=4qz2+g9xEFdJ7EZjMAq0gQ@mail.gmail.com>
References: <CAMKF1sqfE0Q5vwC+2sG5wGHeadoabqQHhSSy=y4aQVjPDOrfgA@mail.gmail.com>
 <ba0f0a849c0c2eedd3d1bf04635ae5ea@amelkin.msk.ru>
 <CAMKF1spcReLzKP=s0PMmoNbYZ96=4qz2+g9xEFdJ7EZjMAq0gQ@mail.gmail.com>
Message-ID: <421171c9b359d8c3c3853691e25206a2@amelkin.msk.ru>
X-Sender: alexander@amelkin.msk.ru
X-Remote-Browser: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36
 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.58
X-Originating-IP: [185.174.110.9]
X-RoundCube-Server: 62.140.247.50
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 19:52:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102664

On 2023-05-18 03:42, Khem Raj wrote:
> still not good
> 
> seeing this on git am
> error: patch fragment without header at line 6: @@ -22,14 +22,14 @@
> LIC_FILES_CHKSUM =

Damn. Looks like my mail program that I used to check the message before 
actually sending it added some unwanted line wraps.
Sorry about that. Will re-send again.

