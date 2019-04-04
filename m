Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7D0927D434
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Apr 2019 09:12:25 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id b6so1408241iog.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Apr 2019 02:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=k5a9GY2H+dma1aVwmYULaH1k6SqEVYgw/8MPNhMUGOM=;
	b=J+8KCTuUChw+KKlb3O2rHnjpUpRvigGM0tBKnlcaXYLxrWLqu6QoIHZ/YMsJ5KKmEk
	W+2cFC7LUW5enkUSSuW7hVmg7Kx3KrzwFb5dAjXsCqMIvLh7deu5WHoXaMli5jSSXs3w
	wqAbeOxl5WkJr0SmoOzKelgGJiJQz6h7YUHwt8Xkb+jcKpftUngCG4RcYz4cOuyuQ2Yc
	+QyddFyEEYc8SoHY7HFZC/W4w+fhawO5suWt69EJc4SFV3mI4O4VeoeqVVuvKxrmxG3s
	VrXwsdUNqRBL2xYgFGXxdPKBSP4QaWUy+OqSyujcFc7AGCOdQ4HOIDczNnZtTqAHJm3t
	KY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=k5a9GY2H+dma1aVwmYULaH1k6SqEVYgw/8MPNhMUGOM=;
	b=cVh44KHQO6XiSZcSf9oGTBReKyzSFi82B6SOTrX6vBRHTnkFyCTxYcK0o6tOvV3sGh
	gyXsze34bFdCbZf4CqnZS832FiFM4RcUswAnQgBEqGa2JQqkR0zp67HUwb6doT+wQf2G
	gW3dnb+fiHSRTnsVHtyZUaGvYoZcQvgpilg3m0OaxhqVEOrWikXRFTlI6hSazfa5IMFT
	vUcPGovIvjtBoVRaVsH30xWOnW8mHdsfBK19v0XmhXbRUMaaMuxobMRENcA7+ib1dM8k
	Q8+6RazR6W7yJoySP5IYu6be2azAtNu5tpLhO6MqiVsr8ToV6XO+SF/jNbWU/P3l3JcS
	R0gg==
X-Gm-Message-State: APjAAAWbEFiuy6N86oUi8bsaG6l9oQuOLXXebHpnttU5/Eb/WT9dio9+
	RpnjndTEMq0hVrBszVISFc7Akfdr3P+Qe5hYcZc=
X-Google-Smtp-Source: APXvYqz/IYqn/afzY0tzLa5XWLVNVBPOp5wI6N9DUR/CMn0InSpNsogqjuy+/84it/U+B0aFQ+NZrCK2AtVZz6e2yOs=
X-Received: by 2002:a5d:8597:: with SMTP id f23mr3409342ioj.148.1554369146264; 
	Thu, 04 Apr 2019 02:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <1554280123-19112-1-git-send-email-vincent.prince.fr@gmail.com>
	<1554280123-19112-2-git-send-email-vincent.prince.fr@gmail.com>
	<CAMKF1so1Y08xAu8Xk_4X388kc-W3nVbRcdy+qt6GQo0h1LN=VQ@mail.gmail.com>
	<CAB2nKc9Mr7yTn=U_HNrKU1V5_nBM8AMjA2dpe3JOjrkJ83-d5Q@mail.gmail.com>
In-Reply-To: <CAB2nKc9Mr7yTn=U_HNrKU1V5_nBM8AMjA2dpe3JOjrkJ83-d5Q@mail.gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Thu, 4 Apr 2019 11:12:14 +0200
Message-ID: <CAB2nKc-H-8KDVc1ycGBXgCMQs6H9R5neoBt8_GNq-Sk=dfukXQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/3] cppzmq: bump version 4.2.3 => 4.3.1
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
X-List-Received-Date: Thu, 04 Apr 2019 09:12:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I just look at cppzmq, and version is only 4.3.0 and not 4.3.1, my mistake.

By the way, 4.3.0 version uses googletest for tests and I disabled it
because cmake fetcher hangs,
Moreover, master version uses another test framework (catch), so it will be
quite some work to add googletest support then remove it for next version.

Khem, do you think I can keep EXTRA_OECMAKE =3D "-DCPPZMQ_BUILD_TESTS=3DOFF=
"
for now with this explanation in commit log?
Will send v3 after your decision,

Thanks,
Vincent


Le mer. 3 avr. 2019 =C3=A0 21:33, Vincent Prince <vincent.prince.fr@gmail.c=
om> a
=C3=A9crit :

> Hi Khem,
>
> To be honest I disabled it because I don't have much time to add ptest
> stuff and I had a failure with it.
> I'll try to rework that part and at least put it in a packageconfig knob
> as suggested.
>
> Thanks for review,
> Vincent
>
> Le mer. 3 avr. 2019 =C3=A0 18:52, Khem Raj <raj.khem@gmail.com> a =C3=A9c=
rit :
>
>> On Wed, Apr 3, 2019 at 1:30 AM Vincent Prince
>> <vincent.prince.fr@gmail.com> wrote:
>> >
>> > Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
>> > ---
>> >  meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 6 ++++--
>> >  1 file changed, 4 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
>> b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
>> > index 9aff59c..2f99417 100644
>> > --- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
>> > +++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
>> > @@ -4,8 +4,8 @@ LICENSE =3D "MIT"
>> >  LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3Ddb174eaf7b55a34a7c89551197f66e94"
>> >  DEPENDS =3D "zeromq"
>> >
>> > -SRCREV =3D "6aa3ab686e916cb0e62df7fa7d12e0b13ae9fae6"
>> > -PV =3D "4.2.3+git${SRCPV}"
>> > +SRCREV =3D "213da0b04ae3b4d846c9abc46bab87f86bfb9cf4"
>> > +PV =3D "4.3.1+git${SRCPV}"
>> >
>> >  SRC_URI =3D "git://github.com/zeromq/cppzmq.git"
>> >
>> > @@ -13,6 +13,8 @@ S =3D "${WORKDIR}/git"
>> >
>> >  inherit cmake
>> >
>> > +EXTRA_OECMAKE =3D "-DCPPZMQ_BUILD_TESTS=3DOFF"
>> > +
>>
>> explaining why tests are disabled would be helpful for future changes
>> where someone might
>> want to enable it and if its an optimization then turn it into
>> packageconfig knob.
>>
>> >  PACKAGES =3D "${PN}-dev"
>> >
>> >  RDEPENDS_${PN}-dev =3D "zeromq-dev"
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

