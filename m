Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850F3C433F5
	for <webhook@archiver.kernel.org>; Sun, 23 Jan 2022 12:08:25 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.8752.1642939704426362328
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jan 2022 04:08:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout12.t-online.de (Postfix) with SMTP id B9A24BB4B;
	Sun, 23 Jan 2022 13:08:00 +0100 (CET)
Received: from [192.168.178.83] ([84.163.32.167]) by fwd83.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nBbf5-16geQb0; Sun, 23 Jan 2022 13:07:59 +0100
Subject: Re: [oe] [meta-gnome][PATCH 1/2] geary: initial add recipe
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
 openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220120202643.3827177-1-f_l_k@t-online.de>
 <16CCB430AE750F17.20408@lists.openembedded.org>
 <CALbNGRSe-7eYQqyJAZE0HU5VuKG0KLMg6TyOUphbNyg2BVbHzw@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
Message-ID: <8efcf4ea-21c5-fb10-29fc-e4fe3e5a9522@t-online.de>
Date: Sun, 23 Jan 2022 13:07:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CALbNGRSe-7eYQqyJAZE0HU5VuKG0KLMg6TyOUphbNyg2BVbHzw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TOI-EXPURGATEID: 150726::1642939679-0000EDC4-72492DD8/0/0 CLEAN NORMAL
X-TOI-MSGID: 54641fc5-eb2c-45a7-9f2e-d826f6ff2a86
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Jan 2022 12:08:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95014

Hi Andreas,

i sent a patch to add it to gnome apps packagegroup.

Cheers

Markus

Am 22.01.22 um 22:19 schrieb Andreas M=C3=BCller:
> I forgot: Please add it to packagegroup-gnome-apps in a follow-up
>
> Cheers
>
> Andreas
>
> On Sat, Jan 22, 2022 at 10:14 PM Andreas M=C3=BCller via
> lists.openembedded.org
> <schnitzeltony=3Dgmail.com@lists.openembedded.org> wrote:
>> On Sat, Jan 22, 2022 at 8:29 PM Markus Volk <f_l_k@t-online.de> wrote:
>>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>>> ---
>>>   .../recipes-connectivity/geary/geary_40.0.bb  | 54 ++++++++++++++++=
+++
>>>   1 file changed, 54 insertions(+)
>>>   create mode 100644 meta-gnome/recipes-connectivity/geary/geary_40.0=
.bb
>>>
>> This is on my TODO for so long - did not find the time. Thanks!
>>
>> Andreas
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#95006): https://lists.openembedded.org/g/openembed=
ded-devel/message/95006
>> Mute This Topic: https://lists.openembedded.org/mt/88611343/3617609
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [schnitzeltony@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

