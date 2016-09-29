Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7096022F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Sep 2016 00:10:57 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id oz2so2639831pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 17:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=Ayg2Np7NadPj3A4+L1UBinfKIHra4W4F2m6Jhu+7ST0=;
	b=SiIYHnH9RdNUmV7XbPR1UBh29L/lBL0OtRecvqcmw6+GBhhpm/fJrOJ7nYsYdC3wgn
	oaw5gT0r7odmzZN06mB//6dO2Jp09hemOdpdGP6nt5jU6aXig5L3g22GyEkBtd1DpKUb
	ezw8Tfyz8xCXYEGKbhMzoN6RxavsusqHBz82wsQWkyy/M1GDc7j+JnYKf+3QIX081B7t
	jQsHYHDuqoV8bY9bkM/dTsFh7NR0MItUkFD0eOZuiF49+bxAFQtgV8ILVFGDPpuS+jUs
	3T+PZuFeqac9B93sjwV/ee5V/qssNLQXC+1Nt07gKC6qfvlTPQwCmdVS3AgPXb6TfYL8
	nZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Ayg2Np7NadPj3A4+L1UBinfKIHra4W4F2m6Jhu+7ST0=;
	b=OrRclcAofaLEU6pPmXcgUOD37o0A0qAejmQBrCX5KJCq31m2Y2wrfJe/jBikyOj3Ij
	q2Qj1HUaWWh2Ro4qWrCS7vyYckOI4aLRnc2s77Ex+OyJF5ZQIiZVA2iWum6jba70ABio
	SfjJRmuCJe+x9ddaXHka7K0zFquk5SxjM/KVSTBEVAaNniveEUxmdXESmUa/ACjz5SUu
	s+9VpKngbn3MX/vymalHBMJS8XlcPWj8l4BMs1n3d+7hP3+TB36DBO4ao96Km0+WBOb5
	oPsOgk620s1iTZMOP0FxpNxHNSaz1xpXmFwxvc98M5PdOrbJ353QdnUGrcvdt7bwQZpN
	iQUw==
X-Gm-Message-State: AE9vXwNiufVs3tX4FMC03BYibCpGLn9u15Azwb1uet4LERnIBMyQwSr89Hf+QSiRuGtJTQ==
X-Received: by 10.67.8.41 with SMTP id dh9mr61182397pad.132.1475107859442;
	Wed, 28 Sep 2016 17:10:59 -0700 (PDT)
Received: from [10.22.11.190] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	r66sm15021475pfb.54.2016.09.28.17.10.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Sep 2016 17:10:58 -0700 (PDT)
To: Ruben De Smet <ruben.de.smet@rubdos.be>,
	openembedded-devel@lists.openembedded.org
References: <20160822143457.6378-1-ruben.de.smet@rubdos.be>
	<75048f87-6738-f678-b085-7bdc337b89e6@rubdos.be>
From: akuster808 <akuster808@gmail.com>
Message-ID: <9d9e512d-a454-e917-a6f0-d3bd0ba381e7@gmail.com>
Date: Wed, 28 Sep 2016 17:10:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <75048f87-6738-f678-b085-7bdc337b89e6@rubdos.be>
Subject: Re: [meta-oe][krogoth][PATCH] python-cassandra-driver: add recipe for version 3.6.0
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
X-List-Received-Date: Thu, 29 Sep 2016 00:10:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


Ruben,

On 09/28/2016 12:26 PM, Ruben De Smet wrote:
> Hi,
>
> Any chance these things could get merged? Would be for both upstream and
> krogoth.

Sorry, Stable releases do not accept the addition of new packages.

regards,
Armin
>
> They do depend on my
>
>   pypi: update the base pypi url to use the package info without
> requiring the hash
>
> backport.
>
> Ruben
>
> On 08/22/2016 04:34 PM, Ruben De Smet wrote:
>> A Python library for Apache Cassandra
>>
>> Signed-off-by: Ruben De Smet <ruben.de.smet@rubdos.be>
>> ---
>>   .../python/python-cassandra-driver.inc              | 21 +++++++++++++++++++++
>>   .../python/python3-cassandra-driver_3.6.0.bb        | 16 ++++++++++++++++
>>   2 files changed, 37 insertions(+)
>>   create mode 100644 meta-python/recipes-devtools/python/python-cassandra-driver.inc
>>   create mode 100644 meta-python/recipes-devtools/python/python3-cassandra-driver_3.6.0.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python-cassandra-driver.inc b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
>> new file mode 100644
>> index 0000000..d3e4cf6
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
>> @@ -0,0 +1,21 @@
>> +SUMMARY = "DataStax Python Driver for Apache Cassandra"
>> +DESCRIPTION = "A modern, feature-rich and highly-tunable Python client \
>> +library for Apache Cassandra (1.2+) and DataStax Enterprise (3.1+) using \
>> +exclusively Cassandra's binary protocol and Cassandra Query Language v3."
>> +HOMEPAGE = "https://github.com/datastax/python-driver"
>> +SECTION = "devel/python"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
>> +SRCNAME = "cassandra-driver"
>> +
>> +SRC_URI[md5sum] = "756a3b235c5766c3072ed62e1083c9ef"
>> +SRC_URI[sha256sum] = "049c8a871e49052c7b72fddb6569f1bfe738bbfea0a562eeeb5404abeff015ab"
>> +
>> +DISTUTILS_BUILD_ARGS += " \
>> +    --no-libev \
>> +"
>> +DISTUTILS_INSTALL_ARGS += " \
>> +    --no-libev \
>> +"
>> +
>> +inherit pypi
>> diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.6.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.6.0.bb
>> new file mode 100644
>> index 0000000..65fd2c0
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.6.0.bb
>> @@ -0,0 +1,16 @@
>> +inherit setuptools3
>> +require python-cassandra-driver.inc
>> +
>> +RDEPENDS_${PN} += "\
>> +    python3-cython \
>> +    python3-multiprocessing \
>> +    python3-six \
>> +    python3-json \
>> +    libevent \
>> +"
>> +RDEPENDS_${PN}_class-native = ""
>> +
>> +DEPENDS_${PN} += "\
>> +    python3-setuptools \
>> +    python3-cython \
>> +"
>>
>


