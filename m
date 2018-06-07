Return-Path: <nick83ola@gmail.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 37E33752EF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2018 09:32:21 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id 101-v6so10740675oth.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jun 2018 02:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:cc; 
	bh=lJVk/2iJvGjDAmPHsFQQAqK1ouEOkgea2DofY/Rk6eM=;
	b=lcC058DY/ySVItQHdDmUU/V+yr/r1P3deD8VesO3a87VFQqNXf+00KViT/f626cRVh
	HKrabrVVqur3zPbAPWOCVFxYNJ+q1QNYqhoatl7FJDRiK7PNLvcOjOCR3n3fQ3RBvHkg
	M5bqsezeq2EKfjyKbJMc4dkcOgibwG6eGFhjBn43FmRwi2Fn5T1qw8MT9yoB6dt7wWB+
	NQhwvh/R/B9nWw0J9dPdf8LE4D8lb45NcPeWZaFNIYSo/R1tW7gM+vQwbZZDRMEnaRy/
	OYYY44x1Df+BlOy9H5AwCgPMHCrlKC8aC7XY3rM6mBCZiJZh/WmER4tjFuEl1Ph/mdkF
	a8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:cc;
	bh=lJVk/2iJvGjDAmPHsFQQAqK1ouEOkgea2DofY/Rk6eM=;
	b=rg10NcZsEA6UBjMPuDtxIpiYvNExBlA9VnksrzRN0Lw2Wge2ltMwZpvw54/G3CSGnh
	BvigJAD5Jykef2sOsJLHEOFxon0HznpiWG4ew9ovC/XgxQSS8D73lOnlHeKXCo8ZuQVy
	OL9l7XROLjx8qHAwSq5YzciZ1YBpKOEAikosCwreMEH5VAMVPJClcudJI1p/J+xjkcf+
	pgAPG18Om/bDZJ5YHgop004fyLakGhGSMzGY+8dNkaqOTYXc/iqKuIk1gzg2uKZMIucx
	yB5X6rItmngInbNOycGgZJWrz20aeHCp3zeE60GkpS4tFvAvmx5cdD53EVID7qRfkhPP
	dqnA==
X-Gm-Message-State: APt69E0hnfwsUCwzoBVWS6CLyQcXdWzXGhqulqfftkoZCVY1R0hTClDc
	JuUMKSLy9cQosfT8MLspYnImNNQ7ayIKHmHHODA=
X-Google-Smtp-Source: ADUXVKI7wP8D9jLIbSItnaLPk02Mipfe02y2ZWC1cmV1JolhmcKjGv9AkWGqQkHwm4Farm1zzVMX+zlIEMJVpN/6fU8=
X-Received: by 2002:a9d:4a63:: with SMTP id
	d32-v6mr634725otj.194.1528363942032; 
	Thu, 07 Jun 2018 02:32:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5f8d:0:0:0:0:0 with HTTP;
	Thu, 7 Jun 2018 02:32:01 -0700 (PDT)
In-Reply-To: <5113980.YQSFpsKea5@peggleto-mobl.ger.corp.intel.com>
References: <20180605133909.11319-1-nick83ola@gmail.com>
	<20180605133909.11319-2-nick83ola@gmail.com>
	<5113980.YQSFpsKea5@peggleto-mobl.ger.corp.intel.com>
From: nick83ola <nick83ola@gmail.com>
Date: Thu, 7 Jun 2018 10:32:01 +0100
Message-ID: <CABPh3UMQ8uhWpxiX-zqQ4XjaMrPfPfBhRKQ=aJW=TjjH-+jULA@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 07 Jun 2018 09:32:21 -0000
Content-Type: text/plain; charset="UTF-8"

ping

On 6 June 2018 at 00:33, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Wednesday, 6 June 2018 1:39:09 AM NZST Nicola Lunghi wrote:
>> From: Nicola Lunghi <nicola.lunghi@jci.com>
>>
>> the mosquitto install populate some .example files in
>> /etc/mosquitto. move thise example files in a separate package
>>
>> The PACKAGE_BEFORE_PN is needed because otherwise those examples
>> end in the base mosquitto package
>>
>> Signed-off-by: Nicola Lunghi <nicola.lunghi@jci.com>
>> ---
>>  .../recipes-connectivity/mosquitto/mosquitto_1.4.15.bb        | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meta-networking/recipes-connectivity/mosquitto/
> mosquitto_1.4.15.bb b/meta-networking/recipes-connectivity/mosquitto/
> mosquitto_1.4.15.bb
>> index c71f1e467f..8dd2124c41 100644
>> --- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
>> +++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
>> @@ -62,6 +62,8 @@ do_install() {
>>
>>  PACKAGES += "libmosquitto1 libmosquittopp1 ${PN}-clients"
>>
>> +PACKAGE_BEFORE_PN = "${PN}-examples"
>> +
>>  FILES_${PN} = "${sbindir}/mosquitto \
>>                 ${bindir}/mosquitto_passwd \
>>                 ${sysconfdir}/mosquitto \
>> @@ -79,6 +81,8 @@ FILES_${PN}-clients = "${bindir}/mosquitto_pub \
>>                         ${bindir}/mosquitto_sub \
>>  "
>>
>> +FILES_${PN}-examples = "${sysconfdir}/mosquitto/*.example"
>> +
>>  SYSTEMD_SERVICE_${PN} = "mosquitto.service"
>>
>>  INITSCRIPT_NAME = "mosquitto"
>>
>
> Both of these look good to me, FWIW
>
> Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>
>

