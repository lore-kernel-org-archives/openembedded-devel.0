Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0F621731E5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 10:01:48 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id f206so259457671wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 02:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=ueHnH7YmyvMZz34Cyi9cK9s9NJu3E+wrBP1X+P9Lhag=;
	b=AU0ROU/2+9quBNpTu1Bv9c2pR7CTVtaJmYxIpc/Jgfg6CTsUMWAb+uls7rWy8yD2dL
	ERT6LwXmcRU/0H80MYeeiIjhIC0z3/jQfQpQE3WG5+o2bFQNoCXtC+dD5wKAknfnBrOO
	TL7SNZARWai8y5Tf/RhFKoBsQBORHkXFgJLsZG/01K2mo4379H8ChHS+1QwLfw+wny9B
	pG/RK8lKyVt+q1a8sPyV/A+k1Dj9X/cITZ+gl90jK8EFhF3Elw5YiMSv3JRRBTfb/uhw
	kNGIvcrI/M04gO+TKE3H2n7gGb5qcaPG9JK0EjiWK8uPWV3ODLIWE6ik/S5PE7ka1lpb
	YA/A==
X-Received: by 10.28.16.8 with SMTP id 8mr13685431wmq.77.1452506508763;
	Mon, 11 Jan 2016 02:01:48 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	75sm12009811wmo.22.2016.01.11.02.01.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 02:01:48 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA010C78A13B@ALA-MBA.corp.ad.wrs.com>
Date: Mon, 11 Jan 2016 11:01:54 +0100
Message-Id: <E0EC0FF8-2613-41F1-AC02-A0EE125D362B@gmail.com>
References: <cover.1450864063.git.jackie.huang@windriver.com>
	<0E1F3B26-55DA-44FC-BEC4-8AE2277A9D07@gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C786816@ALA-MBA.corp.ad.wrs.com>
	<9C9059BF-A1B5-4E59-97F3-BF2C2CC028F2@gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C7876F5@ALA-MBA.corp.ad.wrs.com>
	<9E3A8ABC-AAB1-4EA5-8F80-B1E2A1B161BE@gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C78A13B@ALA-MBA.corp.ad.wrs.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-java][PATCH 0/2] openjdk-8-native:	fix	do_install	and PROVIDES
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
X-List-Received-Date: Mon, 11 Jan 2016 10:01:49 -0000
X-Groupsio-MsgNum: 59461
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B71FF2F2-C63D-430F-9B24-D699EFD83174";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_B71FF2F2-C63D-430F-9B24-D699EFD83174
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> Am 09.01.2016 um 15:22 schrieb Huang, Jie (Jackie) =
<Jackie.Huang@windriver.com>:
>=20
>=20
>=20
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-
>> bounces@lists.openembedded.org] On Behalf Of Jens Rehsack
>> Sent: Friday, January 08, 2016 5:46 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [meta-java][PATCH 0/2] openjdk-8-native: fix =
do_install and PROVIDES
>>=20
>>=20
>>> Am 07.01.2016 um 04:00 schrieb Huang, Jie (Jackie) =
<Jackie.Huang@windriver.com>:
>>>=20
>>>=20
>>>=20
>>>> -----Original Message-----
>>>> From: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-
>>>> bounces@lists.openembedded.org] On Behalf Of Jens Rehsack
>>>> Sent: Wednesday, January 06, 2016 9:57 PM
>>>> To: openembedded-devel@lists.openembedded.org
>>>> Subject: Re: [oe] [meta-java][PATCH 0/2] openjdk-8-native: fix =
do_install and PROVIDES
>>>>=20
>>>>=20
>>>>> Am 06.01.2016 um 08:03 schrieb Huang, Jie (Jackie) =
<Jackie.Huang@windriver.com>:
>>>>>=20
>>>>>=20
>>>>>=20
>>>>>> -----Original Message-----
>>>>>> From: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-
>> devel-
>>>>>> bounces@lists.openembedded.org] On Behalf Of Jens Rehsack
>>>>>> Sent: Tuesday, January 05, 2016 3:21 AM
>>>>>> To: openembedded-devel@lists.openembedded.org
>>>>>> Subject: Re: [oe] [meta-java][PATCH 0/2] openjdk-8-native: fix =
do_install and PROVIDES
>>>>>>=20
>>>>>> It's insane re-introducing a virtual/javac-native without =
understanding
>>>>>> the issues coming with that.
>>>>>=20
>>>>> Please carefully review the patches before saying insane, I don't =
think it was
>>>>> correct to remove virtual/javac-native since there are several =
providers.
>>>>=20
>>>> What does virtual/javac-native mean? Correctly, there can be =
several providers.
>>>>=20
>>>> How many of them can you have in one sysroot/build? One.
>>>>=20
>>>> So - when in an openjdk-7 or openjdk-8 bootstrap 4 recipes PROVIDE =
virtual/javac-native,
>>>> what happens?
>>>=20
>>> So seem like you don't really understand how it should be used.
>>>=20
>>> Yes, only one we can have when there are multiple providers, that's =
why we should
>>> use PREFERRED_PROVIDER to determines which one it is, and use the =
virtual/foo
>>> instead of specific provider's name in DEPENDS/RDEPENDS of the =
recipe that requires it,
>>> so we can ensure only one will be built and avoid conflicts.
>>=20
>> And there starts your misunderstanding:
>=20
> Ok, if so, sorry that my English is not good enough to understand your =
words correctly.

Take a number ;)

>> You can't even install multiple providers, even when picking one.
>=20
> Picking one is to avoid installing multiple providers, why do we need =
to install
> multiple providers? Seems likely I'm starting to misunderstand again?

This isn't optional!

