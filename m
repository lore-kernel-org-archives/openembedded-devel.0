Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 305777847B
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Mar 2018 23:09:40 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id x4so8207111uaj.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Mar 2018 15:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+cIRBOXv8ENNpE6Buad200rMesph7PVyNHGwL9FGMA0=;
	b=dPYwFEs4mhi7Cdo7Zz1UFtCiELMWMyNy5nzmlbznQpOWVSxKzYlQDLSgZkdb6DS1j0
	EEAaHkdaWCuqEv+dWPt9tRqr1M4Aq4RfDB2O4V24q+oLrFDKAShbXd3thvktjiEJ0yAC
	pP0vBYP9DHQUHtJjsg48rb0DM3IJQ1sZY99C0I3+JUdaUUBnhCxBM9yds0OU0xwhMETV
	DHaTZkiG2SxM6Xr/iCRNtDNIunTjJxpjfLUQ//KqGENzYsYLeA2HsOmIPFzhmPs2K8hn
	7vVA8A9DxoKWcb0liBfbSCVjaMYaK3TYPM5KjBXK1HrArcf1+JhqZUSnLxXu8+2XixzY
	x8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+cIRBOXv8ENNpE6Buad200rMesph7PVyNHGwL9FGMA0=;
	b=A/AJ3O7+nSpmwHCULWxoXVwQo5kHaeUprxcVI/oFOoJuuHUg/E7H4O/sKVjzlfLNrE
	76+juOawCIQRDnkaHkg7E3UUdTB5wzvam9XQs3u3h0dnVhSV4ol9Jvb5ydiMQGpCsRHN
	SRVqj0kNW/+7zhkP6m2mSrBmo6YkUvfBzCyqP0FrcGLbnj5xcLsVQ7sCLBMGEXSjDFkC
	SLzIz4HmGgSjWl/S7zcgFQwxFChDXcIDKveZbGLBTmQWaGrUjtjrW32bzADDWWqUcCOY
	1oRCR21XwIyDA7VmbBW4CxVzGt5+OfKA/heSYDaQyXf1DRVou76mLfQuGkmsEcbYwYRt
	Wohw==
X-Gm-Message-State: APf1xPDIYeFncNgYzZke/Z0OftWQY+8lmrGEHNlBPBN6LEMrMK3cwJsr
	m8JDJ29u4lfkGs4qBgkylWcLCXsrRyqEpyxiXmM=
X-Google-Smtp-Source: AG47ELuiF1egtRQw4wxrf5KRHIl7ZdePZFM+BuLQeB9EnZMouq8KeHgx9QxBGqsUsltQ5dwV0pd+insM3Lo5rJZLp/8=
X-Received: by 10.159.61.88 with SMTP id m24mr7029288uai.139.1520118581926;
	Sat, 03 Mar 2018 15:09:41 -0800 (PST)
MIME-Version: 1.0
References: <1520089170-25302-1-git-send-email-derek@asterius.io>
	<4ef80f7b-18fa-2615-3b08-bfe25ad169da@gmail.com>
	<CADNbA1pnZFQqyNpxqiGtW8m4YGONHB1kcCZxmeCLr=LkBkg=gA@mail.gmail.com>
	<CAMKF1srdL6JxV-ve1qA3OeGFV-yzagzkqxhU4OUrXbAmvvCUQg@mail.gmail.com>
In-Reply-To: <CAMKF1srdL6JxV-ve1qA3OeGFV-yzagzkqxhU4OUrXbAmvvCUQg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 03 Mar 2018 23:09:31 +0000
Message-ID: <CANx9H-AEN6rCFenD7F9TBPfn9c4jPwswmb7fH0Hq=DDQvsB+VQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCHv2] python-sqlalchemy: update to version 1.1.17
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
X-List-Received-Date: Sat, 03 Mar 2018 23:09:41 -0000
Content-Type: text/plain; charset="UTF-8"

It is about which resources are running the actual patchtest job (Linux
Foundation vs. Open Embedded) and the complication of multiple layers all
going to one mailing list (openembedded-devel). This was part of the
motivation for splitting up meta-openembedded, which turns into nothing but
a flame war (well, no obvious outcome or conclusion anyway). The solution
is probably to improve patchtest. But we still need to decide who and where
will run the actual job. We can discuss, yet again, at OEDAM.

