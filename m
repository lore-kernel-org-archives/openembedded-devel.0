Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 499447D71A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 07:16:50 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id r30so1708953lfn.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2019 00:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=BbYlZlWCRDTObbJ12RMvEFhE7/tBSNjWmVz8wnJT9tY=;
	b=QiFcftEti32F1Bv5Q6yU3BKU0JoyffsXQplzeDN06YNpOUDSrd7Iqo8uldtQ3hCesO
	qOgvw1/lZDo7zrXNSN6CLC4TsR3zmvJAZVqVWgGt3OVMSRTD4pQR8pbEODCNowaZAryn
	kvNgzvNi58Lg+aLX3wqWoORIut9kIz9cSVrfPBREmw8dq29hzS79xYrSCNsnwt8jk8iw
	7OHrGL9dfPppbTg6ne+cDMLKcVXDyT8e5gne4xoXUimXMZlLwaioip7/iKR5P9hT8qDc
	8j0igu8L9VvK0MAgyx7jmnC9HjYYos4cYGeuQDGaH0V6mlGKBlUFCAfDZnLq3kCA9FL/
	lOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=BbYlZlWCRDTObbJ12RMvEFhE7/tBSNjWmVz8wnJT9tY=;
	b=l/UtX1JWURnsdQ5AnG8LQ43Ir5A76c6RDnxNrOjcaTWmKYXoo62JVF9byZ9zjYJBa4
	Ik9TvAI9+GotfYIGrBwlUOgA1PVg4zib0WxroH3cD10IGk7yxmz/UkLkzaTkxexIAlxt
	BWiZRO943akdqtEA76l+b3V57kt2ac3bQzukcSNyDVQGgXh1OzKBy3JrskZ9nYNKGn64
	uwsxdm+2KY2OGwZ0UJbGjzYwQiCkBI1RseOZeHbU2fJUz2C4cO0bPTxTx2L17WNMFJOM
	sHD8VqgVoAYj6nV+YBkzhHBtbPzOqB5rezgN9Vjh+LrUINH8gKOechYEKnvg9T5z8tL9
	cKAA==
X-Gm-Message-State: APjAAAV20f5e/dMPzuekYTLIYD8LAqR6qgwuD8imCfXelotq43dksYFl
	o0WU70kbnvaM6wrb61uAwcarodBhP/wQv8hTsVyYsA==
X-Google-Smtp-Source: APXvYqzyVJmpWsHKSGw7G94GZuxy+KwDU8I9LVjJB5bj1UWVKL6ev9kEKUGgYw64HjlNpy++vsDsMIcaQharcyXyxk8=
X-Received: by 2002:ac2:5609:: with SMTP id v9mr19080907lfd.159.1556695010676; 
	Wed, 01 May 2019 00:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190422200845.14343-1-daniel.diaz@linaro.org>
	<CA+chaQcLbYYHTkiU78CkS7t5kRNnPhsk2WsvfD28VVBBjdcidQ@mail.gmail.com>
	<CAEUSe78nNar8VW8h0jsBfbY7kegOojHR8RPtwtmz-cbkP1MKxw@mail.gmail.com>
In-Reply-To: <CAEUSe78nNar8VW8h0jsBfbY7kegOojHR8RPtwtmz-cbkP1MKxw@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 1 May 2019 09:16:39 +0200
Message-ID: <CAP71WjxL1DCroZwksKemoFh_kKKdhvbVt7U3XJWOo_SiHjYqYg@mail.gmail.com>
To: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
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
X-List-Received-Date: Wed, 01 May 2019 07:16:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hey,

On Mon, Apr 22, 2019 at 10:38 PM Daniel D=C3=ADaz <daniel.diaz@linaro.org> =
wrote:
>
> Hello!
>
> On Mon, 22 Apr 2019 at 15:15, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> > NAK
> >
> > This completely defeats the purpose of LIC_FILES_CHKSUM.
> > If the COPYING file vary across releases than LIC_FILES_CHKSUM should b=
e updated when needed while verifying that the LICENSE value is still corre=
ct.
> > If you use COMMON_LICENSE_DIR and completely ignore the license in the =
source, then it won't ever warn the user that the license was changed while=
 upgrading to newer release.

