Return-Path: <rtie@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by mail.openembedded.org (Postfix) with ESMTP id B7C62783DE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Nov 2018 07:40:22 +0000 (UTC)
Received: from [192.168.15.101] ([87.245.7.122]) by mail.gmx.com (mrgmx003
	[212.227.17.190]) with ESMTPSA (Nemesis) id 0MJjvw-1gLlNy2xLI-001BHG;
	Thu, 08 Nov 2018 08:40:22 +0100
To: Khem Raj <raj.khem@gmail.com>
References: <20181107152652.98604-1-rtie@gmx.de>
	<CAMKF1soysT-mzqv3GpSrcwhJFcCkey6xKfVB7cOSqBaa36_oUw@mail.gmail.com>
From: Robert Tiemann <rtie@gmx.de>
Message-ID: <2b8e9364-f6c7-f998-f53b-bdf729687838@gmx.de>
Date: Thu, 8 Nov 2018 08:40:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soysT-mzqv3GpSrcwhJFcCkey6xKfVB7cOSqBaa36_oUw@mail.gmail.com>
X-Provags-ID: V03:K1:mQ/WQcFOzmTuFZrzFsys14gNTFPzz2fFCylgRZvSdq/4aT/8jQJ
	LdyAWvYa4RXjf+ZisqCL7uRv1MUONgNjXsRN7wT9KUbwTdQFsZqCBsjfVKhRNOwiuPdvjOE
	EFKg251TOgj0A+t1kK3/Xr128S0/kyjzN2FDnIusaKqaOmqBdINWvqGitt7jDwzz6inm8Dc
	wG665CHCv5hBJKjEW3Fdw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:5iYnOxXZefw=:geWvCs5Wnu+w8n/ZkDQDnB
	feTiGLzXPbEXQb4cB4vYmk/YX7/E2JNG/fvk1W7NZmHMHBXpOmMfT+NaWi6sCKyRhkcioxKkp
	MACrDk4dQR4VWZbz8GLqH/2jQ3RPSI3yiMhIG1V0XAJMGstqU25hLdyWOkp7QzqURhlq/eLtu
	S2unLU2TVSSlFZFpQ/WboHfE3gxWTP1+utHpXDuWLGVZDzQOEwfM70Pe7Zi4zaODUBKs+cqgP
	FL55KFnF1ylfDcfVqGEcKf6zPlbTAPyu7HMdmxhLH3DMcibEjpnJ136JYVohOVf+e9k411IYv
	PvFHX0c0Jr2beFROpa+Mq0vGLEnGU8E+RAboKbGq4A1b1LPwpYhIatDk9OL/Fg2+7XgRfeXaR
	KSwF5JO5jq7owdhDVz7XhNB087S2trhu4/UxL968NsEBYaxnLkTSqracRZHTpwFxCFKiMH7+C
	Q4bpRihpITe+sNSkXHBw4CC9TY2EMSXKCW255+EMOyUv6EMpt2a3lWRSfwvp6XyQqxCaVyhFB
	QKQgnjNSOcTUpAEZNtyrKHqlPCXhiRNfkN8imGXGEyBYmI+2p+H8fLmi6ut8api+W9B7BpQuf
	KtnTCxN5MnVPG9qMRY6dwldQKbkBvwwQYIDGdF55zoQo36RmozZ/LOpBZS4Bk7/fKkS3kSVzi
	lu1F2MRdZYEZfyAJ/JFN2QTiX2esI8rJ4nukbHDVrDR5m/i9EKP6oFbNp/66M/60NRiYoOD1i
	TOoCdRkT9sox2hplgGejdnC6bJG2rXvWzF/9Mq7sYjXalKRevtd+o6WE6z1fkjf6f1X4D+XPW
	QgFINdJyANJqczgUHhO7mZuw406YD2LHtsSJvUeNM0vZd8fk0a4w8A6f/myltxOql9ye5vc4f
	iLVWmTDzISr3WvDF4xvV2QU35MslSuvID26yio1Acd95RSXS2GB9b09veAO89w
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] curlpp: Fix packaging and reference to license
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
X-List-Received-Date: Thu, 08 Nov 2018 07:40:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/07/2018 05:38 PM, Khem Raj wrote:
> On Wed, Nov 7, 2018 at 7:32 AM Robert Tiemann <rtie@gmx.de> wrote:
>>
>> This patch fixes three issues:
>>
>> 1. The recipe used "libcurlpp" for its package base name. It defined
>>   PACKAGES and corresponding package contents manually, but the
>>   non-standard naming led to an error message when trying to depend on
>>   it (nothing provides curlpp needed by curlpp-dev).
>>
>>   See also
>>   https://lists.yoctoproject.org/pipermail/poky/2018-February/011236.html.
>>
>>   Fixed by removing PACKAGES and corresponding FILES_*, relying on
>>   automatic packaging now.
>>
>> 2. Upstream ships a license file (MIT), which is referenced by the
>>   recipe now (instead of the stock COPYING.MIT file).
>>
>> 3. There was a do_install_append() function which patched the
>>   installed curlpp.pc file. Since it seemed to be of no use, it was
>>   removed.
>>
>> Signed-off-by: Robert Tiemann <rtie@gmx.de>
>> ---
>>  .../recipes-support/curlpp/curlpp_0.8.1.bb     | 18 ++----------------
>>  1 file changed, 2 insertions(+), 16 deletions(-)
>>
>> diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
>> index 340f57dc7..f92cf65cf 100644
>> --- a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
>> +++ b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
>> @@ -2,7 +2,7 @@ SUMMARY = "C++ library for client-side URL transfers"
>>  HOMEPAGE = "http://www.curlpp.org/"
>>  SECTION = "libdevel"
>>  LICENSE = "MIT"
>> -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>> +LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=fd0c9adf285a69aa3b4faf34384e1029"
>>
>>  DEPENDS = "curl"
>>  DEPENDS_class-native = "curl-native"
>> @@ -10,24 +10,10 @@ DEPENDS_class-native = "curl-native"
>>  SRC_URI = "git://github.com/jpbarrette/curlpp.git"
>>
>>  SRCREV = "592552a165cc569dac7674cb7fc9de3dc829906f"
>> +PR = "r1"
> 
> this is not needed. Please drop it

OK, I've sent a new version.

>>
>>  S = "${WORKDIR}/git"
>>
>>  inherit cmake pkgconfig binconfig
>>
>> -do_install_append () {
>> -    sed -i 's,${STAGING_DIR_TARGET},,g' ${D}${libdir}/pkgconfig/curlpp.pc
>> -}
>> -
>> -PACKAGES =+ "libcurlpp libcurlpp-dev libcurlpp-staticdev"
>> -
>> -FILES_lib${BPN} = "${libdir}/lib*.so.*"
>> -
>> -FILES_lib${BPN}-dev = "${includedir} \
>> -    ${libdir}/pkgconfig \
>> -    ${bindir}/*-config \
>> -"
>> -
>> -FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
>> -
>>  BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.19.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

