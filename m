Return-Path: <gordan.markus@pelagicore.com>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9052060053
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 15:04:05 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id x137so29146076lff.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 08:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KoK78tB+ECB6i7EYfdQ73+GD41ZBzsTGJCLAyXQFoOw=;
	b=rP5EJ7EqA0Uxmy05BCICC1Sr59F9MVnLV2C3SOWzxxyTx4IK2vAg4Qu0WLlH9a8T2w
	+Y3rHw58TPH8RZw9lFLET/9MCrfKJjDUR5812OxFYc4x6THwYt4wj31pqpZ4hcAMGd/u
	2U1ScSEFdpjkm71ZRg8urmrlQWyG2QLy8d6MQu5lFN8mlyMF4MaPubyEZjRG33dkcLwz
	1TD9MYjosuwE2MAtq/afzbpryLm2WAKWfgV21Y9FN5u2TgMFZDVM+USS9xohDR2Km2+d
	xcrtCOOqNvBdPFn2CYTjfXICt8QEbFnuZrN0mW66KVTXxk7sudXn4ZiV/9WNRJjalM5N
	Attw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KoK78tB+ECB6i7EYfdQ73+GD41ZBzsTGJCLAyXQFoOw=;
	b=oqyagZhH83ceGIIS4gR3YpdyPVukQByJY7DOfHGAypy+zeXo+Dqcucjk6WBlKz/G6o
	S4jDspQa8MC7f5XCF28FcoozpilbmluxGo13M0lJ8loHITWQeCJVT1ZRhGRDkzMLAPck
	pjtUBXy2RCoKC/4uOYwTqvktBbVoBqpGaOkKUvO40sKgojUjzrAj8ICmN+29ai8mtHbs
	g8stmq0FGeR4EDxeFT0iiYKoQjqM43ZcGfQbtvZCBOoZaDtcMXpKRtpvigfrcVKWXPMz
	l8f8TbLHTU+BXaz81ob0zCYB8zIszAaJgbmoSPawiajWlqXj70m2dfPaYjLwSawfouRC
	f67A==
X-Gm-Message-State: AFeK/H2wC8Q5RIadyOcRB0Sg9mQMyupLdy+wQo61oI689z24Kx+yR4xkbCgWhkMCeYToZge0
X-Received: by 10.25.216.232 with SMTP id r101mr67859lfi.28.1490886245896;
	Thu, 30 Mar 2017 08:04:05 -0700 (PDT)
Received: from gordanmarkus-XPS13 ([83.218.80.243])
	by smtp.googlemail.com with ESMTPSA id
	2sm418820ljp.36.2017.03.30.08.04.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 30 Mar 2017 08:04:05 -0700 (PDT)
Message-ID: <1490886244.26233.2.camel@pelagicore.com>
From: Gordan =?UTF-8?Q?Marku=C5=A1?= <gordan.markus@pelagicore.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Mar 2017 17:04:04 +0200
In-Reply-To: <CA+chaQcbUmnmKN2_sGPyT4AYhb2F6qyiQQt6xOgrXMUe_szAoA@mail.gmail.com>
References: <20170323094626.6310-2-gordan.markus@pelagicore.com>
	<CA+chaQcbUmnmKN2_sGPyT4AYhb2F6qyiQQt6xOgrXMUe_szAoA@mail.gmail.com>
X-Mailer: Evolution 3.22.3-0ubuntu0.1 
Mime-Version: 1.0
Subject: Re: [meta-qt5][PATCH] qtbase-native: create empty oe-device-extra.pri
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
X-List-Received-Date: Thu, 30 Mar 2017 15:04:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Sorry about that Martin, I've made a copy/paste mistake.
Will post another version of the patch. 

On Thu, 2017-03-30 at 11:38 +0200, Martin Jansa wrote:
> it looks like the directory doesn't exist:
> 
> http://errors.yoctoproject.org/Errors/Details/138489/
> 
> On Thu, Mar 23, 2017 at 10:46 AM, Gordan Markuš <
> gordan.markus@pelagicore.com> wrote:
> 
> > Suppress multiple occurrences of the same warning while configuring
> > and compiling qtbase-native and nativesdk-qtbase.
> > 
> > WARNING: Unable to find file git/mkspecs/linux-oe-g++/../
> > oe-device-extra.pri
> > Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
> > ---
> >  recipes-qt/qt5/qtbase-native_git.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-
> > qt/qt5/qtbase-
> > native_git.bb
> > index c013029..d40a751 100644
> > --- a/recipes-qt/qt5/qtbase-native_git.bb
> > +++ b/recipes-qt/qt5/qtbase-native_git.bb
> > @@ -83,6 +83,9 @@ PACKAGECONFIG_CONFARGS = " \
> >  export OE_QMAKE_QTCONF_PATH = "foodummy"
> > 
> >  do_configure_prepend() {
> > +    # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-
> > device-extra.pri:
> > No such file or directory"
> > +    touch ${S}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/oe-device-
> > extra.pri
> > +
> >      MAKEFLAGS="${PARALLEL_MAKE}" ${S}/configure -opensource
> > -confirm-license ${PACKAGECONFIG_CONFARGS} || die "Configuring qt
> > failed.
> > PACKAGECONFIG_CONFARGS was ${PACKAGECONFIG_CONFARGS}"
> >  }
> > 
> > --
> > 2.9.3
> > 
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > 

