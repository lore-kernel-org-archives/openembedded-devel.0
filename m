Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id A4AF37D1A9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 16:57:09 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id z17so23873335qts.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 09:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xXJ3xvlvYu2Hyxg2dlylM6Gz21Xexp7kMC9srDkyMJA=;
	b=jD/w1lGMi9GrPUFn9susga9ndAF6Vfd2xk9oWN3+8xrkTtN1VKz+h+yAXrJF/cqCo+
	D6/0j+u4gssETSpiCNP6Wg5XSHrmNgKpNRh/xaGP+TmDCZ44RRZIdY/rcjY2aSrWadco
	frIhYrRrnHSwRCtkj5P8W4zMWYbMLXfk4AwXZJZRCuAbosd0oQ8aRZdjNj87sMdmFBwm
	9mDDyghKehBPKyHyS12bT1D2TZH45y0Qp+cajEoOelLvLaOgR9AGdxq5Eht+qRnqpEjv
	a3aQfGiC1gfnCeQX894ut/luuL/Yh3ywFJO6tRwE+outTiaNB9+ky09fxtsJPcsiog0x
	Iiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xXJ3xvlvYu2Hyxg2dlylM6Gz21Xexp7kMC9srDkyMJA=;
	b=L4INsR2iYCxcME4CeUc9c3uo/1u5KJ1bm/Rt2V4Ax7l5Z0MgAVrhuUwsr8ubVfbSX3
	glFHsYQ/kmFVvqYd0Tz/goQgrISmWmFzzjLCOdbGOONvxQzqXHWaDVtIRL66y73ieUXY
	JfVxm2d+pF6UPM9oTm5XXyykZ2HRGAmI2Tt++QHLnV9o954Rmn8i3QYNfe9XavTi0efe
	tnB/4n6+18iZ0bM4CdnatRRZi3g87pIHIZ3WO6wuGtGD8kFrTm6rXlOcMAYDWR1C++Jw
	3qZ7RS3SjxMJOCKJ0Z8dVh8+cMg0dygVUvPeNxCMoRNtt1P09whJNyQAJ0UV1g9at1Kk
	g1Lw==
X-Gm-Message-State: APjAAAUmrxzjT78CuvcyiogMzm5wzB6mUXvZa1v1vuS86cKChCqrtml7
	NzxqSJUD3KBxovMZvyYgpxyLCJ82eqdKZeh3bT0=
X-Google-Smtp-Source: APXvYqyX/RRxiS1cSjG0/YSB8bviqgcGZ2hL8UoGxSpr9mQDG8G47tEngUEFQ5OJi929LvSZ3ewhzevaJXKcpYmZTzA=
X-Received: by 2002:ac8:2f10:: with SMTP id j16mr37669008qta.29.1553792230269; 
	Thu, 28 Mar 2019 09:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190327032430.59511-1-wak@google.com>
	<CAMKF1srK4zKuwA0zzo6zNpASu_yYp1W8txE+gzgBiP6vzWuzAA@mail.gmail.com>
	<CAPnigKmZvszOumY-EEbvTGcR2+-8EP3woGEbMyNrts2=s0N8kA@mail.gmail.com>
In-Reply-To: <CAPnigKmZvszOumY-EEbvTGcR2+-8EP3woGEbMyNrts2=s0N8kA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Mar 2019 09:56:44 -0700
Message-ID: <CAMKF1spWk+QWS4CQ438nYs5N7esLHo-KGzKLNKcY5yJvQciTRw@mail.gmail.com>
To: William Kennington <wak@google.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cli11: 1.6.2 -> 1.7.1
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
X-List-Received-Date: Thu, 28 Mar 2019 16:57:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 28, 2019 at 2:04 AM William Kennington <wak@google.com> wrote:
>
> Yeah, sorry about that. This is a known issue with the gitsm and I
> sent out a patch yesterday
> https://patchwork.openembedded.org/series/16685/#
> this was followed up by a maintainer patch to implement similar update checking
> https://patchwork.openembedded.org/series/16702/#
>
> I don't think we have consensus yet on a proper fix but hopefully we
> get something soon. This is breaking us in openbmc.
>

Sure, send an update again when this is solved in fetcher. I will hold
it off for now

> On Wed, Mar 27, 2019 at 9:30 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Tue, Mar 26, 2019 at 8:24 PM William A. Kennington III via
> > Openembedded-devel <openembedded-devel@lists.openembedded.org> wrote:
> > >
> > > LICENSE checksum updated to reflect a new copyright date being updated
> > > there.
> > >
> > fails to unpack
> >
> > https://errors.yoctoproject.org/Errors/Details/234626/
> >
> > > Signed-off-by: William A. Kennington III <wak@google.com>
> > > ---
> > >  .../recipes-support/cli11/{cli11_1.6.2.bb => cli11_1.7.1.bb}  | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >  rename meta-oe/recipes-support/cli11/{cli11_1.6.2.bb => cli11_1.7.1.bb} (79%)
> > >
> > > diff --git a/meta-oe/recipes-support/cli11/cli11_1.6.2.bb b/meta-oe/recipes-support/cli11/cli11_1.7.1.bb
> > > similarity index 79%
> > > rename from meta-oe/recipes-support/cli11/cli11_1.6.2.bb
> > > rename to meta-oe/recipes-support/cli11/cli11_1.7.1.bb
> > > index e62c1d3d1..1ed97a27e 100644
> > > --- a/meta-oe/recipes-support/cli11/cli11_1.6.2.bb
> > > +++ b/meta-oe/recipes-support/cli11/cli11_1.7.1.bb
> > > @@ -2,8 +2,8 @@ SUMMARY = "C++11 command line parser"
> > >  DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich feature set with a simple and intuitive interface."
> > >  HOMEPAGE = "https://github.com/CLIUtils/CLI11"
> > >  LICENSE = "BSD-3-Clause"
> > > -LIC_FILES_CHKSUM = "file://LICENSE;md5=c271fee3ae28e11b24b97284d9f82887"
> > > -SRCREV = "bd4dc911847d0cde7a6b41dfa626a85aab213baf"
> > > +LIC_FILES_CHKSUM = "file://LICENSE;md5=8489f3831fc7b75264c1d5e346251a74"
> > > +SRCREV = "49ac989a9527ee9bb496de9ded7b4872c2e0e5ca"
> > >  PV .= "+git${SRCPV}"
> > >
> > >  SRC_URI += "gitsm://github.com/CLIUtils/CLI11 \
> > > --
> > > 2.21.0
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

