Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id 88CA774501
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 01:05:57 +0000 (UTC)
Received: (qmail 17949 invoked by uid 1003); 25 Jul 2018 01:05:57 -0000
Received: from unknown (HELO ?192.168.11.100?)
	(philip@opensdr.com@73.152.143.112)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	25 Jul 2018 01:05:57 -0000
To: Khem Raj <raj.khem@gmail.com>
References: <20180724134300.31744-1-philip@balister.org>
	<CAMKF1so9ECEqyD49imbeZMPfPwmHs5UBA8oU8bOh89+kvUx9eA@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Openpgp: preference=signencrypt
Autocrypt: addr=philip@balister.org; prefer-encrypt=mutual; keydata=
	xsBNBE6PN4EBCADXwOSVOvTrJ370tH2RmiR22OuCBcKfnKTLztyV5zA0veDB1kmrIajh+sJe
	HWNqsib0v19S3wdrvqzKrztSfNAgUctvkAuTOloU81dmbAjDSge6nFxjzIIz6XjNvmP5xl9J
	rstPm4i4dhAs5436xf4Bh0vn3C/Bp4fKwXBSW/Xto7vuiuSK03ojon3F8O2WNEmKxHyubFP1
	2tNvXOp/PeAR4LTnYq6fdAAofvbpbPDBg8qICe6j1UXaIyU93IbW+bJp1RFbeakWxiTw+eQ2
	fVjG5XnubNX0YBlmjHDJhjeqV1uwkImNHlZknecLjT7g37vIMwz+PTfPIhmIGffzqtHlABEB
	AAHNJVBoaWxpcCBCYWxpc3RlciA8cGhpbGlwQGJhbGlzdGVyLm9yZz7CwH4EEwECACgCGyMG
	CwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJYM1D9BQkRKOdqAAoJEMDJd4rr0merDX4H/3Pr
	nYKDnml7LRiikoOTFJb4r7ub04skrkGI2DAYvRUPH110KXaan84Qo2Yl4r/ma15Lpqx+cdPR
	3KbFlSWyjgY6CMN/BclutsK4mFkoxnmhdYJvc5M2TDfZLxBPMTeQiHo0MwxUB5v81mv812bx
	YKfEOg3ndk7C/TE0Q8ZER7p6fU3ol/e0ilLyaCpd85nkEcOEI7BdBBGhKWii+Cwvv8g2ofQZ
	3wAsqQFp7PFxlEjo5Xc1QGqo7L+UlDG23QjUn33n+wZMZm9EUZFu1c1MAGZsvXiqKw8P07Mj
	yyf6h6EMVP8wME7gnkxsZkpKv04mSvKpDLIInmRW9ZlHXaJ4YxjOwE0ETo83gQEIAPs+ZC0R
	gF4blrRIiVHdkARncAxUwSUbti5Ku23dQ0iBizozh4YGucgW48gxsvJCkCc9s/4C9e3vYiCZ
	GVGC8x6Ll3vE7xwRQ/euVqJ0mXG7tNK1zAPpSgI6aooPSZCW7PBvwY8uMvzzCzP+EBd0+oA5
	uXQSEcyOJUYy4beferoHUiBjBkyNd+v2iaJf7KjAYYxJOcPvtnq/VL09hlmtCD5zghOn80rt
	LqF66BJkHmATopSWyor1qz7gmowdCkFkUJDNW7yJT1wVANqDd9P5A8vYhngwJTHsvXVftmvB
	gLiJjYuKst36G2AOHgm4ls5jRMa/k7jWue1RKM5LxzgBtLUAEQEAAcLAZQQYAQIADwIbDAUC
	WDNRbAUJESjn5AAKCRDAyXeK69Jnq1qYB/93aiBdenAuu0H/zGWEFFB14cdhDR4S4q0EbfXl
	1z9o3Irazw6WMtLe12zJ4/Xl41Mh/IH8/+AgDnigisrkKRN1TkiOGDUVnS0akkhML3ONbeFd
	ocYEwBAPDTxAaWNoyjDe/bORokSJn31cFoG6QYyzUct79npHorbaXW0zW+KC77Do53yUKQ8+
	icWpfiCMk1YzSHCr0y5NZNVxac9a0+IDzH/YBbNdJLNaMvXcuege1Qqz85pdR0P4XuCVRD2j
	ZAbcGJzZXlu9ZzpIHjtZoyF8paJRMQwzWEO3/Txksmm7K8eu8Tz2JVpjiOIj44MOTKoRGKjO
	6eUfr0u7CwnEyqiQ
