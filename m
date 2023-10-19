Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF96CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 13:51:40 +0000 (UTC)
Subject: Re: [meta-java][master][PATCH] meta-java: Adapt LICENSE as SPDX identifiers
To: openembedded-devel@lists.openembedded.org
From: "akash hadke" <akash.hadke27@gmail.com>
X-Originating-Location: US (136.226.232.249)
X-Originating-Platform: Linux Chrome 118
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 19 Oct 2023 06:51:35 -0700
References: <6763.1697708094189515372@lists.openembedded.org>
In-Reply-To: <6763.1697708094189515372@lists.openembedded.org>
Message-ID: <19195.1697723495602103996@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="4hBDXjVwQ3PMOa8Hk7QV"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 13:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105601

--4hBDXjVwQ3PMOa8Hk7QV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 03:04 PM, Jermain Horsman wrote:

>=20
> On Wed, Oct 18, 2023 at 12:44 PM, akash hadke wrote:
>=20
>=20
>> diff --git a/recipes-core/cacao/cacao_git.bb
>> b/recipes-core/cacao/cacao_git.bb
>> index fef7f34..80129b1 100644
>> --- a/recipes-core/cacao/cacao_git.bb
>> +++ b/recipes-core/cacao/cacao_git.bb
>> @@ -1,6 +1,6 @@
>> SUMMARY =3D "CacaoVM for use as OpenEmbedded's Java VM"
>> HOMEPAGE =3D " http://www.cacaojvm.org/"
>> -LICENSE =3D "GPL-2.0"
>> +LICENSE =3D "GPL-2.0-only"
>> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
>> SECTION =3D "interpreters"
>=20
> You might want to double check the source,
> a quick look at e.g. https://bitbucket.org/cacaovm/cacao/src/master/COPYI=
NG
> :
>=20
> This program is free software; you can redistribute it and/or modify
> it under the terms of the GNU General Public License as published by
> the Free Software Foundation; either version 2 of the License, or
> (at your option) any later version.
>=20
> shows this should be 'GPL-2.0-or-later' instead.

I only executed poky/scripts/contrib/convert-spdx-licenses.py script to upd=
ate the LICENSEs as per kirkstone.
I did not check the source.
If you want I can share a separate patch to update LICENSE for this specifi=
c component.

--4hBDXjVwQ3PMOa8Hk7QV
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 03:04 PM, Jermain Horsman wrote:<br />
<blockquote>On Wed, Oct 18, 2023 at 12:44 PM, akash hadke wrote:<br /><br /=
>
<blockquote>diff --git a/recipes-core/cacao/cacao_git.bb b/recipes-core/cac=
ao/cacao_git.bb<br />index fef7f34..80129b1 100644<br />--- a/recipes-core/=
cacao/cacao_git.bb<br />+++ b/recipes-core/cacao/cacao_git.bb<br />@@ -1,6 =
+1,6 @@<br />SUMMARY =3D "CacaoVM for use as OpenEmbedded's Java VM"<br />H=
OMEPAGE =3D "<a href=3D"http://www.cacaojvm.org/&quot;" target=3D"_blank" r=
el=3D"noopener">http://www.cacaojvm.org/"</a><br />-LICENSE =3D "GPL-2.0"<b=
r />+LICENSE =3D "GPL-2.0-only"<br />LIC_FILES_CHKSUM =3D "file://COPYING;m=
d5=3D59530bdf33659b29e73d4adb9f9f6552"<br />SECTION =3D "interpreters"</blo=
ckquote>
You might want to double check the source, <br />a quick look at e.g. <a hr=
ef=3D"https://bitbucket.org/cacaovm/cacao/src/master/COPYING" target=3D"_bl=
ank" rel=3D"noopener">https://bitbucket.org/cacaovm/cacao/src/master/COPYIN=
G</a>:<br /><br />This program is free software; you can redistribute it an=
d/or modify<br />it under the terms of the GNU General Public License as pu=
blished by<br />the Free Software Foundation; either version 2 of the Licen=
se, or<br />(at your option) any later version.<br /><br />shows this shoul=
d be 'GPL-2.0-or-later' instead.</blockquote>
I only executed&nbsp;<span style=3D"white-space-collapse: preserve;">poky/s=
cripts/contrib/convert-spdx-licenses.py script to update the LICENSEs as pe=
r kirkstone.<br />I did not check the source.<br />If you want I can share =
a separate patch to update LICENSE for this specific component.<br /><br />=
</span>

--4hBDXjVwQ3PMOa8Hk7QV--

