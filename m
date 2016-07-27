Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 630B5606BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 17:13:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1469639608; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=BMHE15JMkau6+xUswV/rhOe2opeLrjatGonthI1VN9g=;
	b=d5w7cErsq9MTZQnJgTC6zgfu5uCUWoKXCoei4vcZ4nD3ZoqpKzUbo5rAbcwYzS+Iczl58kXw
	jCPklyvKzU5AaVNn0P78OAGYcpcwy0Tt5ykmRW0gF6q0Ad2y1I1rJ9SiYXK06N6Y9FOGJm/q
	PlHnt8Upy6G5r0kvmQR8hrK9Kq8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=D9//lCtdnU+xNsygTw+fLP/8ixXGDJr04uOC2naUfnRIv0pHHAJRB3V86mYJwT0n4AVfKO
	slrs6z1rHRN/PU25//cNbO88TtoNnENiFQipmsmcryEtdRq5x6XY9+EuD1LcgTzVkYg8L0NG
	Xv/tbKEvDV+ErU4D76xHSszaWQFMA=
Sender: derek@asterius.io
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mxa.mailgun.org with ESMTP id 5798ebb6.7f7f243deeb0-in1;
	Wed, 27 Jul 2016 17:13:26 -0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id f6so147782567ith.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 10:13:26 -0700 (PDT)
X-Gm-Message-State: AEkooutNj+EYei3DvxmpbkaaXLiw+/wDEEnoHD51aBOOLQ1CP3+8cdXMMXRq1/5/nnawuNkItg+xSKMrNSR+0Q==
X-Received: by 10.36.87.140 with SMTP id u134mr35714493ita.38.1469639606567;
	Wed, 27 Jul 2016 10:13:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.213 with HTTP; Wed, 27 Jul 2016 10:13:26 -0700 (PDT)
In-Reply-To: <20160727170729.5yewfhqsfgdraupx@jama>
References: <1469638425-30339-1-git-send-email-derek@asterius.io>
	<20160727170729.5yewfhqsfgdraupx@jama>
From: Derek Straka <derek@asterius.io>
Date: Wed, 27 Jul 2016 13:13:26 -0400
X-Gmail-Original-Message-ID: <CADNbA1oLEyeejWCrzE9Anc_nXkYkMZFW6AcLZTmNimQVGHwMrw@mail.gmail.com>
Message-ID: <CADNbA1oLEyeejWCrzE9Anc_nXkYkMZFW6AcLZTmNimQVGHwMrw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-webserver][PATCH] nostromo: update to version 1.9.6 * Update license checksum to include latest copyright information * Update patch for the latest version
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
X-List-Received-Date: Wed, 27 Jul 2016 17:13:32 -0000
Content-Type: text/plain; charset=UTF-8

Sorry about that.  Thanks.

