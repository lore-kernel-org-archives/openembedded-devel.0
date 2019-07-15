Return-Path: <maciej.pijanowski@3mdeb.com>
X-Greylist: delayed 1814 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 15 Jul 2019 07:41:24 UTC
Received: from 10.mo3.mail-out.ovh.net (10.mo3.mail-out.ovh.net
	[87.98.165.232])
	by mail.openembedded.org (Postfix) with ESMTP id EAA2C7DC1C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 07:41:24 +0000 (UTC)
Received: from player773.ha.ovh.net (unknown [10.108.35.215])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id C29A821BC8A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 09:01:55 +0200 (CEST)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player773.ha.ovh.net (Postfix) with ESMTPSA id EA7987EBD19C;
	Mon, 15 Jul 2019 07:01:52 +0000 (UTC)
To: Khem Raj <raj.khem@gmail.com>
References: <1559305488-7112-1-git-send-email-maciej.pijanowski@3mdeb.com>
	<CAMKF1srcujMyTL1OaRa+AZyjKnNqOJEvSVZ34uh+CYpv+FqJkg@mail.gmail.com>
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Openpgp: preference=signencrypt
Autocrypt: addr=maciej.pijanowski@3mdeb.com; keydata=
	mQINBFy+vRwBEACs+tNUJ4aKRaJm4BDZxCRBTMRS/ng8XT9yEkH6xnaOroLtYM7Uwb2QqvtN
	uBR6Q6adYF/IcnzOuJeIlVEHloU+GyihHq1U4kJH6qI4FnnjjDhC3g7Tpms+R+yLGI1/lQ4x
	4wA7m1Mm1oNBF7ry+p640/1rj3xxa6UEv387/coVWNP6scxhcff+rYPCkquViKob96VF/XeY
	vav+DrBK96v9VyR3EK2DQjmw2FY/0Q95bOZ/CcfbmhIe4rCcRuZECR5zyvPVdTLtgfVJIteG
	bhHXDLXaKVXtshdUrAPiqY6Cd0alRjEnXi9QNoyx/Vcl8ChpYTLHYqZSfsjpJhnpXSfgS6YH
	iOhViUP5IB0kDvnDl/8fbUiBeUgXZqY4+j3NsL6FkbNch+7zMShj1cZwr0u5dO2MzcmLuYJm
	JwMM1dE9hwRTfPPQfagGfiAcLt6IuK0cVygU7WOtAVbBXgoqTE76qbAc3qmdSiSmVL53AK76
	meVEtt15lIZClulAMMqb23x0D+/bFCgmyywGjpWEyZA4q7ZRZomWxFr9BxKVQAyKGM5d6gQP
	lsFFFCbuDr/gOsrXg6DTUm3amEMwGobbtU/ZWzn8OW8wjNeQnB5efJBhzt/ORihaE+5KXfq5
	CwX9rurlIlUDT/t96VoBkYDeg36M0f7sP+7SVyPi1Qpum66h4wARAQABtC9NYWNpZWogUGlq
	YW5vd3NraSA8bWFjaWVqLnBpamFub3dza2lAM21kZWIuY29tPokCNwQTAQgAIQUCXL69HAIb
	AwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRDxQB0uHMsZ70SVEACI+qknq7ZImBXu7ha3
	mQ6IJwxa9UgDwExbDGdUv6OeHAV6fGoyRsKE7mV1Q1y/coJd4vQlQBTKT7sJFlIGcSmtcjPS
	2OShHy8IiNf1Hy/7juV2Oxs3fv1f9cdLIzLe/oF2uRdKRRM2pgYiz8SeS6Q+MPUmXN1qOpmD
	glvf6ODhAiTj84RaeR5ikmW+9/Ldpt2PAUKT2PkHTQOKTkAkE9w+VTxdo+bmj//QIJtFT41f
	2A7nDESzSo38Jw91jXdNb8f7lOd+RCl1hlf09agbQnKFB1LFdbGsLvYLUjIgvMF+rOOGjeXR
	WOqo8WoowA/FfJYC9Rw+9qqAJ6TvjkxeZrhXxCxgHuA60mWxn/NofbxtZSYuHw6Abwg71Nta
	SJ07qCCaSHlwouYcGgSatg1mmqqOkOPbp0sls54Go1FR3R9yJJR5fBJEl1amiu/ytLCbdEVT
	Y8bE6bcgwBk7mWzNmdmf/EykaNIPbwnPDtLIQ+9rDX34ACIJNbxdMCjmrocKVBTJ9cSOlOuQ
	xlQrrmdFKAnz0exvvE9YACgmlZ0LjzGFwm4U9G5BdJDkAeNQfbRs4CkCPgBpInmMjoelpFTW
	dCDoGilLikNjGfgfCc8ENccw9rZndmbuWKixVMRXU3R/Fxjc0xtJvL5Iz7HLxzvtmN/OBShG
	+iFROS+HC6tAkVYC1rkCDQRcvr0cARAAuQDEynwHXPMV54ZoBfLxURH63RzhIjYlX88HnqEn
	/mNY2FIwUtKS73LLl7ljH4XLFDGZCEFgYttddc9wwJXw9pDvVxLICV3nTKNyBipShj/LOGbf
	B4Pk0qlkKx5KpqSmVFZRM7mwK88tGhAILfu9IBSk/QOS1QRFztB0L2kkU/UslyJqoMD4qJqI
	QGwPf5drfK6c685yFhdDcHcXeNgnTap68wviPLBAhRPMd8qDxMIZMARi+wxb5w6OwDxetSJn
	kNkxCtMpiXbna/hTMIvRqC9VgwBrAINzsJMk4qVqy5CYXNJ/tkHAtTIHISliRkaZYBDdXCo9
	SltNctQGIK1IaqTf8iLq4pehm252NTVw8QYw2usErsHp3fZLNTcJhpr4prq4aIP8ERzbaBb/
	02i6VXAjVS5LNrIqXvkJkOeLfLRC2Fwbj6sdK5maRBGmtkGvhXJYIUlbQchY83dbQziQoMxM
	97ZQO0l5QZRJAIjIyYXx4AaZBxoHXr9jdle54Rj/+Lru54/yDT8zWxzO+PaotQxykgEsDTXv
	T8+kfpGOfd3ojfrKhX+bTym0TT/MVMI5CYqllQ3wF9QZFchj0I//8148Fanezj8sHbGNdNi6
	4mpKGpEBpaLBwySx+o7SaxLvlD4GbqETIwoOxMcpvo7nQKpgHeOEu81+SDc+9KKSFjEAEQEA
	AYkCHwQYAQgACQUCXL69HAIbDAAKCRDxQB0uHMsZ70tNEACA0ZKeJYPUHy+95d20N/i31Oze
	BzbMksMrd/j+qPOgeTjEytxrfeOVQY/gok0sOvhDYoFvLiip0lxrIS/tHZcaH/CQn0jZkaHA
	tGWy4hrb7wKnUEpAAwepYQyxxPy/upliLwmLX7oxdvJIY0A3T/m+8gLzR+OEJB4MfGUypSzT
	N2RY2xTyvXUQYgw/iRHucduCYv0ZNHCzs2CtKeZpcuuozClAjPywwItn0o3YJDdZWShd6WmO
	cOnklq9XjwxTOYWxn2i/NGv/BY7DOALzrFbp66hjMa0Vz7lCGKvSDVDcJLBnNd4Jf69DB1Ie
	pHx5jdJHqk61DZq4yYQBh/MM4oAP7MsUE02rnp+pXqAjJUhFp6+wLP1irRL+SzdYGdda1uio
	lhfvd/icZAEuMUnnaSkA28NjoIVwI5YmdDKuqmFWCA8PSHY8k+LLxuk/AZdV862OYCb1+r7l
	sc1l7tHAPHGGjG3i7Hh89FdAMQ0vSGTkGuOZIAKF7atKf7TVc7M3PPT3RACCXx0ABRA3/FqR
	lX18nOduQOSYS5LGRg4dHv5m9kgu6asXmwDP82sg8ca1RsxXuTLCrIYpGlGkThnzgqWxlC7M
	Ridv3wyyJp8CIgdeYl4oZaSFhz12B+VaM1n8y8Nsg1e9oHHNdEWT1/S5QJRb4Ig3LQOmUhZw
	0f2bcrTp9w==
