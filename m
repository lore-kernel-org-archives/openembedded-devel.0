Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with ESMTP id 9B8C574535
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 00:29:48 +0000 (UTC)
Received: (qmail 31581 invoked by uid 1003); 7 Sep 2018 00:29:53 -0000
Received: from unknown (HELO ?192.168.11.100?)
	(philip@opensdr.com@73.152.143.112)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	7 Sep 2018 00:29:53 -0000
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20180905210224.21225-1-raj.khem@gmail.com>
	<20180905210224.21225-10-raj.khem@gmail.com>
	<70311756-b9d0-f3c2-cd7e-cb057f390ef4@balister.org>
	<f539cee0-af55-37e5-72c2-01c431e11832@gmail.com>
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
Message-ID: <81feb8d0-7b41-a744-ebac-742dd92a32b4@balister.org>
Date: Thu, 6 Sep 2018 20:29:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <f539cee0-af55-37e5-72c2-01c431e11832@gmail.com>
Subject: Re: [meta-oe][PATCH 10/12] sip: Upgrade to 4.19.12 release
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
X-List-Received-Date: Fri, 07 Sep 2018 00:29:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit

Yes working for the latest release. I emailed the pyqt/sip list with a
question. Hopefully we can sort the issue out. Working toward a combined
pyqt5 build for py 2 and 3

Philip

On 09/06/2018 08:23 PM, Khem Raj wrote:
> 
> 
> On 9/6/18 5:17 PM, Philip Balister wrote:
>> This leads to a dysfunctional sip. I'm working on a working update.
>>
> 
> Thanks for update, although we will need to move to this version for
> openssl 1.1.x support. are working on fixing the same version ?
> if so I will look forward for patches.
> 
>> On 09/05/2018 05:02 PM, Khem Raj wrote:
>>> Inherit pythonnative instead of using python from build host
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  .../recipes-devtools/sip/{sip_4.19.8.bb => sip_4.19.12.bb}  | 6 +++---
>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>  rename meta-oe/recipes-devtools/sip/{sip_4.19.8.bb => sip_4.19.12.bb} (90%)
>>>
>>> diff --git a/meta-oe/recipes-devtools/sip/sip_4.19.8.bb b/meta-oe/recipes-devtools/sip/sip_4.19.12.bb
>>> similarity index 90%
>>> rename from meta-oe/recipes-devtools/sip/sip_4.19.8.bb
>>> rename to meta-oe/recipes-devtools/sip/sip_4.19.12.bb
>>> index ea944b32ff..be58959989 100644
>>> --- a/meta-oe/recipes-devtools/sip/sip_4.19.8.bb
>>> +++ b/meta-oe/recipes-devtools/sip/sip_4.19.12.bb
>>> @@ -4,13 +4,13 @@ SECTION = "devel"
>>>  LICENSE = "GPLv2+"
>>>  LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
>>>  
>>> -inherit python-dir
>>> +inherit python-dir pythonnative
>>>  
>>>  DEPENDS = "python"
>>>  
>>>  SRC_URI = "${SOURCEFORGE_MIRROR}/project/pyqt/sip/sip-${PV}/sip-${PV}.tar.gz"
>>> -SRC_URI[md5sum] = "0625fb20347d4ff1b5da551539be0727"
>>> -SRC_URI[sha256sum] = "7eaf7a2ea7d4d38a56dd6d2506574464bddf7cf284c960801679942377c297bc"
>>> +SRC_URI[md5sum] = "e28b0790dfe4962ce6bbd7c4772f40c9"
>>> +SRC_URI[sha256sum] = "24617fc31b983df075500ecac0e99d2fb48bf63ba82d4a17518659e571923822"
>>>  
>>>  BBCLASSEXTEND = "native"
>>>  
>>>
> 

