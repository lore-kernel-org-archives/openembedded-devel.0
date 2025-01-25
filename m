Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1CDC0218C
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 15:08:56 +0000 (UTC)
Subject: Re: [meta-python][PATCH] python3-posix-ipc: use correct C compiler to detect system features
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Firefox 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 07:08:54 -0800
References: <20250125124419.245571-1-skandigraun@gmail.com>
In-Reply-To: <20250125124419.245571-1-skandigraun@gmail.com>
Message-ID: <6995.1737817734892932269@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="mVsI0Bp9hyvLrVkK3xEM"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 15:08:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115080

--mVsI0Bp9hyvLrVkK3xEM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Just to add to this topic, I resolved the problem on Scarthgap by adding 'c=
c' to HOSTTOOLS locally in local.conf. Not sure if its the best/correct app=
roach. My host machine runs Ubuntu and there cc is just a symlink to gcc.

Great to see a fix proposed upstream :)

--mVsI0Bp9hyvLrVkK3xEM
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Just to add to this topic, I resolved the problem on Scarthgap by addi=
ng 'cc' to HOSTTOOLS locally in local.conf. Not sure if its the best/correc=
t approach. My host machine runs Ubuntu and there cc is just a symlink to g=
cc.</div>
<div>&nbsp;</div>
<div>Great to see a fix proposed upstream :)</div>

--mVsI0Bp9hyvLrVkK3xEM--

