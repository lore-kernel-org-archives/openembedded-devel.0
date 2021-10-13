Return-Path: <nandor.han@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C9CC433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 05:43:36 +0000 (UTC)
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
 [193.143.230.17])
 by mx.groups.io with SMTP id smtpd.web10.4216.1634103815144004129
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 22:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: vaisala.com, ip: 193.143.230.17, mailfrom: nandor.han@vaisala.com)
Received: from HEL-SMTP.corp.vaisala.com (HEL-SMTP.corp.vaisala.com
 [172.24.1.225])
	by hel-mailgw-01.vaisala.com (Postfix) with ESMTP id F1F3D601F197
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 08:43:29 +0300 (EEST)
Received: from localhost.localdomain ([172.24.252.165]) by
 HEL-SMTP.corp.vaisala.com over TLS secured channel with Microsoft
 SMTPSVC(8.5.9600.16384);
	 Wed, 13 Oct 2021 08:43:33 +0300
Subject: Re: [meta-oe][RFC PATCH] libiio: depend on avahi only when network
 backed is used
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 sam.van.den.berge@gmail.com
References: <20211013053419.2871191-1-nandor.han@vaisala.com>
 <CAMKF1spg-TsiB4LjN-WP5MEhBOqjQcGdMGbVX6F_Xc=tCkc6Tg@mail.gmail.com>
From: Nandor Han <nandor.han@vaisala.com>
Message-ID: <74327f03-4bad-8dee-d0a0-e207d652f6e9@vaisala.com>
Date: Wed, 13 Oct 2021 08:43:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: 
 <CAMKF1spg-TsiB4LjN-WP5MEhBOqjQcGdMGbVX6F_Xc=tCkc6Tg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 13 Oct 2021 05:43:33.0497 (UTC)
 FILETIME=[428A4690:01D7BFF5]
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Oct 2021 05:43:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93272

On 10/13/21 8:39 AM, Khem Raj wrote:
> this is already applied with
> https://eur03.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.openembedded.org%2Fmeta-openembedded%2Fcommit%2F%3Fid%3De078ffd4ce&amp;data=04%7C01%7Cnandor.han%40vaisala.com%7C51fe01b4b06e427adc0108d98e0bec31%7C6d7393e041f54c2e9b124c2be5da5c57%7C0%7C0%7C637697004122220940%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=jwwF6KG2NPti4u5paCHjGal0RXShRJFDax3PW%2BFNmyM%3D&amp;reserved=0
> if we missed anything please send a rebased patch.
> 

Looks good. Doesn't need anything, it was just me failing to find it.

Thanks,
    Nandor

