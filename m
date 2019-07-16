Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id D69747ECB2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 15:58:55 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id r6so15022259qkc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 08:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gBNj/ZqKNz6sjm4zTQJ0xt9IbuPpNzpolGRxTWJi+Zw=;
	b=q/NInLWEVr8cZUZPO++g49oy0DMoRYkS/3sp0Bw/bmGTU/xSBpDOT3tqSHwNo5cj3d
	xNXte9ePHFvgYpkPwLfgsXof+GM46Q5O20uPEvY9mlCPdjAfalmG0RPajFzq68V+AYsq
	Xfc7QveqePqzowV0rCePMi4ebVkyRvIo6cJIBvsPS/DL5xL3y2MgaUqZJpV0VJcXCyvQ
	hgiQdq0a1C/y1tD3QKVFsC40Dip+YXxD2gYLtVY9K+hEMj2EJ73X6zLmrsBvKsFCJeQV
	i6Ir8nLA6iWgZe1Jgr0CdEscv/qY0CM+GGDsoZ00qA4DBGk9WdRpFbhFj512GRL/1llH
	fCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gBNj/ZqKNz6sjm4zTQJ0xt9IbuPpNzpolGRxTWJi+Zw=;
	b=YbIzsrK7lAMeT+oETEz2WhZk5bA9NwEsuZEUGpV8canx2DhDBJKbu/spZ6acZS2L6p
	z54ynNprUeuHt8otoVRhB4gnxu9R/FotCBtKoQGzO4hhgZaAHooIb8M4LFQPh+0O+MsN
	DDlMKegpbaCvR4e6UVRNeTWi5DpL49b004uuohAgcLZmwa4QeeKW3LYWpJjULGXA37yf
	EIY/day2QLvOp1csbwUbc0Ia3J7wrkN6cFNEr4q+r7dfzVsKMeVEkPh0IWLGeRkdGJNX
	PBAZGPQ+i10Ur9LhpJw0idB5hSQS0sEUjOm6rF9wt41/nLOt6fL8hFxMg+PZbuSjWmAi
	6Ajw==
X-Gm-Message-State: APjAAAX97nWK93ye/kE4LdmP7Vxm+fDyr9qlfdoPEOs4Ub0D3TksNVUa
	8wb8ZQ3wfvxJJ9drmNRnCrL6jFsTgx/h0mr31Js=
X-Google-Smtp-Source: APXvYqwZ6VXOEEE9mbXpKliEsQ3jI0s+8U7sq08ar2N6iDv552tc+6xHLG2fyIOPbcQqS38nPZvEXVhnUegdCDH8tVI=
X-Received: by 2002:a37:7083:: with SMTP id l125mr21343029qkc.71.1563292736355;
	Tue, 16 Jul 2019 08:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190715144901.25305-1-luca@lucaceresoli.net>
	<dcbe6593-85d8-c238-3e55-6e3a027a8cf9@gmail.com>
In-Reply-To: <dcbe6593-85d8-c238-3e55-6e3a027a8cf9@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Jul 2019 08:58:30 -0700
Message-ID: <CAMKF1soS_atifnv9YY8sHL6G2zaB_eUb1eCHY7X2mBLavBvtZA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH 1/4] fuse-exfat: moved to github
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
X-List-Received-Date: Tue, 16 Jul 2019 15:58:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 16, 2019 at 7:54 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 7/15/19 7:48 AM, Luca Ceresoli wrote:
> > fuse-exfat has been moved long ago to github. Update URLs.
> >
> > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> > ---
> >  .../recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb      | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
> > index 18fc9cd6f13d..a70653f607f6 100644
> > --- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
> > +++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
> > @@ -3,12 +3,12 @@ DESCRIPTION = "fuse-exfat is a read and write driver implementing the \
> >  extended file allocation table as a filesystem in userspace. A mounthelper \
> >  is provided under the name mount.exfat-fuse. \
> >  "
> > -HOMEPAGE = "http://code.google.com/p/exfat/"
> > +HOMEPAGE = "https://github.com/relan/exfat"
> >  SECTION = "universe/otherosfs"
> >  LICENSE = "GPLv2+"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> > -SRC_URI = "${DEBIAN_MIRROR}/main/f/fuse-exfat/fuse-exfat_${PV}.orig.tar.gz \
> > -"
> > +SRC_URI = "https://github.com/relan/exfat/releases/download/v${PV}/${BP}.tar.gz"
>
> IIRC, the tarball are regenerated on github so it has not been a source
> we can trust. Using the clone method is recommended in these cases.
>

Thats for general archives, not for release artifacts.

> - armin
> > +
> >  DEPENDS = "fuse virtual/libc"
> >  RRECOMMENDS_${PN} = "util-linux-mount"
> >
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

