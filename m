Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A278C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 18:21:22 +0000 (UTC)
Subject: plymouth_24.004.60 causes to not pop up login prompt
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
X-Originating-Location: Bojano, Pomerania, PL (185.53.145.148)
X-Originating-Platform: Linux Firefox 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 21 Jan 2025 14:45:23 -0800
Message-ID: <tCev.1737499523488315680.yQwU@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="gZP2reJypsEPvSDPldKQ"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 18:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115035

--gZP2reJypsEPvSDPldKQ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,
I'm working on scarthgap branch, as i have recentlly updated from kirkstone=
 and encountered a strange issue.

As in subject I'm not getting login prompt when using plymouth as splash ut=
ility, but only a message like 'Starting systemd-udevd version 255.13`. Whe=
n I hit alt+f2 I will switch to tty2 and than again alt+f1 i'm getting tty1=
 so that is fine but for some reason plymouth is casuing this screen hangup=
 and I do not know what is causing it. Maybe some of you encountered it?

BR
Piotr

--gZP2reJypsEPvSDPldKQ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi all,</div>
<div>I'm working on scarthgap branch, as i have recentlly updated from kirk=
stone and encountered a strange issue.</div>
<div>&nbsp;</div>
<div>As in subject I'm not getting login prompt when using plymouth as spla=
sh utility, but only a message like 'Starting systemd-udevd version 255.13`=
. When I hit alt+f2 I will switch to tty2 and than again alt+f1 i'm getting=
 tty1 so that is fine but for some reason plymouth is casuing this screen h=
angup and I do not know what is causing it. Maybe some of you encountered i=
t?</div>
<div>&nbsp;</div>
<div>BR</div>
<div>Piotr</div>

--gZP2reJypsEPvSDPldKQ--

