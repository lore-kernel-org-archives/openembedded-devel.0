Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 93DE371B9E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 01:16:43 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id d40so5101404wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 18:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3hAX1imaGClLcHWccC6mnrDVkermIry/dYdnHmJifpE=;
	b=iyi5ikWbasnoL3t37ZJHxIuw4nqLc1e8mZiVXTiv+mJelwapdhwb4pjdtZVWobKnjd
	KZscLsVcelrPz73hLPxmNnG/igxSD9gKyx3G/hHLbz2mRLoZFD0A32KdUgOHLGsA7Lpt
	Lo7hHJCtbdoYlTllaluCJnuYnK90okfEhNZc91veyl1gpSXBbnk+A9fM0OChRmIfUmWc
	flFXT7jnSi5ICOfh0sOOaiLP7ci5fJ9kf7ODK9T9fc3RMyODIEs3h2dnlPZ1pQJP+NCe
	Mk4F/mJeaZ3l+DOYrMY/CIuXFsjqZBelJc8a/iz+n5azk9QMFIH4U2eqabwoloYzEvvM
	kQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3hAX1imaGClLcHWccC6mnrDVkermIry/dYdnHmJifpE=;
	b=Ch+9X9rYLeymTOlKlHhCgKoTTL6qMc1lhSscqWS4I0PuPnfkJLhEaY73TYSczF9NQL
	ZhbRsrhWp6p/4kJdTakEU8y6qLjBLbJ7TuNxxoh/XzFJMAcaF6ftcCrLUTFz7Ov5zisi
	Cvy2YSTSiVfyQw2c6VgOxuVJuw05vsU+ppRIORfVh5e2tec1SS89fyjp6DPBDUbFD8KZ
	US+i0gGINpjHemNJPYM9KZ6oyq2GXVm8ZCXI8/o7/ybvceJtqOEO6n94RgS7j9hEtCNY
	BXU+vd22kGt5X9d2VFz+W3P2jCy4e2jcOYJ35jIxKI7TG/pBY5n6VuD/k08FAXBfHm8t
	e7Dw==
X-Gm-Message-State: AHYfb5ipnV/TcpzBR2h/36K/JGYu1u7NSppcnM3V/uhMOx/BjswpQPTP
	4DS7gWVL9x/RLrjzwAl9jXBJ3hJoVA==
X-Received: by 10.80.140.253 with SMTP id r58mr6446516edr.123.1502241404375;
	Tue, 08 Aug 2017 18:16:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Tue, 8 Aug 2017 18:16:13 -0700 (PDT)
In-Reply-To: <CACMwXoVeDiA2AGx2+B4YuBbFNp=WigwgQ8i1He4eyWC77-0JyA@mail.gmail.com>
References: <1502153954-2796-1-git-send-email-mickey.happygolucky@gmail.com>
	<1502153954-2796-2-git-send-email-mickey.happygolucky@gmail.com>
	<CAMKF1spheqXiBVN4b1oSLjr_EDkL0dcCSkZss-8K27XeF5Y_Cg@mail.gmail.com>
	<CACMwXoVyzWqadsAsjpghRFT10XfFPYtZmua_T=_fNcE8Rmmt-w@mail.gmail.com>
	<CAMKF1so1wecDyNMU70hNHhco2v69Qb3hOLWfsHfaOkjGtuRPUw@mail.gmail.com>
	<CACMwXoVeDiA2AGx2+B4YuBbFNp=WigwgQ8i1He4eyWC77-0JyA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Aug 2017 18:16:13 -0700
Message-ID: <CAMKF1sqED+uoO3+RnOk9R6JHjT79m_tx+_YBRVXAuaC+_LOqBQ@mail.gmail.com>
To: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/6] anthy: Added libanthy-dev to PROVIDES_class-terget uim: Added libanthy-dev to DEPENDS_class-target
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
X-List-Received-Date: Wed, 09 Aug 2017 01:16:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 8, 2017 at 6:00 PM, Yusuke Mitsuki
<mickey.happygolucky@gmail.com> wrote:
> Hello Khem
>
> Sorry I cannot understand...
>
> Are you saying to allow empty for anthy package?
>

yes whichever recipe is providing libanthy-dev add it there.