Message-ID: <c144cb61-0180-ddc0-9ea8-82560060e99e@3mdeb.com>
Date: Mon, 15 Jul 2019 09:01:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1srcujMyTL1OaRa+AZyjKnNqOJEvSVZ34uh+CYpv+FqJkg@mail.gmail.com>
X-Ovh-Tracer-Id: 2657968206189768396
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrheejgdeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	piotr.krol@3mdeb.com
Subject: Re: [meta-oe][PATCH] recipes-benchmark/stressapptest_1.0.9.bb: add recipe
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
X-List-Received-Date: Mon, 15 Jul 2019 07:41:25 -0000
X-Groupsio-MsgNum: 78570
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="67HQH8xYVSz2hPJwkwHGtHgQMgvXFqJti"

--67HQH8xYVSz2hPJwkwHGtHgQMgvXFqJti
Content-Type: multipart/mixed; boundary="jZJF8df0j5eunviNfXXXGDDLwgj1gwQhH";
 protected-headers="v1"
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 piotr.krol@3mdeb.com
Message-ID: <c144cb61-0180-ddc0-9ea8-82560060e99e@3mdeb.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-benchmark/stressapptest_1.0.9.bb:
 add recipe
References: <1559305488-7112-1-git-send-email-maciej.pijanowski@3mdeb.com>
 <CAMKF1srcujMyTL1OaRa+AZyjKnNqOJEvSVZ34uh+CYpv+FqJkg@mail.gmail.com>
In-Reply-To: <CAMKF1srcujMyTL1OaRa+AZyjKnNqOJEvSVZ34uh+CYpv+FqJkg@mail.gmail.com>

