Return-Path: <philip@balister.org>
X-Greylist: delayed 401 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Mar 2020 16:43:25 UTC
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id DB39E60F93
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 16:43:25 +0000 (UTC)
Received: (qmail 15779 invoked by uid 1003); 4 Mar 2020 16:34:50 -0000
Received: from unknown (HELO ?172.20.40.130?)
	(philip@opensdr.com@12.248.214.166)
	by mail.geekisp.com with (ECDHE-RSA-AES128-GCM-SHA256 encrypted) SMTP;
	4 Mar 2020 16:34:50 -0000
To: Scott Murray <scott.murray@konsulko.com>, Leo Yan <leo.yan@linaro.org>
References: <20200304122811.16655-1-leo.yan@linaro.org>
	<alpine.LFD.2.21.2003041103340.29352@godzilla.spiteful.org>
From: Philip Balister <philip@balister.org>
Autocrypt: addr=philip@balister.org; prefer-encrypt=mutual; keydata=
	mQENBE6PN4EBCADXwOSVOvTrJ370tH2RmiR22OuCBcKfnKTLztyV5zA0veDB1kmrIajh+sJe
	HWNqsib0v19S3wdrvqzKrztSfNAgUctvkAuTOloU81dmbAjDSge6nFxjzIIz6XjNvmP5xl9J
	rstPm4i4dhAs5436xf4Bh0vn3C/Bp4fKwXBSW/Xto7vuiuSK03ojon3F8O2WNEmKxHyubFP1
	2tNvXOp/PeAR4LTnYq6fdAAofvbpbPDBg8qICe6j1UXaIyU93IbW+bJp1RFbeakWxiTw+eQ2
	fVjG5XnubNX0YBlmjHDJhjeqV1uwkImNHlZknecLjT7g37vIMwz+PTfPIhmIGffzqtHlABEB
	AAG0JVBoaWxpcCBCYWxpc3RlciA8cGhpbGlwQGJhbGlzdGVyLm9yZz6JAT4EEwECACgCGyMG
	CwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJYM1D9BQkRKOdqAAoJEMDJd4rr0merDX4H/3Pr
	nYKDnml7LRiikoOTFJb4r7ub04skrkGI2DAYvRUPH110KXaan84Qo2Yl4r/ma15Lpqx+cdPR
	3KbFlSWyjgY6CMN/BclutsK4mFkoxnmhdYJvc5M2TDfZLxBPMTeQiHo0MwxUB5v81mv812bx
	YKfEOg3ndk7C/TE0Q8ZER7p6fU3ol/e0ilLyaCpd85nkEcOEI7BdBBGhKWii+Cwvv8g2ofQZ
	3wAsqQFp7PFxlEjo5Xc1QGqo7L+UlDG23QjUn33n+wZMZm9EUZFu1c1MAGZsvXiqKw8P07Mj
	yyf6h6EMVP8wME7gnkxsZkpKv04mSvKpDLIInmRW9ZlHXaJ4Yxi5AQ0ETo83gQEIAPs+ZC0R
	gF4blrRIiVHdkARncAxUwSUbti5Ku23dQ0iBizozh4YGucgW48gxsvJCkCc9s/4C9e3vYiCZ
	GVGC8x6Ll3vE7xwRQ/euVqJ0mXG7tNK1zAPpSgI6aooPSZCW7PBvwY8uMvzzCzP+EBd0+oA5
	uXQSEcyOJUYy4beferoHUiBjBkyNd+v2iaJf7KjAYYxJOcPvtnq/VL09hlmtCD5zghOn80rt
	LqF66BJkHmATopSWyor1qz7gmowdCkFkUJDNW7yJT1wVANqDd9P5A8vYhngwJTHsvXVftmvB
	gLiJjYuKst36G2AOHgm4ls5jRMa/k7jWue1RKM5LxzgBtLUAEQEAAYkBJQQYAQIADwIbDAUC
	WDNRbAUJESjn5AAKCRDAyXeK69Jnq1qYB/93aiBdenAuu0H/zGWEFFB14cdhDR4S4q0EbfXl
	1z9o3Irazw6WMtLe12zJ4/Xl41Mh/IH8/+AgDnigisrkKRN1TkiOGDUVnS0akkhML3ONbeFd
	ocYEwBAPDTxAaWNoyjDe/bORokSJn31cFoG6QYyzUct79npHorbaXW0zW+KC77Do53yUKQ8+
	icWpfiCMk1YzSHCr0y5NZNVxac9a0+IDzH/YBbNdJLNaMvXcuege1Qqz85pdR0P4XuCVRD2j
	ZAbcGJzZXlu9ZzpIHjtZoyF8paJRMQwzWEO3/Txksmm7K8eu8Tz2JVpjiOIj44MOTKoRGKjO
	6eUfr0u7CwnEyqiQ
Message-ID: <0d9bdfd0-9321-940b-4542-e4ba6505aed1@balister.org>
Date: Wed, 4 Mar 2020 11:36:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2003041103340.29352@godzilla.spiteful.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v1] OpenCSD: Support for Arm CoreSight decode lib
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
X-List-Received-Date: Wed, 04 Mar 2020 16:43:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/4/20 11:05 AM, Scott Murray wrote:
> On Wed, 4 Mar 2020, Leo Yan wrote:
> 
>> This recipe is to support OpenCSD, which is an open source
>> CoreSight trace decode library and utility.
> 
> Just a thought, this seems like the kind of thing that might make sense
> for the new meta-arm layer that Jon has been working up?

I had the exact thought and am really glad I read this before saying the
same thing!

Philip

> 
>> Signed-off-by: Leo Yan <leo.yan@linaro.org>
>> ---
>>  .../recipes-devtools/opencsd/opencsd_git.bb   | 28 +++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>  create mode 100644 meta-oe/recipes-devtools/opencsd/opencsd_git.bb
>>
>> diff --git a/meta-oe/recipes-devtools/opencsd/opencsd_git.bb b/meta-oe/recipes-devtools/opencsd/opencsd_git.bb
>> new file mode 100644
>> index 000000000..0c3b4837d
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/opencsd/opencsd_git.bb
>> @@ -0,0 +1,28 @@
>> +SUMMARY = "OpenCSD - An open source CoreSight(tm) Trace Decode library"
>> +HOMEPAGE = "https://github.com/Linaro/OpenCSD"
>> +LICENSE = "BSD-3-Clause"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ad8cb685eb324d2fa2530b985a43f3e5"
>> +
>> +SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=http;branch=master"
>> +SRCREV = "03c194117971e4ad0598df29395757ced2e6e9bd"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +COMPATIBLE_HOST = "(x86_64.*|aarch64.*)-linux"
>> +
>> +EXTRA_OEMAKE = "ARCH='${TARGET_ARCH}' \
>> +                CROSS_COMPILE='${TARGET_SYS}-' \
>> +                CC='${CC}' \
>> +                CXX='${CXX}' \
>> +                LINKER='${CXX}' \
>> +                LINUX64=1 \
>> +                DEBUG=1 \
>> +                "
>> +
>> +do_compile() {
>> +    ( cd ${S}/decoder/build/linux; oe_runmake ${EXTRA_OEMAKE}; cd - )
>> +}
>> +
>> +do_install() {
>> +    ( cd ${S}/decoder/build/linux; oe_runmake PREFIX=${D}/usr install; cd - )
>> +}
>>

