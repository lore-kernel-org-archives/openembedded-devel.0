Return-Path: <parthitce@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id B82EF7F0E0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 10:16:59 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f17so8407793wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 03:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=zcTI6BMbCgKy5LsNLG5GtKOBvFlFRdU9WrLUJFzYlPU=;
	b=G19MBOpHhEowODtvWCQt14tDcQQ2bkTtCHfPl13nFU85VlW2zkGMcZUTP/er6KApGf
	BXm5DmS1PoobXDrBHzg1C9oLhD/ZFsFCUyziGz1Eh+MmJEauZiJdy9PF6RNytM82wFZk
	wAnaaCkgjiYoFGg1+N9I1HArKcVntCs5ujc+08ZcpKfDFHDwmPnOYlZl02/w8kIRWGjo
	Qs3co9GKYGLCTryauIHKRlOIS7H+4e/PkCvztVgOIDXgjWjNCdksJZ8zepvgmsx+OASk
	7OIst620fXctsccsakIAqos9IgUcexECyGRA+Wn8f37KIIR9kHHDCvxCuxM/Uugl4aSr
	Jagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zcTI6BMbCgKy5LsNLG5GtKOBvFlFRdU9WrLUJFzYlPU=;
	b=Y5cA862MQHIcii2VnM/9WFhy+xhZ4M95vnksbAaYekArDmhdSWCew3YoBsjj+cU3Dw
	3OfRFpwgZFxCAL7WyBC2pgUfzlWjXxfjQ/eF8uHDtM3CG2snZpOD4p01QSSLEjD5fwXX
	HjMcvs/BS9q1qaDh+4Ykl2VWZ4rSH7ew3OvR7e1ij6FRC39NX8VsVAGCBGzeJoWbdHgv
	m2W/RxbxtgzbXgbwb6Sebx8s9kIcvBoAqpalhnjb6Kde22YqE9bpS0uSgKSRRiDqnr2A
	ivK9+Sdjx13QRgSb1M987fQCDkF6/YRK6r7bC9aDLijDcxOGi3zFXt4wrqXLeZ3altYO
	BmCQ==
X-Gm-Message-State: APjAAAVERDlMnN5CAQo93+xYhfATjheIEsiz1mPawRiR2uVaclJPqKGw
	17PZ6urPlAEHWrp8kzXRQ8QDZSpWmA==
X-Google-Smtp-Source: APXvYqz5ynKKjS5o/ZGRhM7iwdlSj/zbZXwnRC81H3vyQJ0iBFNiy33bt/fNkHluPbSp0wu0IkfLOQ==
X-Received: by 2002:a1c:cb01:: with SMTP id b1mr9347580wmg.69.1562926620373;
	Fri, 12 Jul 2019 03:17:00 -0700 (PDT)
Received: from antares.denx.de ([62.91.23.180])
	by smtp.gmail.com with ESMTPSA id c4sm7220548wrt.86.2019.07.12.03.16.59
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Jul 2019 03:16:59 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <20190712100135.456990-1-parthitce@gmail.com>
	<20190712100826.GB21468@localhost>
From: Parthiban Nallathambi <parthitce@gmail.com>
Message-ID: <e7d5ff08-0e5c-3b79-4157-2874786376ea@gmail.com>
Date: Fri, 12 Jul 2019 12:16:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190712100826.GB21468@localhost>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] python3-matplotlib: add version 3.1.1
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
X-List-Received-Date: Fri, 12 Jul 2019 10:17:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/12/19 12:08 PM, Adrian Bunk wrote:
> On Fri, Jul 12, 2019 at 12:01:35PM +0200, Parthiban Nallathambi wrote:
>> Signed-off-by: Parthiban Nallathambi <parthitce@gmail.com>
>> ---
>>   .../python/python-matplotlib.inc                | 17 +++++++++++++++++
>>   .../python/python3-matplotlib_3.1.1.bb          |  2 ++
>>   2 files changed, 19 insertions(+)
>>   create mode 100644 meta-python/recipes-devtools/python/python-matplotlib.inc
>>   create mode 100644 meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python-matplotlib.inc b/meta-python/recipes-devtools/python/python-matplotlib.inc
>> new file mode 100644
>> index 000000000..fb5ec9d6a
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-matplotlib.inc
>> @@ -0,0 +1,17 @@
>> +SUMMARY = "matplotlib: plotting with Python"
>> +DESCRIPTION = "\
>> +Matplotlib is a Python 2D plotting library which produces \
>> +publication-quality figures in a variety of hardcopy formats \
>> +and interactive environments across platforms."
>> +HOMEPAGE = "https://github.com/matplotlib/matplotlib"
>> +LICENSE = "BSD-2-Clause"
>> +LIC_FILES_CHKSUM = "file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74"
>> +
>> +DEPENDS = "python3-numpy-native python3-numpy freetype libpng python3-dateutil python3-pytz"
>> +RDEPENDS_${PN} = "python3-numpy freetype libpng python3-dateutil python3-pytz"
>> +
>> +SRC_URI[md5sum] = "f894af5564a588e880644123237251b7"
>> +SRC_URI[sha256sum] = "1febd22afe1489b13c6749ea059d392c03261b2950d1d45c17e3aed812080c93"
>> +
>> +PYPI_PACKAGE = "matplotlib"
>> +inherit pypi
>> diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
>> new file mode 100644
>> index 000000000..bbeebe20c
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
>> @@ -0,0 +1,2 @@
>> +inherit setuptools3
>> +require python-matplotlib.inc
> 
> There is no benefit in using an .inc when it isn't used by more than one
> other file.

Thanks, I will make it into single file.

Thanks,
Parthiban N

> 
> cu
> Adrian
> 

