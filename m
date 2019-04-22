Return-Path: <daniel.diaz@linaro.org>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id EB34E6D409
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2019 20:38:12 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id f18so11403527lja.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2019 13:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=JpZNNJLKdIpgLz13DkOCwrEtx97Lgw95w4w1gnuF4yk=;
	b=z8IT2rz/BAMN64SBqiY5YP/SkJMJB6gYULd/ZJy86wEupOINKFz6Z4dVZwwTfU9gkM
	iPMM3ypKs4mXWtRbz8pG6QB0KTepbRfr/pAYnsSITDTTsfI05qZPJB5mGrcIyt3bVgzh
	2rAtUwB7hgL3Sws3Cn0Sil5tfAtdN/iL/HJjsRn3qmGfoPdpApeCnkO90pIf6dur+9Wb
	d5NjCYg6g39y8zkezBemhaSzitulWStE/eqjfcs5/2Zrh1fBPxYYWWzazHndmfl+rqYP
	eKzkRvPqQiwanCc6YCGaQ64/WZ2hRsTaQ+fADZ8MWPJrY7oWOxzxGxpK9qWFIplUdA2+
	KEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=JpZNNJLKdIpgLz13DkOCwrEtx97Lgw95w4w1gnuF4yk=;
	b=Qp0Y0GxIBCt+x3RfgkYXvjVARFDdYmQj16p69fjBVEWo5qwFOR4oxseOzw9ZgrC8jp
	OIcXNTRlkikjI3YoxzPqLCq82bWCI0Bc/QMB6SskQD9Pd8IpPG5HWQvpkpFNd4ShMIHd
	nYSwRVMtGau/hCn8OWtjbvpPmGNvBGNaYbV3JTyQQe260uah+QKQI7bxJi9cw/SrAcOp
	czJmf6I/1Lg+BSNWido/WaXowJWgnuD/8AP9guj++Usdc7dr81dsga6PoxgBPHhaA8yh
	HuCEKcb8EUsL280fUPoexrsYi7k/Mgtieb1nSYUMUue+fJ166hCKvKuSuxhj7rj393v8
	B0mw==
X-Gm-Message-State: APjAAAXOlx1AWQTph67t0ss4mODY1HEH5oVm/iZL91PHFjZDnGnJCBtj
	jgNo9iQH3FOZFkHNvw5Wj+NbFCnuUDFZZe0s3aQXjg==
X-Google-Smtp-Source: APXvYqx61z0hlc/7u87q5TCGRYScOMYDt9DsuuXMgw7HmQNGvU8NR8mxgS+ksZ9mJtFKO4fgzowSNMwPISYZ7R82Ljk=
X-Received: by 2002:a2e:864f:: with SMTP id i15mr10245404ljj.99.1555965493388; 
	Mon, 22 Apr 2019 13:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190422200845.14343-1-daniel.diaz@linaro.org>
	<CA+chaQcLbYYHTkiU78CkS7t5kRNnPhsk2WsvfD28VVBBjdcidQ@mail.gmail.com>
In-Reply-To: <CA+chaQcLbYYHTkiU78CkS7t5kRNnPhsk2WsvfD28VVBBjdcidQ@mail.gmail.com>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date: Mon, 22 Apr 2019 15:38:01 -0500
Message-ID: <CAEUSe78nNar8VW8h0jsBfbY7kegOojHR8RPtwtmz-cbkP1MKxw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cpupower: update license file checksum
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
X-List-Received-Date: Mon, 22 Apr 2019 20:38:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

On Mon, 22 Apr 2019 at 15:15, Martin Jansa <martin.jansa@gmail.com> wrote:
> NAK
>
> This completely defeats the purpose of LIC_FILES_CHKSUM.
> If the COPYING file vary across releases than LIC_FILES_CHKSUM should be =
updated when needed while verifying that the LICENSE value is still correct=
.
> If you use COMMON_LICENSE_DIR and completely ignore the license in the so=
urce, then it won't ever warn the user that the license was changed while u=
pgrading to newer release.

I understand the sentiment and agree to the principle. Besides,
licensing of the kernel source code does not change too often -- Last
change in the kernel was over a year ago, and it was not relicensed,
just reshuffled.

This does, however, blocks us from switching kernels or building
different versions with the same OE baseline. Our [1] main targets are
Linux LTS's: 4.4, 4.9, 4.14, 4.19, and (currently) 5.0; we also build
Linux mainline and Linux next. For automated bisections or for a
kernel developer tree, we have to rely on the given kernel source
code, which might contain any license that cpupower has had in the
past. We know for sure that _that_ is GPL-2, but we can't adjust the
checksum on the fly.

We're fine carrying this patch in our trees, as we can burden
ourselves with looking at licensing of the kernel, but because this
was so promptly NAKed, I also very much would like to hear feedback on
how to deal with such limitation in a way that could be acceptable in
meta-oe.

Thanks and greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org


[1] https://lkft.linaro.org/about/


> On Mon, Apr 22, 2019 at 10:09 PM Daniel D=C3=ADaz <daniel.diaz@linaro.org=
> wrote:
>>
>> The Linux kernel is GPLv2, at least as far cpupower is
>> concerned. Because this recipe reuses the kernel code, and
>> said source code can (does) vary across different releases,
>> it's best to refer to license by its name.
>>
>> Use GPL-2.0 from OE common license dir.
>>
>> Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
>> ---
>>  meta-oe/recipes-kernel/cpupower/cpupower.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-kernel/cpupower/cpupower.bb b/meta-oe/recip=
es-kernel/cpupower/cpupower.bb
>> index 928973871..c7ea087a5 100644
>> --- a/meta-oe/recipes-kernel/cpupower/cpupower.bb
>> +++ b/meta-oe/recipes-kernel/cpupower/cpupower.bb
>> @@ -2,7 +2,7 @@ SUMMARY =3D "Shows and sets processor power related valu=
es"
>>  DESCRIPTION =3D "cpupower is a collection of tools to examine and tune =
power \
>>  saving related features of your processor."
>>  LICENSE =3D "GPLv2"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b=
8814"
>> +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=3D801f80=
980d171dd6425610833a22dbe6"
>>  DEPENDS =3D "pciutils gettext-native"
>>  PROVIDES =3D "virtual/cpupower"
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

