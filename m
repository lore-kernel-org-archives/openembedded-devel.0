Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 919BD60670
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jan 2016 09:45:52 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id f206so128194879wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jan 2016 01:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=hhRO5uVvIC85rmyRqVXYirHGwEXhExsbq/4kI+jky+8=;
	b=cFSv45txQ4zWFCEgPrBPV9kUl5waEYFdCA5V7md/Vkczq1qnktgBtV52mLJ+D6z9bQ
	poF6G6AoLHPSuGcuV8MAk0Zx0R8mKfVq9kDEKZWhXZj2lAE5hgwvIV1DP8nOWrwrPj4C
	gJFDka2eDS0+wl34WssWHcCcQxsZYabwLwfc4X2LGFSx4YMvTlt8hHUYyGZhN3qNxoUO
	e5eBjhuUP6Rc4i3nx7xVbrBNsW+aZ2KvdqnMhu3nkzBM7Y+V4fnh65HjDZYP4JTnqCm0
	Z47OwD9Fc5rN2nxOSa/r20P/E/m4jN2djA8Y3bK1TMES2znAx9MSrRotxA1Zz0/ERZm6
	YGFA==
X-Received: by 10.194.240.194 with SMTP id wc2mr119374221wjc.27.1452246353445; 
	Fri, 08 Jan 2016 01:45:53 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	g187sm17653600wmf.8.2016.01.08.01.45.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jan 2016 01:45:52 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA010C7876F5@ALA-MBA.corp.ad.wrs.com>
Date: Fri, 8 Jan 2016 10:45:51 +0100
Message-Id: <9E3A8ABC-AAB1-4EA5-8F80-B1E2A1B161BE@gmail.com>
References: <cover.1450864063.git.jackie.huang@windriver.com>
	<0E1F3B26-55DA-44FC-BEC4-8AE2277A9D07@gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C786816@ALA-MBA.corp.ad.wrs.com>
	<9C9059BF-A1B5-4E59-97F3-BF2C2CC028F2@gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C7876F5@ALA-MBA.corp.ad.wrs.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-java][PATCH 0/2] openjdk-8-native: fix	do_install	and PROVIDES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jan 2016 09:45:55 -0000
X-Groupsio-MsgNum: 59417
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7FDB11AA-7D10-46C2-A73F-C971585A1109";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_7FDB11AA-7D10-46C2-A73F-C971585A1109
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> Am 07.01.2016 um 04:00 schrieb Huang, Jie (Jackie) =
<Jackie.Huang@windriver.com>:
>=20
>=20
>=20
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-
>> bounces@lists.openembedded.org] On Behalf Of Jens Rehsack
>> Sent: Wednesday, January 06, 2016 9:57 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [meta-java][PATCH 0/2] openjdk-8-native: fix =
do_install and PROVIDES
>>=20
>>=20
>>> Am 06.01.2016 um 08:03 schrieb Huang, Jie (Jackie) =
<Jackie.Huang@windriver.com>:
>>>=20
>>>=20
>>>=20
>>>> -----Original Message-----
>>>> From: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-
>>>> bounces@lists.openembedded.org] On Behalf Of Jens Rehsack
>>>> Sent: Tuesday, January 05, 2016 3:21 AM
>>>> To: openembedded-devel@lists.openembedded.org
>>>> Subject: Re: [oe] [meta-java][PATCH 0/2] openjdk-8-native: fix =
do_install and PROVIDES
>>>>=20
>>>> It's insane re-introducing a virtual/javac-native without =
understanding
>>>> the issues coming with that.
>>>=20
>>> Please carefully review the patches before saying insane, I don't =
think it was
>>> correct to remove virtual/javac-native since there are several =
providers.
>>=20
>> What does virtual/javac-native mean? Correctly, there can be several =
providers.
>>=20
>> How many of them can you have in one sysroot/build? One.
>>=20
>> So - when in an openjdk-7 or openjdk-8 bootstrap 4 recipes PROVIDE =
virtual/javac-native,
>> what happens?
>=20
> So seem like you don't really understand how it should be used.
>=20
> Yes, only one we can have when there are multiple providers, that's =
why we should
> use PREFERRED_PROVIDER to determines which one it is, and use the =
virtual/foo
> instead of specific provider's name in DEPENDS/RDEPENDS of the recipe =
that requires it,
> so we can ensure only one will be built and avoid conflicts.

