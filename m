Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128B9D65554
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 19:49:15 +0000 (UTC)
Subject: Re: [meta-python][PATCH] python3-isodate: move from oe-core to meta-python
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Firefox 133
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 26 Nov 2024 11:49:10 -0800
References: <CAMKF1spHnyCO-9Jmhfc=65aEEDpDKk_2PNktuTetCDqLDBucUg@mail.gmail.com>
In-Reply-To: <CAMKF1spHnyCO-9Jmhfc=65aEEDpDKk_2PNktuTetCDqLDBucUg@mail.gmail.com>
Message-ID: <2202.1732650550888559982@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="hKuIjphr0kKTWiAAFLfg"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 19:49:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114079

--hKuIjphr0kKTWiAAFLfg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 07:16 PM, Khem Raj wrote:

>=20
> are their any known packages that will need this ? otherwise I would
> think its best to just let it go

Hi Khem, I'm not aware of any packages which need python3-isodate. But it i=
s currently listed in packagegroup-meta-python.bb (not sure why).

I'd be in favor of removing the recipe.

--hKuIjphr0kKTWiAAFLfg
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Nov 26, 2024 at 07:16 PM, Khem Raj wrote:</div>
<div>
<blockquote>are their any known packages that will need this ? otherwise I =
would<br />think its best to just let it go</blockquote>
Hi Khem, I'm not aware of any packages which need python3-isodate. But it i=
s currently listed in packagegroup-meta-python.bb (not sure why).</div>
<div>&nbsp;</div>
<div>I'd be in favor of removing the recipe.</div>

--hKuIjphr0kKTWiAAFLfg--

