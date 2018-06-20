Return-Path: <philip@balister.org>
X-Greylist: delayed 401 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Jun 2018 11:45:34 UTC
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id 49AF47547A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 11:45:34 +0000 (UTC)
Received: (qmail 28256 invoked by uid 1003); 20 Jun 2018 11:38:54 -0000
Received: from unknown (HELO ?192.168.11.100?)
	(philip@opensdr.com@73.152.143.112)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	20 Jun 2018 11:38:54 -0000
To: =?UTF-8?Q?Maxime_Roussin-B=c3=a9langer?=
	<maxime.roussinbelanger@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <CAE=T-s66aNwCjWwWfMkZNrw+sUAak3Hg=T2SCjSeNkX8vu_w7g@mail.gmail.com>
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
Message-ID: <64e3d700-0d95-353d-040c-c246e14c378b@balister.org>
Date: Wed, 20 Jun 2018 07:38:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAE=T-s66aNwCjWwWfMkZNrw+sUAak3Hg=T2SCjSeNkX8vu_w7g@mail.gmail.com>
Subject: Re: meta-python/python-scipy
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
X-List-Received-Date: Wed, 20 Jun 2018 11:45:34 -0000
X-Groupsio-MsgNum: 72956
Content-Type: multipart/mixed; boundary="------------FD59ED24912D8F10D6620B13"
Content-Language: en-MW

--------------FD59ED24912D8F10D6620B13
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 06/19/2018 03:24 PM, Maxime Roussin-Bélanger wrote:
> Has anyone been able to have some sort of a breakthrough to build
> python-scipy?
> 
> I'm trying to build python-scipy on a x86-64generic MACHINE and I reached
> math-atlas fun...
> 
> I couldn't find any math-atlas recipe... at this point I think it might be
> a lot easier to build an ISO with a preseed configuration that installs
> python-scipy for our purpose.
> 
> Has anyone worked on it and would share they work on the contrib repo?

I just spent some time working on getting it to build natively on a Pi3
successfully (failed about 85 for 3500 tests). Next step is see if I can
use the same trick numpy does to get a configuration in place so it
cross compiles.

The configure phase of the compile is completely broken for cross
compilation since it is collecting information about python from the
sysroot, which is not going to match python on the target.

I skipped atlas and built lapack. Atlas has similar issues with cross
compilation.

I'm coming back to this, but not for several weeks.

Philip



> 
> Thanks.
> Max.
> 

--------------FD59ED24912D8F10D6620B13
Content-Type: text/plain; charset=UTF-8;
 name="lapack_3.8.0.bb"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="lapack_3.8.0.bb"

U1VNTUFSWSA9ICJMaW5lYXIgQWxnZWJyYSBQQUNLYWdlIgpVUkwgPSAiaHR0cDovL3d3dy5uZXRs
aWIub3JnL2xhcGFjayIKTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UiCkxJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTkzMGY4YWE1MDBhNDdjN2RhYjBmOGVmYjVhMWM5YTQwIgoK
REVQRU5EUyA9ICJsaWJnZm9ydHJhbiIKClNSQ19VUkkgPSAiaHR0cDovL3d3dy5uZXRsaWIub3Jn
L2xhcGFjay9sYXBhY2stJHtQVn0udGFyLmd6IgpTUkNfVVJJW21kNXN1bV0gPSAiOTY1OTFhZmZk
YmY1OGM0NTBkNDVjMWRhYTU0MGRiZDIiClNSQ19VUklbc2hhMjU2c3VtXSA9ICJkZWIyMmNjNGE2
MTIwYmZmNzI2MjExNTVhOTkxN2Y0ODVmOTZlZjgzMTlhYzA3NGE3YWZiYzY4YWFiODhiY2Y2IgoK
RVhUUkFfT0VDTUFLRSA9ICIgLURCVUlMRF9TSEFSRURfTElCUz1PTiAiCk9FQ01BS0VfR0VORVJB
VE9SID0gIlVuaXggTWFrZWZpbGVzIgoKaW5oZXJpdCBjbWFrZSBwa2djb25maWcKCg==

--------------FD59ED24912D8F10D6620B13--
