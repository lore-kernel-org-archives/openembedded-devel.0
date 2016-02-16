Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id A496F6FF73
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2016 08:12:18 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id hb3so67883206igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2016 00:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=3z3VAHPIq+tQN6Rj+y0yhYCP1EHmPD+spKiwraGQnSA=;
	b=G12kJVbAV5FmZIyPFhdTiarJ153wo5MF8w8jDKb1F/7wQl4KlXR0azZiR06RXne+qu
	oaSE0yIKJuwxYqs9M607ZWteTWIXgbFqv+W0Oz9Nsq7i2kLLzzpJgAY/P2aJFF5VaaD/
	dF0zsMXQu+ZOsDlXVW3EjTH2JEwXIUyg/i5pzkIuWdVKuQjEzyQgC6F4iJOQhtwMXPZ3
	y6gHpqMcekJ5tPuYti0CozhaDAfbr2wPn5NOrS8jB9UXub6H7c6m5ucq7j+2sG6CJX8L
	tFYrC17+A0qgI+F0MBEO0u+Gbd9QUnjXn6OQOgRo6EJqbkmdQ6Hqnng/nSOKQxyE7Iqf
	Hz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=3z3VAHPIq+tQN6Rj+y0yhYCP1EHmPD+spKiwraGQnSA=;
	b=DdyuDcFigWtjXCwZreYm0aOtGS29d013jSWzSGLo8gejP0Bw0bDLP91plpRvF8r776
	O3we1Tku2Oq4i7U6GowN1At8ruLBA1oKkuL393pK8LbqhFxbPtzC9OLsoQzUxtm2bpc0
	lQ+KedkNkIngktW+OapJI7U694zTNy3gokDzRpb+AJsm3CblD1tiCBEhjgZ6Stx9wzNU
	5TntOQOpK1Az+MrxTcVkD8dWyGNGLweabxde0odsLpGuQP6PeOuTN306QtcKWgYa1IXq
	uYmD0PGqPo8S7q78aOju6ymEevb7YBl/jd0HuhFgwewMcMqdjKL9B02/2ROCBh1UjF1g
	9CQg==
X-Gm-Message-State: AG10YOT+12Rh+44DQi5X5FLn5z7bdlphbvBVwQw457dSvNoJwPmum9cij84Vymhx7nvKtqAf9388hpez4IBmyg==
MIME-Version: 1.0
X-Received: by 10.50.111.111 with SMTP id ih15mr17361226igb.78.1455610339058; 
	Tue, 16 Feb 2016 00:12:19 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Tue, 16 Feb 2016 00:12:18 -0800 (PST)
In-Reply-To: <CAMKF1sqE819tcXWRrQ8mkWMFVKe2fK+dN6F42xQbGrNW7oyMCQ@mail.gmail.com>
References: <1455571071-10666-1-git-send-email-schnitzeltony@googlemail.com>
	<1455571071-10666-3-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1sqE819tcXWRrQ8mkWMFVKe2fK+dN6F42xQbGrNW7oyMCQ@mail.gmail.com>
Date: Tue, 16 Feb 2016 09:12:18 +0100
Message-ID: <CALbNGRTtq_217Ab9SdoiKWDVY+0rEsCyvmdo6nw56dQ-KZBP4w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/4] libsdl2-ttf: update to 2.0.14
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
X-List-Received-Date: Tue, 16 Feb 2016 08:12:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 16, 2016 at 12:55 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Feb 15, 2016 at 1:17 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> Licence checksum was changed by change of copyright year.
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  .../{libsdl2-ttf_2.0.12.bb =3D> libsdl2-ttf_2.0.14.bb}           | 10 +=
++-------
>>  1 file changed, 3 insertions(+), 7 deletions(-)
>>  rename meta-oe/recipes-support/libsdl-ttf/{libsdl2-ttf_2.0.12.bb =3D> l=
ibsdl2-ttf_2.0.14.bb} (66%)
>>
>> diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.12.bb b/=
meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb
>> similarity index 66%
>> rename from meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.12.bb
>> rename to meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb
>> index 47ce115..af5a55c 100644
>> --- a/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.12.bb
>> +++ b/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb
>> @@ -2,20 +2,19 @@ SUMMARY =3D "Simple DirectMedia Layer truetype font li=
brary"
>>  SECTION =3D "libs"
>>  DEPENDS =3D "virtual/libsdl2 freetype"
>>  LICENSE =3D "Zlib"
>> -LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3Dcdd16c6436d6b8fcbdd22a54=
d68c6dd3"
>> +LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3Dcb33e7c4df9fbde389f149ad=
6bc93ce5"
>>
>>  SRC_URI =3D " \
>>      http://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-${PV}.tar.g=
z \
>>      file://use.pkg-config.for.freetype2.patch \
>>  "
>> +SRC_URI[md5sum] =3D "e53c05e1e7f1382c316afd6c763388b1"
>> +SRC_URI[sha256sum] =3D "34db5e20bcf64e7071fe9ae25acaa7d72bdc4f11ab3ce59=
acc768ab62fe39276"
>>
>>  S =3D "${WORKDIR}/SDL2_ttf-${PV}"
>> -#EXTRA_OECONF +=3D "SDL_CONFIG=3D${STAGING_BINDIR_CROSS}/sdl-config "
>>
>>  inherit autotools
>>
>> -TARGET_CC_ARCH +=3D "${LDFLAGS}"
>> -
>
> why is this removed ?
>
It is not necessary anymore - builds fine without it

Andreas

