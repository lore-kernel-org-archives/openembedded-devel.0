Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <g.eismann@gmx.net>) id 1M5GCV-0001nH-4D
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 May 2009 11:29:03 +0200
Received: (qmail invoked by alias); 16 May 2009 09:21:59 -0000
Received: from 247.70.222.87.dynamic.jazztel.es (EHLO inferno.localnet)
	[87.222.70.247]
	by mail.gmx.net (mp067) with SMTP; 16 May 2009 11:21:59 +0200
X-Authenticated: #21729387
X-Provags-ID: V01U2FsdGVkX1/WP2B3QhbWd03Ki+XaW7j26CNr8MBJhdEnQVQc24
	obvxaVA2hfYnut
From: "G. Eismann" <g.eismann@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 May 2009 11:21:55 +0200
User-Agent: KMail/1.11.3 (Linux/2.6.28-11-generic; KDE/4.2.3; i686; ; )
References: <C62896630644CE43BF64B0FF0AC27F0E05AF1C@mail.ad.skymv.com>
	<200905160931.25224.marcin@juszkiewicz.com.pl>
In-Reply-To: <200905160931.25224.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Message-Id: <200905161121.55689.g.eismann@gmx.net>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.58,0.57
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Kernel modules
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
X-List-Received-Date: Sat, 16 May 2009 09:29:03 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On S=C3=A1bado 16 Mayo 2009 09:31:24 Marcin Juszkiewicz escribi=C3=B3:
> Dnia sobota, 16 maja 2009 o 01:22:46 Chuck Kamas napisa=C5=82(a):
> > Hi all,
> >
> > I am trying to compile a very small kernel.  To do this I have a few
> > kernel modules I would like in the root file system.  But when I load
> > OE I see that there are no kernel modules in the fs.  I found a way
> > to include them by adding a RDEPENDS line with
> > kernel-module-i2c-core. This places it in the rootfs.  My question is
> > there a better, automatic way, to have all kernel modules included in
> > the rootfs?
>
> "kernel-modules" package depends on all packages with kernel modules.
>

BTW, is there any way to install the modules but not the kernel image?
I have the kernel in a separate partition, so I don't need it into the root=
fs.

Regards
=2D-=20
  - Eismann -

