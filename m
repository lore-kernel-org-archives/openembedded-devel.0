Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF6BC4167B
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 08:33:18 +0000 (UTC)
Subject: Re: [meta-multimedia][PATCH] libupnp: upgrade 1.14.6 -> 1.14.18
To: openembedded-devel@lists.openembedded.org
From: "Alper Ak" <alperyasinak1@gmail.com>
X-Originating-Location: Istanbul, TR (176.33.65.238)
X-Originating-Platform: Linux Firefox 119
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 13 Nov 2023 00:33:13 -0800
References: <CAMKF1so-Ri5kx6AC=NoMJwWFLcxSuLRbjEvNcyoF3+pK9XaJSg@mail.gmail.com>
In-Reply-To: <CAMKF1so-Ri5kx6AC=NoMJwWFLcxSuLRbjEvNcyoF3+pK9XaJSg@mail.gmail.com>
Message-ID: <32560.1699864393512714512@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ZEtZDwsomcIb3bU9s8Ms"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 08:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106633

--ZEtZDwsomcIb3bU9s8Ms
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Since conditional expressions are removed in the new version, I removed the=
m thinking that the patch is not needed. They are now defined directly.

https://github.com/pupnp/pupnp/commit/c0b552973c5db6dbe4dd0bdc47496da3d7af9=
606

As far as I have researched, people say that it will be enough to define TC=
LIBC =3D "musl" in local.conf so that I can test it on musl systems, but ge=
t errors from poky's runqueue and process scripts. How can I check if a rec=
ipe can be buildable or not on musl systems?

By the way, I have just started to contribute to Yocto. In addition, I am n=
ew to software world. Your feedback and help is very important for me, than=
k you.

--ZEtZDwsomcIb3bU9s8Ms
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Since conditional expressions are removed in the new version, I removed =
them thinking that the patch is not needed. They are now defined directly.<=
/p>
<p><a href=3D"https://github.com/pupnp/pupnp/commit/c0b552973c5db6dbe4dd0bd=
c47496da3d7af9606" target=3D"_blank" rel=3D"noopener">https://github.com/pu=
pnp/pupnp/commit/c0b552973c5db6dbe4dd0bdc47496da3d7af9606</a></p>
<p>As far as I have researched, people say that it will be enough to define=
 TCLIBC =3D "musl" in local.conf so that I can test it on musl systems, but=
 get errors from poky's runqueue and process scripts. How can I check if a =
recipe can be buildable or not on musl systems?</p>
<p>By the way, I have just started to contribute to Yocto. In addition, I a=
m new to software world. Your feedback and help is very important for me, t=
hank you.</p>

--ZEtZDwsomcIb3bU9s8Ms--

