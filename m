Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD216C52D6F
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 11:07:39 +0000 (UTC)
Subject: Re: [meta-python] [PATCH 37/60] python3-incremental: upgrade 22.10.0 -> 24.7.2
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudnimar@noxmedical.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Chrome 127
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 06 Aug 2024 04:07:32 -0700
References: <1722933994-32549-37-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1722933994-32549-37-git-send-email-wangmy@fujitsu.com>
Message-ID: <30467.1722942452178350507@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="S7SwPAlhhGN0uV4nJWhe"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 11:07:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111578

--S7SwPAlhhGN0uV4nJWhe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

In this update python3-twisted-core should be removed from RDEPENDS:${PN}-s=
cripts

twisted is no longer a dependency with this release, it is only used for te=
sts.

--S7SwPAlhhGN0uV4nJWhe
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>In this update python3-twisted-core should be removed from RDEPENDS:${=
PN}-scripts</div>
<div>&nbsp;</div>
<div>twisted is no longer a dependency with this release, it is only used f=
or tests.</div>

--S7SwPAlhhGN0uV4nJWhe--

