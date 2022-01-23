Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F05C433EF
	for <webhook@archiver.kernel.org>; Sun, 23 Jan 2022 13:35:57 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web12.9439.1642944956361446725
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jan 2022 05:35:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id B7C8C160
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jan 2022 14:35:54 +0100 (CET)
Received: from [192.168.178.83] ([84.163.32.167]) by fwd74.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nBd29-3AxPsX0; Sun, 23 Jan 2022 14:35:53 +0100
Subject: Re: [oe] [meta-gnome][PATCHv2] folks: initial add recipe
To: openembedded-devel@lists.openembedded.org
References: <20220120203602.3833757-1-f_l_k@t-online.de>
 <33c62297-f753-3c63-d409-d6ed774ace94@t-online.de>
 <CANNYZj9V_6q9S-vovMMw7i3GdJjog==9EXDCJ_+SMnknCNxHuQ@mail.gmail.com>
 <baeb1c77-f334-2282-3a40-19916962332d@t-online.de>
 <CANNYZj-0DoW9ehFHpPML2hT-rKBHju3B41j24sA=PAKkXVpNOw@mail.gmail.com>
 <6c490468-aadb-e91d-28ce-551f21e3605a@t-online.de>
 <CANNYZj-NYuqo4ftRvwgntDuBBky=V=SxELTC1BXdJEL9qBeHYw@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
Message-ID: <58bd9ebd-583f-e7e9-6c3b-af14772c4f7e@t-online.de>
Date: Sun, 23 Jan 2022 14:35:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CANNYZj-NYuqo4ftRvwgntDuBBky=V=SxELTC1BXdJEL9qBeHYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TOI-EXPURGATEID: 150726::1642944953-00012DCC-A3837CA8/0/0 CLEAN NORMAL
X-TOI-MSGID: 8a9fa469-aaa1-4631-989c-312122ea746b
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Jan 2022 13:35:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95021

What brought me to thinking this really is a design decision was this 
conversation some time back

https://gitlab.gnome.org/GNOME/gimp/-/issues/7208

Am 23.01.22 um 14:28 schrieb Alexander Kanavin:
> nd see what they have to say

