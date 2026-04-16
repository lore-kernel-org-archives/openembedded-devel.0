Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A9CF8D76C
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 19:10:46 +0000 (UTC)
Subject: Re: [meta-oe][kirkstone][PATCH] rocksdb: remove rocksdb_static from default PACKAGECONFIG
To: openembedded-devel@lists.openembedded.org
From: "aszh07" <mail2szahir@gmail.com>
X-Originating-Location: Chennai, Tamil Nadu, IN (167.103.88.251)
X-Originating-Platform: Linux Edge 145
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 16 Apr 2026 12:10:43 -0700
References: <20260415182040.1193544-1-zahir.basha@partner.bmwgroup.com> <2b4203a9-6dd0-48b9-bb67-91c134acc010@gmail.com>
In-Reply-To: <2b4203a9-6dd0-48b9-bb67-91c134acc010@gmail.com>
Message-ID: <1451444.1776366643402500662@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="usV2yRTYYuLUGRNBqAAx"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 19:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126406

--usV2yRTYYuLUGRNBqAAx
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 11:57 PM, Gyorgy Sarvari wrote:

>=20
> PACKAGECONFIG ??=3D "bzip2 zlib lz4 gflagsi rocksdb_static"

Just a heads-up=E2=80=94I spotted a typo in the PACKAGECONFIG string. It sa=
ys gflagsi instead of gflags.
will you correct the typo or can i send the patch for this?

--usV2yRTYYuLUGRNBqAAx
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Wed, Apr 15, 2026 at 11:57 PM, Gyorgy Sarvari wrote:</div>
<div>
<blockquote>PACKAGECONFIG ??=3D "bzip2 zlib lz4 gflagsi rocksdb_static"</bl=
ockquote>
<br />Just a heads-up&mdash;I spotted a typo in the PACKAGECONFIG string. I=
t says gflagsi instead of gflags.<br />will you correct the typo or can i s=
end the patch for this?</div>

--usV2yRTYYuLUGRNBqAAx--

