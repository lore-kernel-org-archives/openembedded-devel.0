Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
 by mx.groups.io with SMTP id smtpd.web10.1001.1593452676052795600
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 10:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: balister.org, ip: 216.168.135.166, mailfrom: philip@balister.org)
Received: (qmail 22511 invoked by uid 1003); 29 Jun 2020 17:41:02 -0000
Received: from unknown (HELO ?192.168.11.139?) (philip@opensdr.com@73.152.143.112)
  by mail.geekisp.com with (ECDHE-RSA-AES128-GCM-SHA256 encrypted) SMTP; 29 Jun 2020 17:41:02 -0000
Subject: Re: [oe] [meta-python][PATCH 12/12] python3-pybind11: Upgrade 2.4.3 -> 2.5.0
To: Trevor Gamblin <trevor.gamblin@windriver.com>,
 Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
 <20200626112944.25569-12-leon.anavi@konsulko.com>
 <92b4e917-cdda-8da2-d518-d43d0d6f324f@windriver.com>
From: "Philip Balister" <philip@balister.org>
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
Message-ID: <fe78c5ba-f2d8-e031-8c34-168f5697ce7d@balister.org>
Date: Mon, 29 Jun 2020 13:44:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <92b4e917-cdda-8da2-d518-d43d0d6f324f@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

I just did some work that needed adding a BBCLASSEXTEND = "native", with
this I had to use cmake to build the packages since pypi doesn't instal
the cmake files for development. There is an open bug about this in the
pybind bug tracker.

Philip

On 6/29/20 10:53 AM, Trevor Gamblin wrote:
> 
> On 6/26/20 7:29 AM, Leon Anavi wrote:
>> Upgrade to release 2.5.0:
>>
>> - Use C++17 fold expressions in type casters, if available. This
>>    can improve performance during overload resolution when
>>    functions have multiple arguments.
>> - Changed include directory resolution in pybind11/__init__.py and
>>    installation in setup.py. This fixes a number of open issues
>>    where pybind11 headers could not be found in certain environments.
>> - C++20 char8_t and u8string support.
>> - CMake: search for Python 3.9.
>> - Fixes for MSYS-based build environments.
>> - STL bindings for std::vector<...>::clear.
>> - Read-only flag for py::buffer.
>> - Exception handling during module initialization.
>> - Support linking against a CPython debug build.
>> - Fixed issues involving the availability and use of aligned new
>>    and delete.
>> - Fixed a resource leak upon interpreter shutdown.
>> - Fixed error handling in the boolean caster.
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> ---
>>   .../{python3-pybind11_2.4.3.bb => python3-pybind11_2.5.0.bb}  | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename
>> meta-python/recipes-devtools/python/{python3-pybind11_2.4.3.bb =>
>> python3-pybind11_2.5.0.bb} (62%)
>>
>> diff --git
>> a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
>> b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
>> similarity index 62%
>> rename from meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
>> rename to meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
>> index 9efa2db75..dc3b8f6ad 100644
>> --- a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
>> +++ b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
>> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/wjakob/pybind11"
>>   LICENSE = "BSD-2-Clause"
>>   LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
>>   -SRC_URI[md5sum] = "23fdca8191b16ce3e7f38fb9e4252b2d"
>> -SRC_URI[sha256sum] =
>> "72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758"
>> +SRC_URI[md5sum] = "5355e1fd05c8eedef19cc9bfd3d82a77"
>> +SRC_URI[sha256sum] =
>> "ea5a4e7a880112915463826f1acbec5892df36dfe102ecb249229ac514fb54ad"
>>     inherit pypi setuptools3
>>
>>
> 
> 
> 
> 
