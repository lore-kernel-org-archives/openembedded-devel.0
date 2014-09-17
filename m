Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id F05FD71490
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 17 Sep 2014 00:20:56 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id h15so342157igd.14
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 17:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Z5guNX8RVKGIiLQkdZ2AcyFhPskx8F6kItyquErdZXQ=;
	b=Lg8RTQFkVnGUYppss/gzRYDmQ/+JbXA2LUIGUDZ/dvGDccE7dN722iykORcF95PrkL
	2N8ZWIgmbZwjghNj8+ZuSmh3rmVY54J/Coq/s4NFvmwZ4C159qc0iI0FR03NICf07D5F
	smgr0RykHd7UZ9dKggKoVBx+WzW8Qvav8GSCqlXuyKAmEMjjka+17uBYp5C2Lism55ez
	mt8K5CEEeiF4I1xqB1zSgJiIOccR70q8kGA8TyHB0zyJ4FFyrIgjn6//BKqcRgwxFZbh
	v2Ejj5pUysOgQRgk/UTrUcGSp4q3i51HfxqRuyWWRXLqOZ5cMt8FDoVryFR+8PpXVp/X
	YFhg==
MIME-Version: 1.0
X-Received: by 10.50.20.4 with SMTP id j4mr2388061ige.13.1410913257979; Tue,
	16 Sep 2014 17:20:57 -0700 (PDT)
Received: by 10.50.240.6 with HTTP; Tue, 16 Sep 2014 17:20:57 -0700 (PDT)
In-Reply-To: <5417FED2.1030106@pseudoterminal.org>
References: <CAMKF1srKjh-imfCPMTW9EiZNRFVydO71LSMPzhnAFuoUWtocZg@mail.gmail.com>
	<5417FED2.1030106@pseudoterminal.org>
Date: Tue, 16 Sep 2014 17:20:57 -0700
Message-ID: <CAMKF1src0wJ6vStvRp1sJdpRy_tf-=FDcz_LMdAoA-QsgrE_Gg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: mpg123 recipe LICENSE_FLAGS = "commercial" issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Sep 2014 00:21:03 -0000
Content-Type: text/plain; charset=UTF-8

On Tuesday, September 16, 2014, Carlos Rafael Giani <dv@pseudoterminal.org>
wrote:

> On 2014-09-16 07:43, Khem Raj wrote:
>
>> Hi Carlos/All
>>
>> I want to understand why LICENSE_FLAGS = "commercial" was added to
>>
>> meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb
>>
>> in initial commit and has been carried over upgrades ever since
>>
>> The license seems to be LGPL 2.0 and is explained in greater detail here
>>
>> http://mpg123.org/cgi-bin/scm/mpg123/trunk/doc/ROAD_TO_LGPL?revision=2607
>>
>> So what portions of it are having different terms for commercial
>> distribution ?
>>
>> Thanks
>>
>> -Khem
>>
>
> It's because MPEG audio is subject to royalties


In what way where the component is lgpl I would like to understand



>  This is also the reason why gst-plugins-ugly and
> gstreamer1.0-plugins-ugly have this flag.
>
> Carlos
>

