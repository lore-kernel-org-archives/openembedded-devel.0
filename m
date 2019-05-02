Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 185AA7D743
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 May 2019 21:11:25 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id c35so4428421qtk.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 May 2019 14:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=M2cPJ4+sbNXYNmlfNx7ruR/sZxCW0LhS42yyMPi3fiE=;
	b=XMXyoTzBGt+uXExKlN7HnWN4xJsFel+jeMcymv2SMSmxbm05gcYyG2zC/ynJNBst7Q
	dKL09T5KCuA1vCe9aDZbL7+/hxspDF2NMQ0bfyhad9VuvGAyMLewsedF/Cpwk3fRqgY0
	zvLhWGiPhj2jTP5vzLHgVFdmP5DIbunciLp+3nwzKRPxes+wcSr/GVJ1fp/Vdo9iOy00
	jr6Soz1e+3i2RNwnfmScT/H12zw/WBO8JRvwh33RXwhqa8UWRkW9FfSyX+wNWVdCUOxo
	pd9DSm14N/OTotnm0Dv2a7Ck8ORqhzX70XjZFHOs/KQmzKkDWA/iGRd4rDeHy3q8WkX+
	0nlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=M2cPJ4+sbNXYNmlfNx7ruR/sZxCW0LhS42yyMPi3fiE=;
	b=BrGG7ZiyT5LZ1HD8IPXWHahXyWQi5dm5UKXqbfu1OhLOV5nvv+Xw6QtZ1+3O/WBh69
	s7VV4uNOZxSzJ9dQsPK+wZL8zbIbOcr1eurlfTbpxb9bvbmwwLv+F133WIc5BaYJuarP
	9xcL4/ZxcLLzsSWDze90PMQviY+xzIdNlsB4SWHCXBUdV+2qi+BPjTLTB0UgpAHo668c
	cwUydnglrElsQAfqi7Sm/Qg+Ui63VPsmiIZVDBIOqkdl+9l7vOF+U3QAQbsKSX246l3Y
	7v+qAWjGxQg8HhWfvN7YZotuBGvDUdHNf5NCleWboXZFiJ7iSn5ZofqrSKaCJYR5oI10
	go0w==
X-Gm-Message-State: APjAAAW+2b7A0YxZdXAnBnRj6moae+DbEV/pj8LAebwClhorXQhzWcGY
	JomHBL0+vjWxuDDklBiAmI9GUvCG5Aa1nKqJWWXrsLM8
X-Google-Smtp-Source: APXvYqzsGywhzBvx9HkdjqL8KebdW/SHDPNg5sivi6inxBr2H4zcv/+hXE5PKwdIfhJFeJpWjAEywdNOi2VC35ju/9s=
X-Received: by 2002:aed:3827:: with SMTP id j36mr5136702qte.196.1556831485961; 
	Thu, 02 May 2019 14:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190422200845.14343-1-daniel.diaz@linaro.org>
	<CA+chaQcLbYYHTkiU78CkS7t5kRNnPhsk2WsvfD28VVBBjdcidQ@mail.gmail.com>
	<CAEUSe78nNar8VW8h0jsBfbY7kegOojHR8RPtwtmz-cbkP1MKxw@mail.gmail.com>
	<CAP71WjxL1DCroZwksKemoFh_kKKdhvbVt7U3XJWOo_SiHjYqYg@mail.gmail.com>
In-Reply-To: <CAP71WjxL1DCroZwksKemoFh_kKKdhvbVt7U3XJWOo_SiHjYqYg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 May 2019 14:10:59 -0700
Message-ID: <CAMKF1srAZ7N-DQS_eRyADW4heAY=ud-hDbNXamg771i2W7uBpw@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
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
X-List-Received-Date: Thu, 02 May 2019 21:11:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 1, 2019 at 12:17 AM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> hey,
>
> On Mon, Apr 22, 2019 at 10:38 PM Daniel D=C3=ADaz <daniel.diaz@linaro.org=
> wrote:
> >
> > Hello!
> >
> > On Mon, 22 Apr 2019 at 15:15, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > > NAK
> > >
> > > This completely defeats the purpose of LIC_FILES_CHKSUM.
> > > If the COPYING file vary across releases than LIC_FILES_CHKSUM should=
 be updated when needed while verifying that the LICENSE value is still cor=
