Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2D0CC7D737
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 00:46:59 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id z17so872415qts.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2019 17:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cngwgLGtEl++kNwamxIdbeX0Ut8d5wQEO2s4700/vIo=;
	b=vS+s7r8RLAwM5JWqk18yKdkBtmfH2dC2gfneu7EB+qdXZQn7/CUfBjoCN6K7O0lE6E
	R4LhMzSgzW/TI+mjKbpJxl76PA4zV+gzF5qBzJEjR5OTsyU3dbIgpV2Qg1lzEyYAB6me
	g6t+xkxIGJdfmDXVuJG8AP1EnL8CplkU1Bk7HWhzoP2/q/jwaCRZm0Sy0TMan+oDa3eA
	TN4s/AEr4w1VnR33ZQVlKH3S73OGyjgK++n+talJwfSjqRzBrxNiBFsLP9HlrptVVVPe
	in1gOzergt5g/iAJUlNBT68PeCqO/0n8xk6pxxNRL2IN66qf+M8z5ra62p1lpvUH6tLZ
	rMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cngwgLGtEl++kNwamxIdbeX0Ut8d5wQEO2s4700/vIo=;
	b=RXCEe3ED4k3PzADBhw8sg6OezMT5eq258/3hmil9i+EsrFnsaxLHcJi3yf2eJaCihB
	xmUwC5znTNksIU7YvuNOdDkFpvvR2CUnK8d2as196jo5e/GgwkAoCsHRHVQeqVJU6vK4
	Vx3v2ieh0DHsidRKED2Q1KM1XEA2sYSLz3LZtcWCQUEA8SiJGeyqKraNucgLWlhqyD1L
	Mq6RUfO98aZ9sjtKsjNcVRBqOaRy+1kbRTjeUoMohwEXSOoklaEkilzD5fobbhCtAfOO
	+pYsphl1R6mHQ6yj22fW4zB+YR4bw4R5Eh3OF3USyh+8riSNHjLHHbV5ET0QVp6UKxZG
	OBXw==
X-Gm-Message-State: APjAAAX6E2jrrVwbh1/pquqKGKqSOkgDy2zNP3FLtHRQ5HXrW9Iu5PSx
	EEZNcWX3WyYvVkYqZmTOrCVMMDxGlCXOKhJQiHk=
X-Google-Smtp-Source: APXvYqwA8y/yF5cFuJ5t9zPlppuyMA/Rd7X/HtZ30/5WWmA2r2+/UR70WWRIhpNlllbcS9PItIUw6szI+22jnQsH/wM=
X-Received: by 2002:a0c:81a9:: with SMTP id 38mr31612574qvd.208.1554857220742; 
	Tue, 09 Apr 2019 17:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190407130935.10670-1-open.source@oleksandr-kravchuk.com>
	<CAMKF1spjoZeXitjwgFgr882ab+6WjN+C7-DT7K6Hh9YvtWPUFQ@mail.gmail.com>
In-Reply-To: <CAMKF1spjoZeXitjwgFgr882ab+6WjN+C7-DT7K6Hh9YvtWPUFQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Apr 2019 17:46:40 -0700
Message-ID: <CAMKF1spQGuWJciPmj=gPFmTCoGg0tQoNRbBc5RKYqdpwWfteig@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking] libowfat: update to 0.32
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
X-List-Received-Date: Wed, 10 Apr 2019 00:47:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 9, 2019 at 5:39 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sun, Apr 7, 2019 at 6:09 AM Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
> >
> > Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> > ---
> >  .../ncp/{libowfat_0.31.bb => libowfat_0.32.bb}                | 4 ++--
>
> This is causing ncp build failure
>
> | ncp.c:8:10: fatal error: 'dns.h' file not found
> | #include "dns.h"
> |          ^~~~~~~
> | 1 error generated.
> | make: *** [<builtin>: ncp.o] Error 1
> | make: *** Waiting for unfinished jobs....
>
> Can you check why dns.h can't be found ?
>

On further look at
https://www.fefe.de/libowfat/changes-0.32.txt
the build now puts the headers in libowfat/ already
so removing setting INCLUDEDIR in libowfat recipe helps
something like this

--- a/meta-networking/recipes-support/ncp/libowfat_0.32.bb
+++ b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
@@ -19,7 +19,7 @@ EXTRA_OEMAKE = "\
 do_install() {
     make install \
         DESTDIR=${D} \
-        INCLUDEDIR=${includedir}/${BPN} \
+        INCLUDEDIR=${includedir} \
         LIBDIR=${libdir} \
         MAN3DIR=${mandir}/man3
 }

Can you send a v2 ?


> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta-networking/recipes-support/ncp/{libowfat_0.31.bb => libowfat_0.32.bb} (84%)
> >
> > diff --git a/meta-networking/recipes-support/ncp/libowfat_0.31.bb b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
> > similarity index 84%
> > rename from meta-networking/recipes-support/ncp/libowfat_0.31.bb
> > rename to meta-networking/recipes-support/ncp/libowfat_0.32.bb
> > index 4b072f7e7..fba35526d 100644
> > --- a/meta-networking/recipes-support/ncp/libowfat_0.31.bb
> > +++ b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
> > @@ -7,8 +7,8 @@ LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
> >
> >  SRC_URI = "https://www.fefe.de/${BPN}/${BP}.tar.xz"
> > -SRC_URI[md5sum] = "120798fab86cfd72dc6b12284d248dd0"
> > -SRC_URI[sha256sum] = "d1e4ac1cfccbb7dc51d77d96398e6302d229ba7538158826c84cb4254c7e8a12"
> > +SRC_URI[md5sum] = "ee015ccf45cb2bc61c942642038c2bdc"
> > +SRC_URI[sha256sum] = "f4b9b3d9922dc25bc93adedf9e9ff8ddbebaf623f14c8e7a5f2301bfef7998c1"
> >
> >  EXTRA_OEMAKE = "\
> >      DIET= \
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

