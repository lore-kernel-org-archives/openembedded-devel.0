Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id EA0877706D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2018 17:09:47 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id p23-v6so10600995qtn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jun 2018 10:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XqkB52L6mx2ysowtyr4Mb5fnVsY51e3DXPehIM45U0I=;
	b=TxRT3uk7GIU3wmrsrXiUzh+OXaH1P3VvCm4t9i8KX/tOXGaLDQzrTRNXivWKvmdECc
	t/4n/eS3TRQZRCgRYHDtijld3fwOpiRvNBfOYc751uDcMS11THutA7KUOMsil2ZFXNLI
	Lco7O6dCeKMatB2JohVP8bd3gmg63aupFiMimE7CcMi5+JSUNjeC+usQIYsVDtKEP6HR
	hnR2Z34L1CErvFQlFgwvr1t1AtlCntAE4V/pcVjFDTFuqEcZg8oPL3w+vVtreoN3b/j+
	71qZMV/j2B+vV/H6c9fyPhj4h/InzApL5T7KF0Kcf+jifOkkkP71koOlk9nr02beBayb
	Uaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XqkB52L6mx2ysowtyr4Mb5fnVsY51e3DXPehIM45U0I=;
	b=KOxZorZWGzB6tZARFtH8YPrsCCwt6WMrKQsV/1ydHVnB3abaL6lqi4M2vSbjtW9kM+
	D37Z7+2eqbHHJZvTJZYE42WIbeH4I6d8BwyW9HL0VaQCw/SUVXEkGmDDojlF1eT48UST
	Gt2rDcrXIE3gOhoVCESouOA4DsaS9hIRbgXn56xsfmRxr4jVzVoERO2s621799cPwizc
	MFbPb/qTtp/Tn851uf/u/30NXLiK4jmlkYZKquWBahjHpiYLKstQT7XH4U5tF+nyNDNI
	v1VgEeeUP6pwgSUNJnPcKLzd2Ojj+OX4ZgCdy1PBtzgGQfV2h6PrQbjmZKsRf1TwRn3x
	na8A==
X-Gm-Message-State: APt69E3RNl1Ire5sbbFjqCWnv+U+ysrVRkxJtULLqq2KHXlyTCdTkK1U
	OnQInIfcO6Bpq7y3JNAN64M2TpEEA9td7PIgDVo=
X-Google-Smtp-Source: ADUXVKLusu2Q+bbYGEbX2ZZuIv1A7c+nCUyoLGA9ZzU8Ve4W8fx9rylcpOsu6P3TUIK1IPHB7ZimCPjBlEWIRjtsA8M=
X-Received: by 2002:ac8:25db:: with SMTP id
	f27-v6mr2657938qtf.128.1528391388676; 
	Thu, 07 Jun 2018 10:09:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP;
	Thu, 7 Jun 2018 10:09:18 -0700 (PDT)
In-Reply-To: <CABPh3UMQ8uhWpxiX-zqQ4XjaMrPfPfBhRKQ=aJW=TjjH-+jULA@mail.gmail.com>
References: <20180605133909.11319-1-nick83ola@gmail.com>
	<20180605133909.11319-2-nick83ola@gmail.com>
	<5113980.YQSFpsKea5@peggleto-mobl.ger.corp.intel.com>
	<CABPh3UMQ8uhWpxiX-zqQ4XjaMrPfPfBhRKQ=aJW=TjjH-+jULA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Jun 2018 10:09:18 -0700
Message-ID: <CAMKF1sppP0MemDjUN=J2RuUKPspRJh6S0BmmQKG4AYZgMQBv8A@mail.gmail.com>
To: nick83ola <nick83ola@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] mosquitto: add mosquitto-examples package
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
X-List-Received-Date: Thu, 07 Jun 2018 17:09:48 -0000
Content-Type: text/plain; charset="UTF-8"

they are in master-next

On Thu, Jun 7, 2018 at 2:32 AM, nick83ola <nick83ola@gmail.com> wrote:
> ping
>
> On 6 June 2018 at 00:33, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>> On Wednesday, 6 June 2018 1:39:09 AM NZST Nicola Lunghi wrote:
>>> From: Nicola Lunghi <nicola.lunghi@jci.com>
>>>
>>> the mosquitto install populate some .example files in
>>> /etc/mosquitto. move thise example files in a separate package
>>>
>>> The PACKAGE_BEFORE_PN is needed because otherwise those examples
>>> end in the base mosquitto package
>>>
>>> Signed-off-by: Nicola Lunghi <nicola.lunghi@jci.com>
>>> ---
>>>  .../recipes-connectivity/mosquitto/mosquitto_1.4.15.bb        | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/meta-networking/recipes-connectivity/mosquitto/
>> mosquitto_1.4.15.bb b/meta-networking/recipes-connectivity/mosquitto/
>> mosquitto_1.4.15.bb
>>> index c71f1e467f..8dd2124c41 100644
>>> --- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
>>> +++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
>>> @@ -62,6 +62,8 @@ do_install() {
>>>
>>>  PACKAGES += "libmosquitto1 libmosquittopp1 ${PN}-clients"
>>>
>>> +PACKAGE_BEFORE_PN = "${PN}-examples"
>>> +
>>>  FILES_${PN} = "${sbindir}/mosquitto \
>>>                 ${bindir}/mosquitto_passwd \
>>>                 ${sysconfdir}/mosquitto \
>>> @@ -79,6 +81,8 @@ FILES_${PN}-clients = "${bindir}/mosquitto_pub \
>>>                         ${bindir}/mosquitto_sub \
>>>  "
>>>
>>> +FILES_${PN}-examples = "${sysconfdir}/mosquitto/*.example"
>>> +
>>>  SYSTEMD_SERVICE_${PN} = "mosquitto.service"
>>>
>>>  INITSCRIPT_NAME = "mosquitto"
>>>
>>
>> Both of these look good to me, FWIW
>>
>> Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>>
>> Cheers,
>> Paul
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
>>
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

