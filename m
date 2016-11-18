Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0441571A0B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 17:34:04 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id i88so13895959pfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 09:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=5sBYDlYlw8CnZTT20cJlO12+YG9kyH5xdx5BBtSHg/k=;
	b=JaP3J8TngtjIpet1iwi1qj7Hg8WipV/As/9aubgJpdpJ7z7Z3+p+eqzNA0HdvHai9N
	Bdfjcjci3N2U7gscZRyloJNVV/Datcme4W++a9DQRH3vUEbldXxzvP11BcREmlCZ8s+I
	WuOWBUsTR0ANligTr+C0F/t7owyu0u+beDqylnsaNx1jlYMvQoCb+dBKwrOO2N7+rNXl
	MtPb5EjiFf7AtwK+CZY5z/WnsrOzH1v9lq02go4jPOGeSeiYIcCeIQsH5SbzfAiSnBXX
	2DCbFszpOte1d0x198gfX8naZ8V+Z/kTA+VrsH14BrXdtWSmVskBarrMueUi9+OsxeDx
	iCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=5sBYDlYlw8CnZTT20cJlO12+YG9kyH5xdx5BBtSHg/k=;
	b=R0mTUlXCCoB27OilsFZheRjPgenhjyrAPywwb2AY/NoRmP1RfrXPtT7wJF7/T0sBFz
	m0TB+N7XtAN/PuBsIqlxVA50lI8WvhqvFGoiiOPm4u9X6Bj9LrWPJo2hV1MRq8jiOAi4
	1kloKzqW5OPy7Di6n5mllidnyG65BOhTBEhJx0nvvlhaesLpv1kOr8k4UkK19opIwQc4
	svlptZhw0V+TOYIGOWwt5wq65zzgk1ZjZ5sz8bTvpYWUr+LVYk6CUMI2K9LfV/xarV7n
	rCVUpr20mc0GCfYTDfm8xfOR02DC+fEG8h0R2MduzV1drKULvPva/kQOvOGQeF0Ig4gd
	B4mQ==
X-Gm-Message-State: AKaTC00Bq8OT5af/OiIZvVtfZIxCw1FZ1BSMHOpulDJEJ5Mn6Qf/TNoGgT1JPu1E6po7og==
X-Received: by 10.99.235.10 with SMTP id t10mr1649600pgh.95.1479490446122;
	Fri, 18 Nov 2016 09:34:06 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:c4:5d55:7c7:2db8])
	by smtp.gmail.com with ESMTPSA id
	z62sm19432072pfz.19.2016.11.18.09.34.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Nov 2016 09:34:05 -0800 (PST)
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>
References: <20161115154311.30118-3-git@andred.net>
	<20161116090234.30806-1-git@andred.net>
	<109be6fe-8d0c-619b-fb4a-4f836982e064@gmail.com>
	<1479383974.27546.3.camel@andred.net>
	<CAMKF1sqxxyjaYL2EJXD_KzGGMYuB5ohWvye9ba-YrJ6e0pU1Gg@mail.gmail.com>
	<1479463744.27546.7.camel@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <582db8a9-8fd8-f1b2-4a38-fcbf25cf9b49@gmail.com>
Date: Fri, 18 Nov 2016 09:33:58 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <1479463744.27546.7.camel@andred.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 2/2 v2] ncp: add v1.2.4
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
X-List-Received-Date: Fri, 18 Nov 2016 17:34:06 -0000
X-Groupsio-MsgNum: 63893
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="QOSTjTgt7N14gixwDG48M39vCvHH7qII4"

--QOSTjTgt7N14gixwDG48M39vCvHH7qII4
Content-Type: multipart/mixed; boundary="LRknoLLKVDaxHofP5ckWcHhxl6GJ83SOF";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <582db8a9-8fd8-f1b2-4a38-fcbf25cf9b49@gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 2/2 v2] ncp: add v1.2.4
References: <20161115154311.30118-3-git@andred.net>
 <20161116090234.30806-1-git@andred.net>
 <109be6fe-8d0c-619b-fb4a-4f836982e064@gmail.com>
 <1479383974.27546.3.camel@andred.net>
 <CAMKF1sqxxyjaYL2EJXD_KzGGMYuB5ohWvye9ba-YrJ6e0pU1Gg@mail.gmail.com>
 <1479463744.27546.7.camel@andred.net>
In-Reply-To: <1479463744.27546.7.camel@andred.net>

