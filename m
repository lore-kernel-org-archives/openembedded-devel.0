Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1ROPS2-0006kZ-5q
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 08:53:34 +0100
Received: from ad.chargestorm.se (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server (TLS) id 8.3.137.0;
	Thu, 10 Nov 2011 08:47:17 +0100
Date: Thu, 10 Nov 2011 08:47:17 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20111110074717.GC3933@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <201111092321.33622.schnitzeltony@gmx.de>
MIME-Version: 1.0
In-Reply-To: <201111092321.33622.schnitzeltony@gmx.de>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: systemd packages -> image
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Nov 2011 07:53:34 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Andreas M=FCller <schnitzeltony@gmx.de> [111109 23:17]:
> Imagine a recipe is included into an image by a task and later gets syste=
md-
> native support.
> How about forcing the packages in SYSTEMD_PACKAGES packed into images in =
case=20

> IMAGE_INIT_MANAGER  =3D "systemd"

> is found in the image definition?

Sure, that sounds like a nice idea. Although, in that case, SysV-init
files should probably also be packaged in separate packages and be
installed in a similar manner.

Cheers,
Anders

--=20
Anders Darander
ChargeStorm AB / eStorm AB