And there starts your misunderstanding:

You can't even install multiple providers, even when picking one.
But doesn't icedtea7-native provide virtual/java-native and =
virtual/javac-native?
Doesn't openjdk-8-native provide virtual/java-native and =
virtual/javac-native?

When virtual/java-native is only for bootstrapping, that it's misused =
and
must be removed. Providers are for abstraction, not for confusing.

> FYI:
> =
http://www.yoctoproject.org/docs/2.0/bitbake-user-manual/bitbake-user-manu=
al.html#bb-bitbake-preferences
> =
http://www.yoctoproject.org/docs/2.0/ref-manual/ref-manual.html#var-PREFER=
RED_PROVIDER
>=20
>>=20
>> It is insane to have multiple providers for the same virtual/foo when =
at least a bunch
>=20
> Virtual/foo and PREFERRED_PROVIDER is one of the mechanisms to handle =
multiple providers,
> (another one is update-alternatives which is not supported by -native =
recipe), and work fine
> in many projects, why is it insane here?

Insane is, that you cannot choose - you have to install all until you =
reach the required
Java language level.

> I tested my patches to build openjdk7, openjdk8 and most recipes in =
meta-java with and without sstate
> on qemux86-64, qemuarm, qemuppc and some of our BSPs and they all =
built fine (previous method
> fails to build openjdk7 sometime and always fail when build with =
sstate)

That has nothing to do with the providers, it has to do with the wrong =
install of same
binary to a place where another one has been installed. This has to do =
with alternatives,
not providers.

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_7FDB11AA-7D10-46C2-A73F-C971585A1109
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWj4VPAAoJEESZlq7c5QqdgGoQAKAfHB+zTH86VOfsklJBCs7f
pYpgHamL9WayZPgXQJNhb1BCcav6CecHqs3c6NSVzL9G+zbCPt/SU/5pyJkH9SyJ
qeeyZ/IYZ5YhgLHnci4VLkKJp7nS8gJEJrHKi3LmzqPEYcC67M1gMWYd08zixJrJ
fxtYSdz7t9wL+3iJKQJONbMbpm483eCwDezjyN7aUrk7fDviK2D7FnHi/F2UU45L
8p2PYJdpKycjkUIxhn23SPbx/VubObSP8t2QSBaSbUjpnQarc9Dp/PasIBj+vZd8
TGtyd5bjMxinbqFuYDGUGpoyYTEhm+uVwMkLP070yiPBssMoeJMXxCAZ/q2I3lZw
5uGfRZ6Tk11xahMOit9ch8kt2cpaI/nvGJdIB4vAUKqvFDXnaB42iuqeCcT67d3/
LjuUqSJE2aRD+KfEdCcHHvDGj5pH39jjy6CDEbOakYMgteteTGXdGXa+iYraJjpL
KsiAn7kNUwWYi05YinYxyFag7apQNQAVgf79DjfJ/A30BijVm11NphQEnI3VEtlv
7KROn2YHIT+um/nWLxYFzMNWfeqHHApwQgUETV107I3aoXtnhZYcOSxiemrusCKM
A/I/xx+ufNKPrnD5C0tMBU7mpftkJ9pjMyA6gTTEv/eR5sBTScPAPpOMIg5OgTNs
DcX93AZz9bfv2BwP70vC
=ZBeJ
-----END PGP SIGNATURE-----

--Apple-Mail=_7FDB11AA-7D10-46C2-A73F-C971585A1109--
