Return-Path: <brgl@bgdev.pl>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id BB8C574A35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 08:04:00 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id 72-v6so7433487itw.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 01:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8GEgiWAKf77mIBy41464ae0H3Oruj0xob2zyP4jCL7U=;
	b=QmYu32QyTf41dizRB+hjP15zsM0ug3wXeVoq6vlzcpGVsI2RDik9a+zhjvkvTGL1/n
	vMH51ibgBeWvc3nWP2V691K9xn4KxdHMqCnUPQy/VB8pfr9zBqDIM3dmDbH6IQV4LUSZ
	nHQ3HtG3p7pvuWf8KsE5SpIX9bQoviAwOsHETuLhmO6ll+lM53US7lz1Y9QBHxYQbzst
	OB5gK9iWUa1NtU0J2PvCjFhpBdU79xaMo7N+fbj3mrAbnm0FNZelIzDr487KHqSlR3+I
	prJkjT1N0DoP0bLpbDtgBlcP6w59NQRtmoiKkTEW4Yf1k2qclpCXCroZDofVbn+fORDY
	TsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8GEgiWAKf77mIBy41464ae0H3Oruj0xob2zyP4jCL7U=;
	b=JKyU/Wtk2qV+M3BOKkPBTJWKZczcrhygjbDhV88iLuZTVYRU8uEnh1gpXdbL5P4I/3
	GXBilU8FaC5xciC0/EauLiJa8RQTnBtPXSi0+GQ3V2AUZ1g+xClyN7VYKuFIdB1j5OV0
	q9dLqwnOsKc7589l7jmKIeeYZWE6Fl6zsrWepSrrkHvKPAlpAYydcUYZgW9q0jtvpGqA
	DI23d0bRXh82ocLih52C8BDvIwv3oiJRNN8JmcOu7qbGBOjr/Im+rY016vrM1/WX+KXp
	Lo6Cj8WDDp9lWv9hx7bfymzTYowpcP4UKJoGDPUbGlC7EgdiSNHEcjMKn7gwmUFu1XVe
	8pnQ==
X-Gm-Message-State: AOUpUlFtW6jbZ3PAghYn+qyz/K8SDH0QOYL7ZnGo35BKq84ojT6ICXLj
	0izmgprbWcV0nNKlN4o5mUSOvhAJXOpl9ISZRPNnUg==
X-Google-Smtp-Source: AAOMgpdKrA/hK+lZmMIAGCpTmOf+0ptHEld0s1il91UCfWa+jD3YiCCeRyZIswwnj7bWYtYJUqwVUD/ZuTeSAnPtOFI=
X-Received: by 2002:a24:d80a:: with SMTP id
	b10-v6mr5315391itg.141.1532505841837; 
	Wed, 25 Jul 2018 01:04:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5e:9402:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 01:04:01
	-0700 (PDT)
In-Reply-To: <CAMKF1sra8-e7r14QcRtkfL0ysiurQKuwJV+WS3F8+8f7WR2FSA@mail.gmail.com>
References: <20180724150101.12609-1-brgl@bgdev.pl>
	<CAMKF1sra8-e7r14QcRtkfL0ysiurQKuwJV+WS3F8+8f7WR2FSA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jul 2018 10:04:01 +0200
Message-ID: <CAMRc=Mcf6_NJEQwMtjgDJ2NGOmSjB1M2udHVDb1yKfL22ajjcg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] libgpiod: bump version to v1.1.1
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
X-List-Received-Date: Wed, 25 Jul 2018 08:04:00 -0000
Content-Type: text/plain; charset="UTF-8"

2018-07-24 17:41 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
> On Tue, Jul 24, 2018 at 8:01 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>
>> This is a bug-fix release that fixes a couple memory leaks and bugs in
>> python bindings discovered in the v1.1 release.
>>
>
> the subject of message is misleading,  we have filters and the message
> can get lost, I have staged this
>

Sorry for that. I assume no need to resend then?

Bart

>> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>> ---
>>  .../libgpiod/{libgpiod_1.1.bb => libgpiod_1.1.1.bb}           | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta-oe/recipes-support/libgpiod/{libgpiod_1.1.bb => libgpiod_1.1.1.bb} (78%)
>>
>> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.1.1.bb
>> similarity index 78%
>> rename from meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb
>> rename to meta-oe/recipes-support/libgpiod/libgpiod_1.1.1.bb
>> index ab0bc980d..9d3d759fe 100644
>> --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb
>> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.1.1.bb
>> @@ -2,8 +2,8 @@ require libgpiod.inc
>>
>>  DEPENDS += "autoconf-archive-native"
>>
>> -SRC_URI[md5sum] = "80237a047a9d653a14c5d71e5ce9d641"
>> -SRC_URI[sha256sum] = "9758466468a7ef3f5e30c182c1303abef6241e665cda4d82a64328a7474838c1"
>> +SRC_URI[md5sum] = "e5e946cb01a35e5046a1a7a108d6a96d"
>> +SRC_URI[sha256sum] = "172fa1544ecb51f37533b3e67862298d50c0a5cc84975f3c0706dc15467f0dfd"
>>
>>  PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

