Return-Path: <ashishkumar.mishra@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F320E98DE4
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 05:43:13 +0000 (UTC)
Subject: Re: [RFC_V2] [meta-oe]: Improving ext* sparse image generation: migrating from img2simg to ext2simg_android for ext* filesystem
To: openembedded-devel@lists.openembedded.org
From: "AshishKumar Mishra" <ashishkumar.mishra@bmwtechworks.in>
X-Originating-Location: IN (1.7.105.116)
X-Originating-Platform: Windows Edge 145
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 22 Feb 2026 21:43:08 -0800
References: <rGsP.1771488393837852960.eVnE@lists.openembedded.org> <a11b45eb-1ee0-4274-9780-5a86105a7a1f@gmail.com>
In-Reply-To: <a11b45eb-1ee0-4274-9780-5a86105a7a1f@gmail.com>
Message-ID: <1030996.1771825388005282969@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ITvWWTaa8waAN3vBNMGk"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 05:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124539

--ITvWWTaa8waAN3vBNMGk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks=C2=A0 Gyorgy Sarvari

1) w.r.t "What happens if you add "-Wl,-rpath=3D../${baselib}=C2=A0-Wl,-rpa=
th=3D../../${baselib}" (or similar) to LDFLAGS?"
Will try this and share the observation

2) e2fsprogs-ext4sparse.inc is missing from the attached patch.
This is standard e2fsprogs.inc renamed for continuity in recipe

- Ashish

--ITvWWTaa8waAN3vBNMGk
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Thanks&nbsp; Gyorgy Sarvari</div>
<div>&nbsp;</div>
<div>1) w.r.t "What happens if you add "-Wl,-rpath=3D../${baselib}&nbsp;-Wl=
,-rpath=3D../../${baselib}" (or similar) to LDFLAGS?"</div>
<div>&nbsp; &nbsp; &nbsp; Will try this and share the observation&nbsp;</di=
v>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>&nbsp;&nbsp;</span></div>
<div>2) e2fsprogs-ext4sparse.inc is missing from the attached patch.</div>
<div>&nbsp; &nbsp; &nbsp; This is standard e2fsprogs.inc renamed for contin=
uity in recipe&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>- Ashish</div>
</div>

--ITvWWTaa8waAN3vBNMGk--

