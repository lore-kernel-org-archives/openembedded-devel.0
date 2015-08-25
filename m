Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 766C9734B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 01:00:21 +0000 (UTC)
Received: by pdob1 with SMTP id b1so59535430pdo.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 18:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=j7PqvDxHv0w++9XwTV0Gsex/RDKyhpbrZzV01Ek1tIw=;
	b=bK2tkxGZnDAMUYMifg6p2ACQ8Mvl7xRq2UWwcNZVf8+X+7CqUj6XbU2MdSlo2BVAvQ
	S+GMMYHE1t6n1ZJDNtJgXfY1/M9MLr9C9JHjxc49QadVJt2R/0hmm8Ch8JIp9KUE7yiA
	yuPwLziJ/A7kS5+ma3p/KX7Aad7Kg9fHUdWWVXxZ6zo6lgfgkMLuIegurw0D7B6ZShEh
	hSbyC9KKqyk0gh2ugYCoX02zAzFcJ0nK5TJ38CTvdaV4BSjrt0Px89d35DV/0ZezHlmx
	b5v0x/2iXmaRgajF8ym3NkuX/RgEo23rZgWMcpGtsnpHuBN0kKODiGz1TKdkMUVHhT6+
	y3ow==
X-Received: by 10.70.100.199 with SMTP id fa7mr51476602pdb.94.1440464422120;
	Mon, 24 Aug 2015 18:00:22 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:4ded:b62b:f72d:209d?
	([2601:646:8601:4580:4ded:b62b:f72d:209d])
	by smtp.gmail.com with ESMTPSA id
	z16sm18763543pbt.3.2015.08.24.18.00.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Aug 2015 18:00:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <30DC4EDFD798C94083F3E083754532CC011C1FA335@G08CNEXMBPEKD03.g08.fujitsu.local>
Date: Mon, 24 Aug 2015 18:00:19 -0700
Message-Id: <F8BECE17-36E1-41F1-8B14-2E0EB99D7BDB@gmail.com>
References: <1440175216-21907-1-git-send-email-biannm@cn.fujitsu.com>
	<CAMKF1spvKJaV0_+JngPLnZWesZ2ELipZ3c=UdOY1v-Nu2yLkBg@mail.gmail.com>
	<30DC4EDFD798C94083F3E083754532CC011C1FA335@G08CNEXMBPEKD03.g08.fujitsu.local>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-oe][PATCH] sysdig: 0.1.101 -> 0.1.102
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Aug 2015 01:00:22 -0000
X-Groupsio-MsgNum: 56975
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8F70641D-314D-4D27-8231-2896CB0ACC26";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8F70641D-314D-4D27-8231-2896CB0ACC26
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 24, 2015, at 5:44 PM, Bian, Naimeng <biannm@cn.fujitsu.com> =
wrote:
>=20
>=20
>=20
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf =
Of Khem
>> Raj
>> Sent: Friday, August 21, 2015 11:42 PM
>> To: openembeded-devel
>> Subject: Re: [oe] [meta-oe][PATCH] sysdig: 0.1.101 -> 0.1.102
>>=20
>> On Fri, Aug 21, 2015 at 9:40 AM, Bian Naimeng <biannm@cn.fujitsu.com> =
wrote:
>>> upgrade sysdig to 0.1.102, and using GIT source instead of archive.
>>>=20
>>> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
>>> ---
>>> .../01-donot-set-default-value-to-va_list.patch    | 22 =
--------------
>>> meta-oe/recipes-extended/sysdig/sysdig_0.1.101.bb  | 34
>> ----------------------
>>> meta-oe/recipes-extended/sysdig/sysdig_git.bb      | 32
>> ++++++++++++++++++++
>>> 3 files changed, 32 insertions(+), 56 deletions(-)  delete mode
>>> 100644
>>> =
meta-oe/recipes-extended/sysdig/sysdig/01-donot-set-default-value-to-v
>>> a_list.patch  delete mode 100644
>>> meta-oe/recipes-extended/sysdig/sysdig_0.1.101.bb
>>> create mode 100644 meta-oe/recipes-extended/sysdig/sysdig_git.bb
>>>=20
>>> diff --git
>>> =
a/meta-oe/recipes-extended/sysdig/sysdig/01-donot-set-default-value-to
>>> -va_list.patch
>>> =
b/meta-oe/recipes-extended/sysdig/sysdig/01-donot-set-default-value-to
>>> -va_list.patch
>>> deleted file mode 100644
>>> index 9cb6378..0000000
>>> ---
>>> =
a/meta-oe/recipes-extended/sysdig/sysdig/01-donot-set-default-value-to
>>> -va_list.patch
>>> +++ /dev/null
>>=20
>> why is this patch dropped ?
>>=20
>=20
> Thanks for your review.
>=20
> Because this bug had been fixed at upstream before 0.1.102 released.
> Obtain detail from here
> =
https://github.com/draios/sysdig/commit/3cf4db08314b8559405198fb998eab421f=
ec4b7d
>=20

OK it would be nice to have this kind of information in commit message



--Apple-Mail=_8F70641D-314D-4D27-8231-2896CB0ACC26
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXbvicACgkQuwUzVZGdMxQgUgCgh1Dp1k8YbMj2zfvmTdakFxbU
8NEAoI94ynRo/muq2kEou9dy0YnLebFt
=sT83
-----END PGP SIGNATURE-----

--Apple-Mail=_8F70641D-314D-4D27-8231-2896CB0ACC26--
