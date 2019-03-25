Return-Path: <brgl@bgdev.pl>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2D6E07D092
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2019 14:27:45 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id v4so7785401ioj.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2019 07:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yxqh0W+7cugJtGTWiIte3B+yVtErrBkQ0Oq4oY6nbWQ=;
	b=QlJ15ey1a84RDjNmLYa2Bfa9WhSRM6q+yohow9S2/Kp3vhCLBm55FX3A2jyqOqRg2D
	tJO6ERRX7ywVoxOlx++qXUGg+TgjwjHJHn05VLsR2swuUW0koUgJZVKtVKjCmk7Qc4ib
	yBa6sHFPB9d3ZiE31bgFE6eO6jOtcR31YoYJR9D8Zsw/i9wzv1D63Vnozai3MBygHFSS
	2T4SYrbPxhf2iFz2PTMpeKj6cWIxHTnNOEFrZ3tY9bhSOPUKFrmMTu1ZL2cLfpvu2EOA
	G203/20TvHsDCz5mWfiAznHqNdYorRG+0me+XCmDHk3ASMaNQtAMmsNK58Xfa1C4jtXN
	g/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yxqh0W+7cugJtGTWiIte3B+yVtErrBkQ0Oq4oY6nbWQ=;
	b=pgJPGo10roGF9pRfkPaD+GbJUuW2QTJiGt4e6+UbC7I+XxhYv7pYQsoNzecnNnTyvR
	G4t+QLGEHGQ/s7c1ww68A7yb5yGYGf/is4QI51JCTzi71Pw+9H3LGEF1nMMOAotICkHV
	dRFmapEdutC5wt3APS0BUjBGRNxE5FsC9pdhenHjWNIbLYtgjV1z0wux96OVnyHmQ5BD
	Y8UrgeCAtHedSMoPxKnXvy41T1BxgLCIX920FqaMrSjVaR31Q5S4hDvH+dX72MUUmleg
	dp4IYBir8H63BRVidalmL4O83tkZEqKSDy+AvU/R9UnSExsFbipmtlWzdK+uCiMC/V7A
	qpyA==
X-Gm-Message-State: APjAAAV3rwD2f0ylvNrWvd7MHsnrc+cdlgKO2VWy3vjwVFNqjTUftl3W
	MjITqxJOmQaYe94PEtLP5BIvBc8ch1IPaV+Fucuung==
X-Google-Smtp-Source: APXvYqyEWY2RELXczyV5GGeOS3dyEGKQhCB7WXGSJI0RQGzQO/KVcQX4QWFBgw1cW2IK049/cE01QNe/Y4ptpFOSQOo=
X-Received: by 2002:a5d:91d3:: with SMTP id k19mr17253964ior.258.1553524066090;
	Mon, 25 Mar 2019 07:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190325140526.12797-1-brgl@bgdev.pl>
	<CAMKF1srKu+wFUc+PeAAiZidGBjA_5qR0VUZuK8dW2FXL5xt4PA@mail.gmail.com>
In-Reply-To: <CAMKF1srKu+wFUc+PeAAiZidGBjA_5qR0VUZuK8dW2FXL5xt4PA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Mar 2019 15:27:35 +0100
Message-ID: <CAMRc=Mdwc_7eWtJ55cGAZ32TmZ5XWrfqabEM25cCCcoqBp9-yw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libgpiod: bump version to v1.3
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
X-List-Received-Date: Mon, 25 Mar 2019 14:27:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 25 mar 2019 o 15:19 Khem Raj <raj.khem@gmail.com> napisa=C5=82(a):
>
>
>
> On Mon, Mar 25, 2019 at 7:05 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
>>
>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> There are several new features in this release. The one that impacts
>> the recipe is the option to install the test executable to bindir using
>> the new options (--enable-install-tests). This requires separate
>> PACKAGECONFIG entries for 0.x and 1.x series.
>
>
> Perhaps it will be good to enable this feature automatically when ptest i=
s enabled via distro features
>>

Sure, how about a separate patch I'll send later this week?

Bart

>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
>>  meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb           | 2 ++
>>  .../libgpiod/{libgpiod_1.2.1.bb =3D> libgpiod_1.3.bb}          | 5 +++-=
-
>>  2 files changed, 5 insertions(+), 2 deletions(-)
>>  rename meta-oe/recipes-support/libgpiod/{libgpiod_1.2.1.bb =3D> libgpio=
d_1.3.bb} (67%)
>>
>> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb b/meta-o=
e/recipes-support/libgpiod/libgpiod_0.3.3.bb
>> index 09fb65a08..96615ebf2 100644
>> --- a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
>> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
>> @@ -1,4 +1,6 @@
>>  require libgpiod.inc
>>
>> +PACKAGECONFIG[tests] =3D "--enable-tests,--disable-tests,kmod udev"
>> +
>>  SRC_URI[md5sum] =3D "2aa1e1a80c3c919ae142ab9a55fb59ca"
>>  SRC_URI[sha256sum] =3D "b773e557af1a497f786825462a776b7bf90168e67ee0a5b=
c5d2473a5674dc38c"
>> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.2.1.bb b/meta-o=
e/recipes-support/libgpiod/libgpiod_1.3.bb
>> similarity index 67%
>> rename from meta-oe/recipes-support/libgpiod/libgpiod_1.2.1.bb
>> rename to meta-oe/recipes-support/libgpiod/libgpiod_1.3.bb
>> index d7fd55d79..e513a33bd 100644
>> --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.2.1.bb
>> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.3.bb
>> @@ -2,10 +2,11 @@ require libgpiod.inc
>>
>>  DEPENDS +=3D "autoconf-archive-native"
>>
>> -SRC_URI[md5sum] =3D "e6c222512a0d1994a069ebfd2e0a56fd"
>> -SRC_URI[sha256sum] =3D "736d8b511ad247c2acb01b592f2bbe5e757e14e1d8347b2=
d80683081ab4b31b8"
>> +SRC_URI[md5sum] =3D "9f7530a5d56f070ba0af78d6ba077973"
>> +SRC_URI[sha256sum] =3D "6ec837f23e8f2196e5976dec4ac81403170830075e7f33e=
de1394eaf67f2e962"
>>
>>  PACKAGECONFIG[cxx] =3D "--enable-bindings-cxx,--disable-bindings-cxx"
>> +PACKAGECONFIG[tests] =3D "--enable-tests --enable-install-tests,--disab=
le-tests --disable-install-tests,kmod udev"
>>
>>  PACKAGECONFIG[python3] =3D "--enable-bindings-python,--disable-bindings=
-python,python3"
>>  inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native=
', '', d)}
>> --
>> 2.20.1
>>

