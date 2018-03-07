Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id CAF2E78A09
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 21:09:44 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1520456985; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=BYwEDjb+Lo/n6oC669ntaBXJGaVeMeSagy1cJUZGnv8=;
	b=XoaA9/gzBPmptbxD4xojyLzBsHbAeC1j97hZj+mLnrxXWCEM4BPwZKFrZMDm4FbRqm0VNrmV
	hRFbtwToYQFBcMVIwnAM2jkQFnibp0nNHdRCrqJuIgnsk+IFFDCYQBZAFUvMEhHpOXhlpgLp
	FsmBloD6h3kQzxBxgWFth8Q/HIQ=
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mxa.mailgun.org with ESMTP id 5aa05519.7f51382bb7f0-smtp-out-n01;
	Wed, 07 Mar 2018 21:09:45 -0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id n9so4353754qtk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 13:09:45 -0800 (PST)
X-Gm-Message-State: AElRT7FQuTtZydDtNOa2lxNGNJXD6AAHL+OATBQuIvM7GJ4ax9nPrnFY
	Ry+GW1BnRnFCaPrA2rspbBh04nEeQ0bNtOpibxw=
X-Google-Smtp-Source: AG47ELtJDf6Dvm2IhCMTe2Lm7piysEvaPxiGnwTjyPkq9Br8VdoPOi89fyHBwU5njvvrKqmwg2c1rjkKi2rEt75hdqs=
X-Received: by 10.200.50.155 with SMTP id z27mr34958146qta.250.1520456985352; 
	Wed, 07 Mar 2018 13:09:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.108.35 with HTTP; Wed, 7 Mar 2018 13:09:44 -0800 (PST)
In-Reply-To: <1284db2a-8cff-7f97-dc7b-dc17370167c6@gmail.com>
References: <1520091651-25420-1-git-send-email-derek@asterius.io>
	<1284db2a-8cff-7f97-dc7b-dc17370167c6@gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Wed, 7 Mar 2018 16:09:44 -0500
X-Gmail-Original-Message-ID: <CADNbA1okmMSAE4ivTaKaX09i51rG4KiAFDUF2kp=DtZaAYF6AA@mail.gmail.com>
Message-ID: <CADNbA1okmMSAE4ivTaKaX09i51rG4KiAFDUF2kp=DtZaAYF6AA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCHv3] python-sqlalchemy: update to version 1.1.17
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
X-List-Received-Date: Wed, 07 Mar 2018 21:09:45 -0000
Content-Type: text/plain; charset="UTF-8"

Feel free to drop that portion of the commit message or I can send another
rev.

On Wed, Mar 7, 2018 at 2:42 PM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 03/03/2018 07:40 AM, Derek Straka wrote:
> > License-Update: Update the license checksum for copyright year and
> verify the terms remain the same
> >
> > diff -u SQLAlchemy-1.1.15/LICENSE SQLAlchemy-1.1.17/LICENSE
> > --- SQLAlchemy-1.1.15/LICENSE 2017-11-03 16:47:01.000000000 -0400
> > +++ SQLAlchemy-1.1.17/LICENSE 2018-02-22 16:08:41.000000000 -0500
> > @@ -1,6 +1,6 @@
> >  This is the MIT license: http://www.opensource.org/
> licenses/mit-license.php
> >
> > -Copyright (c) 2005-2017 the SQLAlchemy authors and contributors <see
> AUTHORS file>.
> > +Copyright (c) 2005-2018 the SQLAlchemy authors and contributors <see
> AUTHORS file>.
> >  SQLAlchemy is a trademark of Michael Bayer.
> >
> >  Permission is hereby granted, free of charge, to any person obtaining a
> copy of this
> The above is confusing pw.sh as it thinks it a patch to be applied.
>
> - armin
> >
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > ---
> >  meta-python/recipes-devtools/python/python-sqlalchemy.inc           |
> 6 +++---
> >  .../{python-sqlalchemy_1.1.15.bb => python-sqlalchemy_1.1.17.bb}    | 0
> >  .../{python3-sqlalchemy_1.1.15.bb => python3-sqlalchemy_1.1.17.bb}  | 0
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.15.bb
> => python-sqlalchemy_1.1.17.bb} (100%)
> >  rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.
> 1.15.bb => python3-sqlalchemy_1.1.17.bb} (100%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> > index 2683a6a..0c191ae 100644
> > --- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> > +++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> > @@ -2,13 +2,13 @@ DESCRIPTION = "Python SQL toolkit and Object
> Relational Mapper that gives \
> >  application developers the full power and flexibility of SQL"
> >  HOMEPAGE = "http://www.sqlalchemy.org/"
> >  LICENSE = "MIT"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf5
> 38"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=b1c412c9d8d1ce018f7a9374407c22
> bb"
> >
> >  PYPI_PACKAGE = "SQLAlchemy"
> >  inherit pypi
> >
> > -SRC_URI[md5sum] = "077f9bd3339957f53068b5572a152674"
> > -SRC_URI[sha256sum] = "8b79a5ed91cdcb5abe97b0045664c5
> 5c140aec09e5dd5c01303e23de5fe7a95a"
> > +SRC_URI[md5sum] = "03db1c8f8ae911977c0bf3950a4c9c21"
> > +SRC_URI[sha256sum] = "6b55ec379c11ad696f9371ce8e0de9
> 3c7f21134323f56a56a1b0d8fbef17013c"
> >
> >  RDEPENDS_${PN} += " \
> >      ${PYTHON_PN}-json \
> > diff --git a/meta-python/recipes-devtools/python/python-
> sqlalchemy_1.1.15.bb b/meta-python/recipes-devtools/python/python-
> sqlalchemy_1.1.17.bb
> > similarity index 100%
> > rename from meta-python/recipes-devtools/python/python-sqlalchemy_1.1.
> 15.bb
> > rename to meta-python/recipes-devtools/python/python-sqlalchemy_1.1.
> 17.bb
> > diff --git a/meta-python/recipes-devtools/python/python3-
> sqlalchemy_1.1.15.bb b/meta-python/recipes-devtools/python/python3-
> sqlalchemy_1.1.17.bb
> > similarity index 100%
> > rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.
> 15.bb
> > rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.
> 17.bb
>