Message-ID: <96073ef8-520f-42f1-0d65-df0f2f3d8144@balister.org>
Date: Tue, 24 Jul 2018 21:05:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1so9ECEqyD49imbeZMPfPwmHs5UBA8oU8bOh89+kvUx9eA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] lapack: Add recipe.
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
X-List-Received-Date: Wed, 25 Jul 2018 01:05:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit

On 07/24/2018 11:39 AM, Khem Raj wrote:
> On Tue, Jul 24, 2018 at 6:43 AM Philip Balister <philip@balister.org> wrote:
>>
>>  * Build tested.
>>  * Note: needs FORTRAN enabled in local.conf or similar.
>>  * Used to build scipy on pi-3. scipy passed many tests.
>>  * Based on work from meta-gnss https://github.com/carlesfernandez/meta-gnss-sdr
>>  * Hopefully this helps others playing with scipy and things.
>>
> 
> thanks for this,  fortran is not a daily driver for many here, and is
> not enabled
> in toolchain by default as well. So in this scenario is there any easy way to
> exclude this recipe from parsing ? I am interested in getting our recipe fail
> count down and this recipe wont help.

Yeah, after I sent this I thought about that. I'd like it in meta-oe for
visibility, since it seems like scipy comes up every so often. The
recipe isn't complete crap, so I think it makes sense to have it here,
we just need a way to exclude it from parsing to help khem.

Any suggestions?

Philip


> 
>> Signed-off-by: Philip Balister <philip@balister.org>
>> ---
>>  meta-oe/recipes-devtools/lapack/lapack_3.8.0.bb | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>  create mode 100644 meta-oe/recipes-devtools/lapack/lapack_3.8.0.bb
>>
>> diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.8.0.bb b/meta-oe/recipes-devtools/lapack/lapack_3.8.0.bb
>> new file mode 100644
>> index 000000000..ef1abd567
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/lapack/lapack_3.8.0.bb
>> @@ -0,0 +1,24 @@
>> +SUMMARY = "Linear Algebra PACKage"
>> +URL = "http://www.netlib.org/lapack"
>> +LICENSE = "BSD-3-Clause"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=930f8aa500a47c7dab0f8efb5a1c9a40"
>> +
>> +# Recipe needs FORTRAN support (copied from conf/local.conf.sample.extended)
>> +# Enabling FORTRAN
>> +# Note this is not officially supported and is just illustrated here to
>> +# show an example of how it can be done
>> +# You'll also need your fortran recipe to depend on libgfortran
>> +#FORTRAN_forcevariable = ",fortran"
>> +#RUNTIMETARGET_append_pn-gcc-runtime = " libquadmath"
>> +
>> +DEPENDS = "libgfortran"
>> +
>> +SRC_URI = "http://www.netlib.org/lapack/lapack-${PV}.tar.gz"
>> +SRC_URI[md5sum] = "96591affdbf58c450d45c1daa540dbd2"
>> +SRC_URI[sha256sum] = "deb22cc4a6120bff72621155a9917f485f96ef8319ac074a7afbc68aab88bcf6"
>> +
>> +EXTRA_OECMAKE = " -DBUILD_SHARED_LIBS=ON "
>> +OECMAKE_GENERATOR = "Unix Makefiles"
>> +
>> +inherit cmake pkgconfig
>> +
>> --
>> 2.13.6
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 