--jZJF8df0j5eunviNfXXXGDDLwgj1gwQhH
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 14.06.2019 21:04, Khem Raj wrote:
> I see it fail on qemuarm/musl
>
> https://errors.yoctoproject.org/Errors/Details/248676/
Hello,

Sorry for late reply.

=46rom the sattypes.h file:
https://github.com/stressapptest/stressapptest/blob/master/src/sattypes.h=
#L203
it seems like only the x86, PPC, ARM-v7A, ARM64 are supported by this
package.

Would you consider removing other architectures from compatible withing
the recipe
as a fine approach?

Like in case of the NodeJS, for example:
https://github.com/openembedded/meta-openembedded/blob/master/meta-oe/rec=
ipes-devtools/nodejs/nodejs_10.16.0.bb#L11
>
> On Fri, May 31, 2019 at 6:42 AM Maciej Pijanowski
> <maciej.pijanowski@3mdeb.com> wrote:
>> This patch introduces recipe for the stressapptest utility.
>> The recipe builds without errors and warnings (tested on thud).
>> It basically uses autootools to buildm so should build just fine
>> on the other releases as well.
>> Basic commands from the project's README were tested on a few
>> armv7 / armv8 platforms.
>>
>> Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
>> ---
>>  .../stressapptest/stressapptest_1.0.9.bb              | 19 ++++++++++=
+++++++++
>>  1 file changed, 19 insertions(+)
>>  create mode 100644 meta-oe/recipes-benchmark/stressapptest/stressappt=
est_1.0.9.bb
>>
>> diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0=
=2E9.bb b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
>> new file mode 100644
>> index 000000000000..3e5748a3a12c
>> --- /dev/null
>> +++ b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
>> @@ -0,0 +1,19 @@
>> +SUMMARY =3D "Stressful Application Test"
>> +DESCRIPTION =3D "Stressful Application Test (or stressapptest, its un=
ix name) \
>> + is a memory interface test. It tries to maximize randomized traffic =
to memory \
>> + from processor and I/O, with the intent of creating a realistic high=
 load \
>> + situation in order to test the existing hardware devices in a comput=
er. \
>> +"
>> +HOMEPAGE =3D "https://github.com/stressapptest/stressapptest"
>> +SECTION =3D "benchmark"
>> +LICENSE =3D "Apache-2.0"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ea9d559f985fb4834317d8ed=
6b9e58"
>> +
>> +SRC_URI =3D "https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz"
>> +
>> +SRC_URI[md5sum] =3D "d3a526c174c049dd7a1068dc74a62be2"
>> +SRC_URI[sha256sum] =3D "2ba470587ad4f6ae92057d427c3a2a2756e5f10bd25cd=
91e62eaef55a40b30a1"
>> +
>> +S =3D "${WORKDIR}/${PN}-${PV}"
>> +
>> +inherit autotools
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Maciej Pijanowski
Embedded Systems Engineer
https://3mdeb.com | @3mdeb_com



--jZJF8df0j5eunviNfXXXGDDLwgj1gwQhH--

--67HQH8xYVSz2hPJwkwHGtHgQMgvXFqJti
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJdLCTfAAoJEPFAHS4cyxnvo4QP/AxONwui8Pld2h2mieZ6IrHp
bdx8hKmIx5HhxoqWUpVCC6pmgq7gunCdGKvGYgYRXpS/79mRykwmLIR31Vf13aGm
6Cx4RMc2jZmin+hJBfT9401sHpP7/0y21BnA+6L4BNysPRLJEa7VT7pftHbnkOor
frusg5ivE2qBBWGnn3BLZsiLOtsAjuXa9LWmFhVeRqwP2gZDKCafXbq02Fic6YMx
oJwDb9ZmfsfBf0lkbUGn61vzcmadE3wyDxKbmc522Vz4yn/xrQJwrnGYS8kl5kLz
HH5vvQUspaH+ZsJJNld4loK8OXkd7ia8rBVQJ5BloBpnl2b5cBQ8h2X1bG727i9/
u55i121IlMIcSE6402tX1cR3ab60ZGn30bHOKA7p+Z3e+VWuzs0WacmZwSoqQyAc
8zZ8yYi6gdvUK8XUkZylYDYA6+q0dqfwYgzFZJLTGodDB4ygF4FSJNJ6MFMNfGl6
zW7Jh468d/z416piu1o/QcfekWAtl/lVO+izvpzbTwOwn93GyY/47oSNJzIBspPn
sVwYDbHOCz3GUj+/hrYNUKvl+/7XnjhkN3pQdHw66/+Tc7VxcCYXlooU2mhGTXU3
j8tDyZQWNxP+DZgchaHsK5EUHAhSpYwfmraISWHLAxKf4/NtXNCdc31sp8c4CV9h
aVpROfnjIg9MEjqQeQSa
=OGGp
-----END PGP SIGNATURE-----

--67HQH8xYVSz2hPJwkwHGtHgQMgvXFqJti--