--LRknoLLKVDaxHofP5ckWcHhxl6GJ83SOF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 11/18/16 2:09 AM, Andr=C3=A9 Draszik wrote:
> On Thu, 2016-11-17 at 09:10 -0800, Khem Raj wrote:
>> On Thu, Nov 17, 2016 at 3:59 AM, Andr=C3=A9 Draszik <git@andred.net> w=
rote:
>>> On Wed, 2016-11-16 at 09:28 -0800, Khem Raj wrote:
>>>>
>>>> On 11/16/16 1:02 AM, Andr=C3=A9 Draszik wrote:
>>>>> Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
>>>>> ---
>>>>>  meta-networking/recipes-support/ncp/ncp_1.2.4.bb | 32
>>>>> ++++++++++++++++++++++++
>>>>>  1 file changed, 32 insertions(+)
>>>>>  create mode 100644 meta-networking/recipes-support/ncp/ncp_1.2.4.b=
b
>>>>>
>>>>> diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
>>>>> b/meta-
>>>>> networking/recipes-support/ncp/ncp_1.2.4.bb
>>>>> new file mode 100644
>>>>> index 0000000..7bbaaad
>>>>> --- /dev/null
>>>>> +++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
>>>>> @@ -0,0 +1,32 @@
>>>>> +SUMMARY =3D "a fast file copy tool for LANs"
>>>>> +DESCRIPTION =3D "ncp is a utility for copying files in a LAN. It h=
as
>>>>> absolutely no \
>>>>> +security or integrity checking, no throttling, no features, except=

>>>>> \
>>>>> +one: you don't have to type the coordinates of your peer."
>>>>> +HOMEPAGE =3D "http://www.fefe.de/ncp"
>>>>> +LICENSE =3D "GPLv2"
>>>>> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-
>>>>> licenses/GPL-
>>>>> 2.0;md5=3D801f80980d171dd6425610833a22dbe6"
>>>>> +DEPENDS =3D "libowfat"
>>>>> +
>>>>> +SRC_URI =3D "https://dl.fefe.de/${BP}.tar.bz2"
>>>>> +SRC_URI[md5sum] =3D "421c4855bd3148b7d0a4342942b4bf13"
>>>>> +SRC_URI[sha256sum] =3D
>>>>> "6cfa72edd5f7717bf7a4a93ccc74c4abd89892360e2e0bb095a73c24b9359b88"
>>>>> +
>>>>> +EXTRA_OEMAKE =3D "\
>>>>> +    DIET=3D \
>>>>> +    DEBUG=3Dnostrip \
>>>>> +    CC=3D'${CC}' CFLAGS=3D'${CFLAGS} -I${STAGING_INCDIR}/libowfat'=

>>>>> LDFLAGS=3D'${LDFLAGS}' \
>>>>> +"
>>>>
>>>> Is setting CC etc. on make cmdline really needed ?
>>>
>>> Yes, the Makefile sets CC CFLAGS LDFLAGS excplicitly, so make doesn't=

>>> inherit them from the environment variables, because OE doesn't pass =
the
>>> -e
>>> make flag anymore. https://www.gnu.org/software/make/manual/html_node=
/En
>>> viro
>>> nment.html#Environment
>>>
>>>> may be just adding the -I flags to CPPFLAGS is enough ?
>>>
>>> It doesn't respect CPPFLAGS, but an alternative would be:
>>>
>>> EXTRA_OEMAKE =3D "\
>>>     DIET=3D \
>>>     DEBUG=3Dnostrip \
>>>     -e \
>>> "
>>> CFLAGS_append =3D " -I${STAGING_INCDIR}/libowfat"
>>
>> Thats seems better.
>=20
> I am not sure I agree. This means one could accidentally override make
> variables. Being explicit as in the original version is more determinis=
tic.
> Otherwise somebody would have to audit each recipe's makefile once a
> variable is added or removed from the bitbake environment. That doesn't=

> scale. It would appear that the -e flag was removed from EXTRA_OEMAKE i=
n rev
> aeb653861a0ec39ea7a014c0622980edcbf653fa for a similar reason... Even t=
he
> make manual recommends against using -e.

-e is bad for some reason It missed my eye last time so I agree on -e par=
t
my suggestion was mainly on CC and CFLAGS being passed in makefile option=
s
it seems the package Make infra needs a patch for this to work cleanly.

>=20
>=20
> Andre'
>=20


--LRknoLLKVDaxHofP5ckWcHhxl6GJ83SOF--

--QOSTjTgt7N14gixwDG48M39vCvHH7qII4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgvO4wACgkQuwUzVZGdMxSo6ACbB6SYETVNFVhI/wt6Ac8qoK4K
K/sAnR0u4i9QNxweGpb5F2shj1xoh54Q
=H9XN
-----END PGP SIGNATURE-----

--QOSTjTgt7N14gixwDG48M39vCvHH7qII4--