rect.
> > > If you use COMMON_LICENSE_DIR and completely ignore the license in th=
e source, then it won't ever warn the user that the license was changed whi=
le upgrading to newer release.
>
> I hit this issue today as well.. so looked into it..
>
> >
> >
> > I understand the sentiment and agree to the principle. Besides,
> > licensing of the kernel source code does not change too often -- Last
> > change in the kernel was over a year ago, and it was not relicensed,
> > just reshuffled.
> >
> > This does, however, blocks us from switching kernels or building
> > different versions with the same OE baseline. Our [1] main targets are
> > Linux LTS's: 4.4, 4.9, 4.14, 4.19, and (currently) 5.0; we also build
> > Linux mainline and Linux next. For automated bisections or for a
> > kernel developer tree, we have to rely on the given kernel source
> > code, which might contain any license that cpupower has had in the
> > past. We know for sure that _that_ is GPL-2, but we can't adjust the
> > checksum on the fly.
> >
> > We're fine carrying this patch in our trees, as we can burden
> > ourselves with looking at licensing of the kernel, but because this
> > was so promptly NAKed, I also very much would like to hear feedback on
> > how to deal with such limitation in a way that could be acceptable in
> > meta-oe.
>
> cpupower is a 'special' recipe since it does "inherit kernelsrc" ,
> which essentially means that it doesn't have its own sources, but
> reuse the kernel source tree, from virtual/kernel recipe. As such,
> checking the license file in cpupower recipe does not seem relevant,
> since it does not fetch anything (kernelsrc has "deltask do_fetch")
> and the fetching is deferred to the virtual/kernel recipe.
>
> so we are basically checking the COPYING file twice. If there was any
> license issue, it would have been caught by virtual/kernel recipe
> already.
>
> so the proposed patch doesn't seem too bad.. in fact, we might even
> want to do that directly in kernelsrc.bbclass.
>
> well, in fact.. i now just checked at other recipes that uses
> kernelsrc and found that:
> * meta/recipes-kernel/perf/perf.bb: does not set LIC_FILES_CHKSUMS,
> and it works fine...
> * meta-oe/recipes-kernel/bpftool/bpftool.bb: it has this:
> LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=3D801f80980d171dd6425610833a22d=
be6"
>
> Since we remove do_fetch task explicitly , i think that removing
> LIC_FILES_CHKSUMS (like in perf.bb) should be the best approach.  I
> tried to build cpupower without LIC_FILES_CHKSUMS and it worked..
>

thats probably ok

> >
> > Thanks and greetings!
> >
> > Daniel D=C3=ADaz
> > daniel.diaz@linaro.org
> >
> >
> > [1] https://lkft.linaro.org/about/
> >
> >
> > > On Mon, Apr 22, 2019 at 10:09 PM Daniel D=C3=ADaz <daniel.diaz@linaro=
.org> wrote:
> > >>
> > >> The Linux kernel is GPLv2, at least as far cpupower is
> > >> concerned. Because this recipe reuses the kernel code, and
> > >> said source code can (does) vary across different releases,
> > >> it's best to refer to license by its name.
> > >>
> > >> Use GPL-2.0 from OE common license dir.
> > >>
> > >> Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
> > >> ---
> > >>  meta-oe/recipes-kernel/cpupower/cpupower.bb | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/meta-oe/recipes-kernel/cpupower/cpupower.bb b/meta-oe/r=
ecipes-kernel/cpupower/cpupower.bb
> > >> index 928973871..c7ea087a5 100644
> > >> --- a/meta-oe/recipes-kernel/cpupower/cpupower.bb
> > >> +++ b/meta-oe/recipes-kernel/cpupower/cpupower.bb
> > >> @@ -2,7 +2,7 @@ SUMMARY =3D "Shows and sets processor power related =
values"
> > >>  DESCRIPTION =3D "cpupower is a collection of tools to examine and t=
une power \
> > >>  saving related features of your processor."
> > >>  LICENSE =3D "GPLv2"
> > >> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c=
0c6b8814"
> > >> +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=3D80=
1f80980d171dd6425610833a22dbe6"
> > >>  DEPENDS =3D "pciutils gettext-native"
> > >>  PROVIDES =3D "virtual/cpupower"
> > >>
> > >> --
> > >> 2.17.1
> > >>
> > >> --
> > >> _______________________________________________
> > >> Openembedded-devel mailing list
> > >> Openembedded-devel@lists.openembedded.org
> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