On Wed, Jul 27, 2016 at 1:07 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Wed, Jul 27, 2016 at 12:53:45PM -0400, Derek Straka wrote:
> > Signed-off-by: Derek Straka <derek@asterius.io>
>
> Missing blank line after summary, will fix that when cherry-picking
> this.
>
> > ---
> >  ...GNUmakefile-add-possibility-to-override-variables.patch | 14
> +++++++++-----
> >  .../nostromo/{nostromo_1.9.5.bb => nostromo_1.9.6.bb}      |  6 +++---
> >  2 files changed, 12 insertions(+), 8 deletions(-)
> >  rename meta-webserver/recipes-httpd/nostromo/{nostromo_1.9.5.bb =>
> nostromo_1.9.6.bb} (93%)
> >
> > diff --git
> a/meta-webserver/recipes-httpd/nostromo/files/0001-GNUmakefile-add-possibility-to-override-variables.patch
> b/meta-webserver/recipes-httpd/nostromo/files/0001-GNUmakefile-add-possibility-to-override-variables.patch
> > index 7cf011b..8cd4682 100644
> > ---
> a/meta-webserver/recipes-httpd/nostromo/files/0001-GNUmakefile-add-possibility-to-override-variables.patch
> > +++
> b/meta-webserver/recipes-httpd/nostromo/files/0001-GNUmakefile-add-possibility-to-override-variables.patch
> > @@ -91,7 +91,9 @@ diff --git a/src/nhttpd/GNUmakefile
> b/src/nhttpd/GNUmakefile
> >  index f6d12de..9524911 100644
> >  --- a/src/nhttpd/GNUmakefile
> >  +++ b/src/nhttpd/GNUmakefile
> > -@@ -1,18 +1,18 @@
> > +@@ -1,20 +1,20 @@
> > + #   $nostromo: GNUmakefile,v 1.6 2016/04/12 19:02:06 hacki Exp $
> > +
> >  -CCFLAGS = -O2 -pipe -Wall -Wstrict-prototypes -c
> >  +CFLAGS := -O2 -pipe -Wall -Wstrict-prototypes -c
> >
> > @@ -120,14 +122,16 @@ diff --git a/src/tools/GNUmakefile
> b/src/tools/GNUmakefile
> >  index 15bea61..663ddb5 100644
> >  --- a/src/tools/GNUmakefile
> >  +++ b/src/tools/GNUmakefile
> > -@@ -1,11 +1,11 @@
> > +@@ -1,13 +1,13 @@
> > + #   $nostromo: GNUmakefile,v 1.3 2016/04/12 19:02:58 hacki Exp $
> > +
> >  -CCFLAGS = -O2 -pipe -Wall -Werror -Wstrict-prototypes -c
> > -+CCFLAGS := -O2 -pipe -Wall -Werror -Wstrict-prototypes
> > ++CFLAGS = -O2 -pipe -Wall -Werror -Wstrict-prototypes
> >
> >   crypt:              crypt.o
> > --            cc -o crypt crypt.o -lcrypt
> > +-            cc -L../libbsd -o crypt crypt.o -lcrypt -lbsd
> >  -            strip crypt
> > -+            $(CC) $(CFLAGS) -o crypt crypt.o -lcrypt
> > ++            $(CC) $(CFLAGS) -L../libbsd -o crypt crypt.o -lcrypt -lbsd
> >  +#           $(STRIP) crypt
> >
> >   crypt.o:    crypt.c
> > diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
> b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
> > similarity index 93%
> > rename from meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
> > rename to meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
> > index 562ecd0..e06a696 100644
> > --- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
> > +++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
> > @@ -1,7 +1,7 @@
> >  SUMMARY = "A simple, fast and secure HTTP server"
> >  HOMEPAGE = "http://www.nazgul.ch/dev_nostromo.html"
> >  LICENSE = "MIT"
> > -LIC_FILES_CHKSUM =
> "file://src/nhttpd/main.c;beginline=2;endline=14;md5=e5ec3fa723b29b7d59d205afd8d36938"
> > +LIC_FILES_CHKSUM =
> "file://src/nhttpd/main.c;beginline=2;endline=14;md5=0bb3711a867b9704d3bfabcf5529b64e"
> >
> >  SRC_URI = "http://www.nazgul.ch/dev/${BPN}-${PV}.tar.gz \
> >
>  file://0001-GNUmakefile-add-possibility-to-override-variables.patch \
> > @@ -11,8 +11,8 @@ SRC_URI = "
> http://www.nazgul.ch/dev/${BPN}-${PV}.tar.gz \
> >             file://nostromo \
> >  "
> >
> > -SRC_URI[md5sum] = "dc6cfd6b5aae04c370c7f818fa7bde55"
> > -SRC_URI[sha256sum] =
> "5f62578285e02449406b46cf06a7888fe3dc4a90bedf58cc18523bad62f6b914"
> > +SRC_URI[md5sum] = "27aa241d78ff78920354c3e03a5026ea"
> > +SRC_URI[sha256sum] =
> "541494ecfeafec58c0876ccc90cc23b06e0144f6f42029af44c7cdb1f411e8eb"
> >
> >  TARGET_CC_ARCH += "${LDFLAGS}"
> >
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

