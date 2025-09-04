Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB76CA1015
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 07:48:08 +0000 (UTC)
Subject: Re: [meta-oe][PATCH 1/3] libsdl2-ttf: require distro feature opengl
To: openembedded-devel@lists.openembedded.org
From: "hongxu" <hongxu.jia@eng.windriver.com>
X-Originating-Location: US (128.224.246.2)
X-Originating-Platform: Linux Chrome 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 04 Sep 2025 00:48:06 -0700
References: <B746C75C-52F6-4089-8590-488EA735443B@arm.com>
In-Reply-To: <B746C75C-52F6-4089-8590-488EA735443B@arm.com>
Message-ID: <4495.1756972086124594457@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Ypk2ytBPTE8MRataLOj6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 07:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119270

--Ypk2ytBPTE8MRataLOj6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 03:24 AM, Ross Burton wrote:

>=20
> GL is only used for an example binary, so it would be better to simply
> disable those with -DSDL2TTF_SAMPLES=3DOFF.

Sure, I will add PACKAGECONFIG opengl to enable/disable it, please drop thi=
s review, v2 incoming

//Hongxu

>=20
> Ross

--Ypk2ytBPTE8MRataLOj6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Wed, Sep 3, 2025 at 03:24 AM, Ross Burton wrote:</div>
<div>
<blockquote>GL is only used for an example binary, so it would be better to=
 simply disable those with -DSDL2TTF_SAMPLES=3DOFF.</blockquote>
Sure, I will add PACKAGECONFIG opengl to enable/disable it, please drop thi=
s review, v2 incoming</div>
<div>&nbsp;</div>
<div>//Hongxu<br />
<blockquote>Ross</blockquote>
</div>

--Ypk2ytBPTE8MRataLOj6--