I hit this issue today as well.. so looked into it..

>
>
> I understand the sentiment and agree to the principle. Besides,
> licensing of the kernel source code does not change too often -- Last
> change in the kernel was over a year ago, and it was not relicensed,
> just reshuffled.
>
> This does, however, blocks us from switching kernels or building
> different versions with the same OE baseline. Our [1] main targets are
> Linux LTS's: 4.4, 4.9, 4.14, 4.19, and (currently) 5.0; we also build
> Linux mainline and Linux next. For automated bisections or for a
> kernel developer tree, we have to rely on the given kernel source
> code, which might contain any license that cpupower has had in the
> past. We know for sure that _that_ is GPL-2, but we can't adjust the
> checksum on the fly.
>
> We're fine carrying this patch in our trees, as we can burden
> ourselves with looking at licensing of the kernel, but because this
> was so promptly NAKed, I also very much would like to hear feedback on
> how to deal with such limitation in a way that could be acceptable in
> meta-oe.

cpupower is a 'special' recipe since it does "inherit kernelsrc" ,
which essentially means that it doesn't have its own sources, but
reuse the kernel source tree, from virtual/kernel recipe. As such,
checking the license file in cpupower recipe does not seem relevant,
since it does not fetch anything (kernelsrc has "deltask do_fetch")
and the fetching is deferred to the virtual/kernel recipe.

so we are basically checking the COPYING file twice. If there was any
license issue, it would have been caught by virtual/kernel recipe
already.

so the proposed patch doesn't seem too bad.. in fact, we might even
want to do that directly in kernelsrc.bbclass.

well, in fact.. i now just checked at other recipes that uses
kernelsrc and found that:
* meta/recipes-kernel/perf/perf.bb: does not set LIC_FILES_CHKSUMS,
and it works fine...
* meta-oe/recipes-kernel/bpftool/bpftool.bb: it has this:
LIC_FILES_CHKSUM =3D
"file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=3D801f80980d171dd6425610833a22dbe=
6"

Since we remove do_fetch task explicitly , i think that removing
LIC_FILES_CHKSUMS (like in perf.bb) should be the best approach.  I
tried to build cpupower without LIC_FILES_CHKSUMS and it worked..

>
> Thanks and greetings!
>
> Daniel D=C3=ADaz
> daniel.diaz@linaro.org
>
>
> [1] https://lkft.linaro.org/about/
>
>
> > On Mon, Apr 22, 2019 at 10:09 PM Daniel D=C3=ADaz <daniel.diaz@linaro.o=
rg> wrote:
> >>
> >> The Linux kernel is GPLv2, at least as far cpupower is
> >> concerned. Because this recipe reuses the kernel code, and
> >> said source code can (does) vary across different releases,
> >> it's best to refer to license by its name.
> >>
> >> Use GPL-2.0 from OE common license dir.
> >>
> >> Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
> >> ---
> >>  meta-oe/recipes-kernel/cpupower/cpupower.bb | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta-oe/recipes-kernel/cpupower/cpupower.bb b/meta-oe/rec=
ipes-kernel/cpupower/cpupower.bb
> >> index 928973871..c7ea087a5 100644
> >> --- a/meta-oe/recipes-kernel/cpupower/cpupower.bb
> >> +++ b/meta-oe/recipes-kernel/cpupower/cpupower.bb
> >> @@ -2,7 +2,7 @@ SUMMARY =3D "Shows and sets processor power related va=
lues"
> >>  DESCRIPTION =3D "cpupower is a collection of tools to examine and tun=
e power \
> >>  saving related features of your processor."
> >>  LICENSE =3D "GPLv2"
> >> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c=
6b8814"
> >> +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=3D801f=
80980d171dd6425610833a22dbe6"
> >>  DEPENDS =3D "pciutils gettext-native"
> >>  PROVIDES =3D "virtual/cpupower"
> >>
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