openjdk-7-native (provided by icedtea7) requires Java5 to build =
(provided by ecj-initial, iirc).
openjdk-7 requires openjdk-7-native - so at least here you have 2 =
providers for java-native in your sysroot/x86_64 ...

openjdk-8-native requires Java7 or Java8 to build, which is provided by =
icedtea7 or a previous build of openjdk-8-native (for reliability I let =
openjdk-8-native depend on icedtea7).
openjdk-8 requires Java7 or Java8 to build (icedtea7-native or =
openjdk-8-native), for reliability I let openjdk-8 depend on =
openjdk-8-native.

Bootstrapping Java7 means, you have 3 javac and 3 javavm's in you native =
sysroot (jikes, ecj-initial, icedtea7), bootstrapping openjdk-8 adds =
openjdk-8-native.

>> But doesn't icedtea7-native provide virtual/java-native and =
virtual/javac-native?
>> Doesn't openjdk-8-native provide virtual/java-native and =
virtual/javac-native?
>>=20
>> When virtual/java-native is only for bootstrapping, that it's misused =
and
>> must be removed. Providers are for abstraction, not for confusing.
>=20
> I think you mean that there are two java: one for bootstrapping and =
another is normal java,
> So maybe you need something like virtual/java-bootstrap-native and =
virtual/java-native to
> avoid confusing.
> For now, the followings can provide java:
> cacao-native, jamvm-native, icedtea7-native, openjdk8-native
>=20
> which ones are for bootstrapping only?

Depends what you want to bootstrap ;)
That's why the virtual/java*-native is such annoying.

>>=20
>>> FYI:
>>> =
http://www.yoctoproject.org/docs/2.0/bitbake-user-manual/bitbake-user-manu=
al.html#bb-
>> bitbake-preferences
>>> =
http://www.yoctoproject.org/docs/2.0/ref-manual/ref-manual.html#var-PREFER=
RED_PROVIDER
>>>=20
>>>>=20
>>>> It is insane to have multiple providers for the same virtual/foo =
when at least a bunch
>>>=20
>>> Virtual/foo and PREFERRED_PROVIDER is one of the mechanisms to =
handle multiple providers,
>>> (another one is update-alternatives which is not supported by =
-native recipe), and work fine
>>> in many projects, why is it insane here?
>>=20
>> Insane is, that you cannot choose - you have to install all until you =
reach the required
>> Java language level.
>=20
> Again, I may misunderstand, I don't know why I have to install all =
(providers?)?
>=20
>>=20
>>> I tested my patches to build openjdk7, openjdk8 and most recipes in =
meta-java with and without
>> sstate
>>> on qemux86-64, qemuarm, qemuppc and some of our BSPs and they all =
built fine (previous method
>>> fails to build openjdk7 sometime and always fail when build with =
sstate)
>>=20
>> That has nothing to do with the providers, it has to do with the =
wrong install of same
>> binary to a place where another one has been installed. This has to =
do with alternatives,
>=20
> I agree that the alternatives may be a better solution than providers, =
but the problem is the
> update-alternative.bbclass doesn't support -native packages, please =
send patch to fix it if you
> think it's needed.

And provides is the wrong logic. That's why 04d5d0bf4 eliminates that to =
reach a reliable
bootstrap path.

> Anyway, these patches have been merged and it works fine for now in =
our project, no insane error
> happens. Feel free to send your patch to fix the insane part you =
think,

But you patch and the way you pushed it makes it impossible for me to =
share work based on that,
since I don't go and revert your reverts to wait for the next moment you =
don't get it and override
it again. As long as you stick on your idea, feel free to cherry-pick =
recipes I build on meta-java
or cross-compiled java from my github repositories.

> but please remember to do
> enough tests to ensure it doesn't break others. Thanks!

I tested as good as I could in my environment and asked for more than 4 =
weeks people on ML to test.
When you work on master, expect some breaking. No hurry insane revert =
needed.

Best regards
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_B71FF2F2-C63D-430F-9B24-D699EFD83174
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWk32TAAoJEESZlq7c5Qqd1/8QAJSELRmvhSYY5LVnY/kKUZZv
r6q61atuufSKP+niF5zCnmWpLcZkk/34/hbaybDRNmkq8t3UkhPVylXoXIWdU8tx
abNAGUHLGrmMiHZ494alCmD9lGx4IfHjtIASSMtoCbDbS4kY+1Zpp7Qu8ms1D0GE
twnSryczyOX+GQzN9WuJdledKQJWlJvCT2RKvsWfivq2J2W7R+uJF1XV4EITQfby
gvZ8/gW9yERPfrmSr+IPXYY6k/nWQy8U6UBqlBj4inS+K3wdCk3hf0pzeAMwQh2h
aAwoQA+QIP9quC/a2aEk0ccFlbrW4GR7Y0+D7mgDkvs5HFab48KFQtXq5SdseOwz
cE0IQVnw2dSODWJCKyKH9Vu7L/dTFMccCWV5stipg5zTpaYiYr6It3DNrGTOfGLG
K1470sg1OwOl/w4L23S5EVvKuD4McXbSY5TGvhwwJWgEz/pTfypCR+0jTLqBRfVT
xhXo4krSWZHhhxubeCdTutarUYhBkrPTJPBhZrKa9dRuJoEuXdvV5k+IgT/LQYPH
XUI83lQX4CPVUQXK8PNMxIJ86orLvimpevBZ1YxkJbXux5lvd5rqC/w1Ij2fCTzB
Q6D1gRpf7i2k1OmG9yCmnPm4TJOyBFoOsWgqZFVxnL4duEplVB9oUWNJG5rQZFL1
2c1UiDihbz6SLFgHKWHg
=jWdC
-----END PGP SIGNATURE-----

--Apple-Mail=_B71FF2F2-C63D-430F-9B24-D699EFD83174--
