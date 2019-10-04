Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with ESMTP id 1CDC86B06C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2019 00:31:14 +0000 (UTC)
Received: (qmail 27663 invoked by uid 1003); 4 Oct 2019 00:31:21 -0000
Received: from unknown (HELO ?10.105.2.145?) (philip@opensdr.com@167.220.58.17)
	by mail.geekisp.com with (ECDHE-RSA-AES128-GCM-SHA256 encrypted) SMTP;
	4 Oct 2019 00:31:20 -0000
To: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>,
	openembedded-devel@lists.openembedded.org
References: <20191003140729.28352-1-jean-marie.lemetayer@savoirfairelinux.com>
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
Message-ID: <6c60d1b0-414b-38de-6830-de10333f666e@balister.org>
Date: Thu, 3 Oct 2019 17:31:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191003140729.28352-1-jean-marie.lemetayer@savoirfairelinux.com>
Subject: Re: [meta-python][PATCH] python-toml: add recipes for python2 and python3
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
X-List-Received-Date: Fri, 04 Oct 2019 00:31:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/3/19 10:07 AM, Jean-Marie LEMETAYER wrote:
> This package is a Python library for parsing and creating TOML [1].

Shouldn't new recipes only have a python3 version since python2 is eol
at the end of the year?

Philip

> 
> Another python TOML parser library named pytoml already exists in
> meta-oe/recipes-devtools/python/python*-pytoml_*.bb but this library is
> deprecated and it is explicitly explained to consider using the toml
> package instead [2].
> 
> 1: https://github.com/toml-lang/toml
> 2: https://github.com/avakar/pytoml/commit/cd2a62e1444cda2c517b02d36b97151acf379b88
> 
> Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
> ---
>  meta-python/recipes-devtools/python/python-toml.inc    | 10 ++++++++++
>  .../recipes-devtools/python/python-toml_0.10.0.bb      |  6 ++++++
>  .../recipes-devtools/python/python3-toml_0.10.0.bb     |  6 ++++++
>  3 files changed, 22 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-toml.inc
>  create mode 100644 meta-python/recipes-devtools/python/python-toml_0.10.0.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-toml_0.10.0.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python-toml.inc b/meta-python/recipes-devtools/python/python-toml.inc
> new file mode 100644
> index 000000000..a3b3dfc86
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-toml.inc
> @@ -0,0 +1,10 @@
> +SUMMARY = "Python Library for Tom's Obvious, Minimal Language"
> +HOMEPAGE = "https://github.com/uiri/toml"
> +LICENSE = "MIT"
> +SECTION = "devel/python"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=6d6012eea477117abf51c31262a152f8"
> +
> +SRC_URI[md5sum] = "63fffbe2d632865ec29cd69bfdf36682"
> +SRC_URI[sha256sum] = "229f81c57791a41d65e399fc06bf0848bab550a9dfd5ed66df18ce5f05e73d5c"
> +
> +inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python-toml_0.10.0.bb b/meta-python/recipes-devtools/python/python-toml_0.10.0.bb
> new file mode 100644
> index 000000000..3c4acce67
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-toml_0.10.0.bb
> @@ -0,0 +1,6 @@
> +inherit setuptools
> +require python-toml.inc
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-datetime \
> +"
> diff --git a/meta-python/recipes-devtools/python/python3-toml_0.10.0.bb b/meta-python/recipes-devtools/python/python3-toml_0.10.0.bb
> new file mode 100644
> index 000000000..cebb41a53
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-toml_0.10.0.bb
> @@ -0,0 +1,6 @@
> +inherit setuptools3
> +require python-toml.inc
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-misc \
> +"
> 