> I want to use uim-anthy package in order to input Japanese on the machine.
> I think that it will be a problem if these are empty packages.
>
> I see that the dependency is not accurate.
> anthy recipe seems a bit strange.
> Most of the definitions are in the subpackage.
> It seems that neither anthy-dev nor anthy-dbg has any meaning.
>
> Thanks.
>
>
>
> 2017-08-09 9:40 GMT+09:00 Khem Raj <raj.khem@gmail.com>:
>>
>> On Tue, Aug 8, 2017 at 5:33 PM, Yusuke Mitsuki
>> <mickey.happygolucky@gmail.com> wrote:
>> > Hello Khem
>> >
>> > Are you saying that  libanthy-dev is not need and anthy only is
>> > sufficient?
>> >
>> > anthy is in DEPENDS already. BUT it is not sufficient.
>> > If libanthy-dev is not in DEPENDS_class-target, do_configure will not be
>> > failed.
>>
>> that means the dependency is not accurate. can you add
>>
>> ALLOW_EMPTY_${PN} = "1"
>>
>> to anthy recipe and see if that helps ?
>>
>> >
>> > However config.log say like as follows:
>> >
>> > -----
>> > configure:20054: checking anthy/anthy.h usability
>> > configure:20054: i586-poky-linux-gcc -m32 -march=i586
>> >
>> > --sysroot=/home/y-mitsuki/yocto/build_keyboard/tmp/work/i586-poky-linux/uim/1.8.6-r0/recipe-sysroot
>> > -c  -O2 -pipe -g -feliminate-unused-debug-types
>> >
>> > -fdebug-prefix-map=/home/y-mitsuki/yocto/build_keyboard/tmp/work/i586-poky-linux/uim/1.8.6-r0=/usr/src/debug/uim/1.8.6-r0
>> >
>> > -fdebug-prefix-map=/home/y-mitsuki/yocto/build_keyboard/tmp/work/i586-poky-linux/uim/1.8.6-r0/recipe-sysroot-native=
>> >
>> > -fdebug-prefix-map=/home/y-mitsuki/yocto/build_keyboard/tmp/work/i586-poky-linux/uim/1.8.6-r0/recipe-sysroot=
>> > conftest.c >&5
>> > conftest.c:65:25: fatal error: anthy/anthy.h: No such file or directory
>> > #include <anthy/anthy.h>
>> > -----
>> >
>> > Then uim-anthy is not created.
>> > In order to build uim-anthy, anthy.h is need but it is not installed
>> > into
>> > recipes-sysroot.
>> > anthy.h is incluced libanthy-dev not anthy.
>> >
>> > Therefor I think libanthy-dev is need.
>> >
>> > Let me know you opinions?
>> >
>> > 2017-08-08 12:48 GMT+09:00 Khem Raj <raj.khem@gmail.com>:
>> >>
>> >>
>> >> On Mon, Aug 7, 2017 at 6:00 PM Yusuke Mitsuki
>> >> <mickey.happygolucky@gmail.com> wrote:
>> >>>
>> >>> anthy.h could not found at confiugre of uim.
>> >>> Dependency broke since it began to use recipes-sysroot.
>> >>>
>> >>> Signed-off-by: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
>> >>> ---
>> >>>  meta-oe/recipes-support/anthy/anthy_9100h.bb | 1 +
>> >>>  meta-oe/recipes-support/uim/uim_1.8.6.bb     | 2 +-
>> >>>  2 files changed, 2 insertions(+), 1 deletion(-)
>> >>>
>> >>> diff --git a/meta-oe/recipes-support/anthy/anthy_9100h.bb
>> >>> b/meta-oe/recipes-support/anthy/anthy_9100h.bb
>> >>> index a65d324..c507ad7 100644
>> >>> --- a/meta-oe/recipes-support/anthy/anthy_9100h.bb
>> >>> +++ b/meta-oe/recipes-support/anthy/anthy_9100h.bb
>> >>> @@ -18,6 +18,7 @@ SRC_URI[sha256sum] =
>> >>> "d256f075f018b4a3cb0d165ed6151fda4ba7db1621727e0eb54569b6e2
>> >>>
>> >>>  DEPENDS_class-target = "anthy-native"
>> >>>  RDEPENDS_${PN}_class-target = "libanthy0"
>> >>> +PROVIDES_class-target = "libanthy-dev"
>> >>
>> >>
>> >> This seems redundant
>> >>
>> >>>
>> >>>
>> >>>  inherit autotools pkgconfig
>> >>>
>> >>> diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb
>> >>> b/meta-oe/recipes-support/uim/uim_1.8.6.bb
>> >>> index ed846b9..4cb7b62 100644
>> >>> --- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
>> >>> +++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
>> >>> @@ -14,7 +14,7 @@ SRC_URI[md5sum] = "ecea4c597bab1fd4ba98ea84edcece59"
>> >>>  SRC_URI[sha256sum] =
>> >>> "7b1ea803c73f3478917166f04f67cce6e45ad7ea5ab6df99b948c17eb1cb235f"
>> >>>
>> >>>  DEPENDS = "anthy fontconfig libxft libxt glib-2.0 ncurses intltool"
>> >>> -DEPENDS_class-target += "intltool-native gtk+ gtk+3 uim-native
>> >>> takao-fonts"
>> >>> +DEPENDS_class-target += "intltool-native gtk+ gtk+3 uim-native
>> >>> takao-fonts libanthy-dev"
>> >>
>> >>
>> >> It should say anthy not libanthy-dev
>> >>>
>> >>>
>> >>>  RDEPENDS_uim = "libuim0 libedit"
>> >>>  RDEPENDS_uim-anthy = "takao-fonts anthy libanthy0"
>> >>> --
>> >>> 2.7.4
>> >>>
>> >>> --
>> >>> _______________________________________________
>> >>> Openembedded-devel mailing list
>> >>> Openembedded-devel@lists.openembedded.org
>> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>> >
>
>

