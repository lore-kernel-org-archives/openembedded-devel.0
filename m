Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F69CA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 18:27:04 +0000 (UTC)
Subject: Re: [meta-oe][PATCH] pocketpy: Upgrade to 2.1.1
To: openembedded-devel@lists.openembedded.org
From: "Michael Fitzmayer" <mail@michael-fitzmayer.de>
X-Originating-Location: Ludwigsburg, Baden-Wurttemberg, DE (46.223.149.161)
X-Originating-Platform: Windows Firefox 142
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 03 Sep 2025 11:27:03 -0700
References: <CAMKF1sq-jwOYHSYbfAyDgZFAbwFTAYps1OQCbT5a0rpNsn2fRg@mail.gmail.com>
In-Reply-To: <CAMKF1sq-jwOYHSYbfAyDgZFAbwFTAYps1OQCbT5a0rpNsn2fRg@mail.gmail.com>
Message-ID: <9129.1756924023101392693@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="3Q0ycBUl6eNcWAM3DXG8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 18:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119265

--3Q0ycBUl6eNcWAM3DXG8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 08:12 PM, Khem Raj wrote:

>=20
> On Wed, Sep 3, 2025 at 11:10=E2=80=AFAM Michael Fitzmayer via
> lists.openembedded.org
> <mail=3Dmichael-fitzmayer.de@lists.openembedded.org> wrote:
>=20
>> LICENSE =3D "MIT"
>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8cdfa87bc5e09bc07f8cf6413502=
6d91"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc292beb20a17db07c359b0cc2c03=
9027"
>=20
> Please describe what changed here, in License-Update: tag in commit msg.

The year in the copyright notice has been updated.

>=20
>=20
>> inherit cmake
>>=20
>> +EXTRA_OECMAKE =3D "\
>> + -DPK_ENABLE_OS=3DON \
>=20
> why is this change needed?

This is an optional feature that allows PocketPy to perform file operations=
.

--3Q0ycBUl6eNcWAM3DXG8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Wed, Sep 3, 2025 at 08:12 PM, Khem Raj wrote:</div>
<div>
<blockquote>On Wed, Sep 3, 2025 at 11:10=E2=80=AFAM Michael Fitzmayer via<b=
r />lists.openembedded.org<br />&lt;mail=3Dmichael-fitzmayer.de@lists.opene=
mbedded.org&gt; wrote:<br />
<blockquote>LICENSE =3D "MIT"<br />-LIC_FILES_CHKSUM =3D "file://LICENSE;md=
5=3D8cdfa87bc5e09bc07f8cf64135026d91"<br />+LIC_FILES_CHKSUM =3D "file://LI=
CENSE;md5=3Dc292beb20a17db07c359b0cc2c039027"</blockquote>
Please describe what changed here, in License-Update: tag in commit msg.</b=
lockquote>
</div>
<div>The year in the copyright notice has been updated.</div>
<div><br />
<blockquote>
<blockquote>inherit cmake<br /><br />+EXTRA_OECMAKE =3D "\<br />+ -DPK_ENAB=
LE_OS=3DON \</blockquote>
why is this change needed?</blockquote>
</div>
<div>This is an optional feature that allows PocketPy to perform file opera=
tions.</div>
<div>&nbsp;</div>

--3Q0ycBUl6eNcWAM3DXG8--