On Sat, Mar 3, 2018 at 11:59 AM Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Mar 3, 2018 at 11:24 AM, Derek Straka <derek@asterius.io> wrote:
> > Is there a reason the patchtest scripts are not run on the openembedded
> > layers?  Is it just a matter of doing the work?
> >
>
> I believe so.
>
> > On Sat, Mar 3, 2018 at 11:42 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >>
> >>
> >> On 3/3/18 6:59 AM, Derek Straka wrote:
> >>>
> >>> Update the license checksum for copyright year and verify the terms
> >>> remain the same
> >>>
> >>> diff -u SQLAlchemy-1.1.15/LICENSE SQLAlchemy-1.1.17/LICENSE
> >>> --- SQLAlchemy-1.1.15/LICENSE   2017-11-03 16:47:01.000000000 -0400
> >>> +++ SQLAlchemy-1.1.17/LICENSE   2018-02-22 16:08:41.000000000 -0500
> >>> @@ -1,6 +1,6 @@
> >>>   This is the MIT license:
> >>> http://www.opensource.org/licenses/mit-license.php
> >>>
> >>> -Copyright (c) 2005-2017 the SQLAlchemy authors and contributors <see
> >>> AUTHORS file>.
> >>> +Copyright (c) 2005-2018 the SQLAlchemy authors and contributors <see
> >>> AUTHORS file>.
> >>
> >>
> >> Thanks for follow up. This looks good.
> >>
> >>
> >>>   SQLAlchemy is a trademark of Michael Bayer.
> >>>
> >>>   Permission is hereby granted, free of charge, to any person
> obtaining a
> >>> copy of this
> >>>
> >>> Signed-off-by: Derek Straka <derek@asterius.io>
> >>> ---
> >>>   meta-python/recipes-devtools/python/python-sqlalchemy.inc
>  | 6
> >>> +++---
> >>>   .../{python-sqlalchemy_1.1.15.bb => python-sqlalchemy_1.1.17.bb}
> | 0
> >>>   .../{python3-sqlalchemy_1.1.15.bb => python3-sqlalchemy_1.1.17.bb}
> | 0
> >>>   3 files changed, 3 insertions(+), 3 deletions(-)
> >>>   rename meta-python/recipes-devtools/python/{
> python-sqlalchemy_1.1.15.bb
> >>> => python-sqlalchemy_1.1.17.bb} (100%)
> >>>   rename
> >>> meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.15.bb =>
> >>> python3-sqlalchemy_1.1.17.bb} (100%)
> >>>
> >>> diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> >>> b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> >>> index 2683a6a..0c191ae 100644
> >>> --- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> >>> +++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> >>> @@ -2,13 +2,13 @@ DESCRIPTION = "Python SQL toolkit and Object
> Relational
> >>> Mapper that gives \
> >>>   application developers the full power and flexibility of SQL"
> >>>   HOMEPAGE = "http://www.sqlalchemy.org/"
> >>>   LICENSE = "MIT"
> >>> -LIC_FILES_CHKSUM =
> "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
> >>> +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=b1c412c9d8d1ce018f7a9374407c22bb"
> >>>     PYPI_PACKAGE = "SQLAlchemy"
> >>>   inherit pypi
> >>>   -SRC_URI[md5sum] = "077f9bd3339957f53068b5572a152674"
> >>> -SRC_URI[sha256sum] =
> >>> "8b79a5ed91cdcb5abe97b0045664c55c140aec09e5dd5c01303e23de5fe7a95a"
> >>> +SRC_URI[md5sum] = "03db1c8f8ae911977c0bf3950a4c9c21"
> >>> +SRC_URI[sha256sum] =
> >>> "6b55ec379c11ad696f9371ce8e0de93c7f21134323f56a56a1b0d8fbef17013c"
> >>>     RDEPENDS_${PN} += " \
> >>>       ${PYTHON_PN}-json \
> >>> diff --git
> >>> a/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.15.bb
> >>> b/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.17.bb
> >>> similarity index 100%
> >>> rename from
> >>> meta-python/recipes-devtools/python/python-sqlalchemy_1.1.15.bb
> >>> rename to meta-python/recipes-devtools/python/
> python-sqlalchemy_1.1.17.bb
> >>> diff --git
> >>> a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
> >>> b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.17.bb
> >>> similarity index 100%
> >>> rename from
> >>> meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
> >>> rename to
> >>> meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.17.bb
> >>>
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

