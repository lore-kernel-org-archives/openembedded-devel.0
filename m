Return-Path: <alexander@amelkin.msk.ru>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F18C77B75
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 13:23:28 +0000 (UTC)
Received: from mail.fiord.ru (mail.fiord.ru [62.140.247.50])
 by mx.groups.io with SMTP id smtpd.web10.26237.1684502597860721648
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 May 2023 06:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: amelkin.msk.ru, ip: 62.140.247.50, mailfrom: alexander@amelkin.msk.ru)
Received: from [::1] (helo=mail.fiord.ru)
	by mail.fiord.ru with esmtp (Exim 4.94.2)
	(envelope-from <alexander@amelkin.msk.ru>)
	id 1q004f-00341q-23; Fri, 19 May 2023 16:23:13 +0300
MIME-Version: 1.0
Date: Fri, 19 May 2023 16:23:12 +0300
From: Alexander Amelkin <alexander@amelkin.msk.ru>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] ipmitool: Update links
In-Reply-To: <CAMKF1sqb8dVmxyoMT4cQTc9XVTtf1PpKin5Dmx=6u_oVRAFOGA@mail.gmail.com>
References: <20230518204107.11647-1-alexander@amelkin.msk.ru>
 <27030.1684442805942276634@lists.openembedded.org>
 <CAMKF1sqb8dVmxyoMT4cQTc9XVTtf1PpKin5Dmx=6u_oVRAFOGA@mail.gmail.com>
Message-ID: <42179e5316d179b49511dc7b3cbe4101@amelkin.msk.ru>
X-Sender: alexander@amelkin.msk.ru
X-Remote-Browser: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36
 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.58
X-Originating-IP: [89.207.88.249]
X-RoundCube-Server: 62.140.247.50
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 13:23:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102673

I would gladly do so if only github didn't ban me being an employee of a 
spontaneously sanctioned company.
That actually caused the project transfer to CodeBerg and this very 
patch.

I'm wondering what could be wrong with the patch tough. Maybe I should 
add some options to git-format-patch? Any ideas?
What version of git are you using there?

WBR, Alexander Amelkin

On 2023-05-19 03:10, Khem Raj wrote:
> it still doesn't work. Maybe send a github PR
> 
> On Thu, May 18, 2023 at 1:46 PM Alexander Amelkin
> <alexander@amelkin.msk.ru> wrote:
>> 
>> This last one one has been directly send by `git format-patch` and 
>> `git send-email`, without any modification.
>> Please tell me if it works for you.
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#102666): 
>> https://lists.openembedded.org/g/openembedded-devel/message/102666
>> Mute This Topic: https://lists.openembedded.org/mt/98903374/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub 
>> [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>> 

