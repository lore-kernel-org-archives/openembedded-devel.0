Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 27AF075E80
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 17:31:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1462555880; h=Content-Type: Cc: To: From: Subject:
	Message-ID: Date: References: In-Reply-To: MIME-Version: Sender;
	bh=SYDA1gAgAvJKvEJa8oMU6uhgs6t4nuWsdp28gCmZWhA=;
	b=EcFJSyg2M4edtAbyOGJVHBPMnZctEQTOrCb+Ma5fqXsg4RRselCUpcQSmQFYWEgEMjpkEpjn
	rSGngzjltLoD8ofrMbrDTShAzMU5HlOnFddNwbLliZ/dmFtaFGsaq+reXIlDDHSbLN5nG5i1
	Aoz4D9ZoNXN1GP4lOQ1zR8fewgU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: Date:
	Message-ID: Subject: From: To: Cc: Content-Type;
	b=jOAMVnkiE2ZeeAdAi3+49f1jPD7T5SMjs4BkXzjpBGo6/TtNExHMs8JxySbg1m+cyMkaee
	1lkLEp8foUDZw5p3i0v0F5Txou53JPxuOmIkPUL9eMN1VgxnmWfjMQwxBK0XJXxMF52IwbMy
	AeTfwV5+RrjH5XL+C8NrWyYrZnqxw=
Sender: derek@asterius.io
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mxa.mailgun.org with ESMTP id 572cd4ca.7337830-in1;
	Fri, 06 May 2016 17:30:50 -0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id bi2so52135334igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 10:30:50 -0700 (PDT)
X-Gm-Message-State: AOPr4FUe5RMKMrEqV5TX9VXzKaJNmLZQiwAuaCIJNDhy8+uHjMdWI/0wdaA3uB5lskAQSEKy0xnHHM7IfO+rLw==
MIME-Version: 1.0
X-Received: by 10.50.120.198 with SMTP id le6mr11644893igb.25.1462555850686;
	Fri, 06 May 2016 10:30:50 -0700 (PDT)
Received: by 10.107.180.73 with HTTP; Fri, 6 May 2016 10:30:50 -0700 (PDT)
In-Reply-To: <20160505191951.GD23370@jama>
References: <1461947081-15513-1-git-send-email-derek@asterius.io>
	<CA+chaQf7vGXOz61725sEOAG4EBKGmS=KxYq3ZPZS7WfjAPYeXw@mail.gmail.com>
	<CADNbA1rCRsrU=H8nKKJ0J7Ek-V=HD1fnDW4t8jT4=_3SZgXP0w@mail.gmail.com>
	<20160505191951.GD23370@jama>
Date: Fri, 6 May 2016 13:30:50 -0400
X-Gmail-Original-Message-ID: <CADNbA1q_bkBmE=L1KMGjtGE3OnurdnREQ8x+C40LS7idUCvSnw@mail.gmail.com>
Message-ID: <CADNbA1q_bkBmE=L1KMGjtGE3OnurdnREQ8x+C40LS7idUCvSnw@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv2] giflib: update to version 5.1.4
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
X-List-Received-Date: Fri, 06 May 2016 17:31:20 -0000
Content-Type: text/plain; charset=UTF-8

Sure.  Patch set submitted.

On Thu, May 5, 2016 at 3:19 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Tue, May 03, 2016 at 08:54:21AM -0400, Derek Straka wrote:
> > Yes.  I'll submit a patch for leptonica -> 1.73 to be compatible with
> > giflib 5.1.x
>
> That unblocked another issue:
>
> | ../../../tracker-0.14.2/src/tracker-extract/tracker-extract-gif.c: In
> function 'tracker_extract_get_metadata':
> |
> ../../../tracker-0.14.2/src/tracker-extract/tracker-extract-gif.c:620:17:
> error: too few arguments to function 'DGifOpenFileHandle'
> |   if ((gifFile = DGifOpenFileHandle (fd)) == NULL) {
> |                  ^
>
> Whole log:
> http://errors.yoctoproject.org/Errors/Details/61673/
>
> Can you please take a look at it?
>
> Breaking giflib API is not fun :/ even when done with good intentions:
> http://esr.ibiblio.org/?p=5754
>
> > On Tue, May 3, 2016 at 3:38 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > > Can you check leptonica, seems to be broken by this upgrade:
> > >
> > > http://errors.yoctoproject.org/Errors/Details/61476/
> > >
> > > On Fri, Apr 29, 2016 at 6:24 PM, Derek Straka <derek@asterius.io>
> wrote:
> > >
> > >>   - Remove EXTRA_OECONF to disable X11 support since direct X11 window
> > >> rendering has been retired
> > >> Signed-off-by: Derek Straka <derek@asterius.io>
> > >> ---
> > >>  .../recipes-devtools/giflib/{giflib_4.1.6.bb => giflib_5.1.4.bb}
>  | 7
> > >> ++-----
> > >>  1 file changed, 2 insertions(+), 5 deletions(-)
> > >>  rename meta-oe/recipes-devtools/giflib/{giflib_4.1.6.bb =>
> > >> giflib_5.1.4.bb} (67%)
> > >>
> > >> diff --git a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
> > >> b/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
> > >> similarity index 67%
> > >> rename from meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
> > >> rename to meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
> > >> index e59d0e5..21fa352 100644
> > >> --- a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
> > >> +++ b/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
> > >> @@ -2,14 +2,11 @@ SUMMARY = "shared library for GIF images"
> > >>  SECTION = "libs"
> > >>  LICENSE = "MIT"
> > >>  LIC_FILES_CHKSUM =
> "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
> > >> -PR = "r3"
> > >>
> > >>  SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2"
> > >>
> > >>  inherit autotools
> > >>
> > >> -EXTRA_OECONF = "--disable-x11"
> > >> -
> > >>  PACKAGES += "${PN}-utils"
> > >>  FILES_${PN} = "${libdir}/libgif.so.*"
> > >>  FILES_${PN}-utils = "${bindir}"
> > >> @@ -18,5 +15,5 @@ BBCLASSEXTEND = "native"
> > >>
> > >>  RDEPENDS_${PN}-utils = "perl"
> > >>
> > >> -SRC_URI[md5sum] = "7125644155ae6ad33dbc9fc15a14735f"
> > >> -SRC_URI[sha256sum] =
> > >> "e1c1ced9c5bc8f93ef0faf0a8c7717abf784d10a7b270d2285e8e1f3b93f2bed"
> > >> +SRC_URI[md5sum] = "2c171ced93c0e83bb09e6ccad8e3ba2b"
> > >> +SRC_URI[sha256sum] =
> > >> "df27ec3ff24671f80b29e6ab1c4971059c14ac3db95406884fc26574631ba8d5"
> > >> --
> > >> 1.9.1
> > >>
> > >> --
> > >> _______________________________________________
> > >> Openembedded-devel mailing list
> > >> Openembedded-devel@lists.openembedded.org
> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >>
> > >
> > >
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

