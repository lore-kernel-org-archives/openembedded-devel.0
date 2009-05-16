Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1M5ETW-0001sy-Uy
	for openembedded-devel@openembedded.org; Sat, 16 May 2009 09:38:31 +0200
Received: (qmail 32496 invoked by uid 813007); 16 May 2009 07:31:28 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 16 May 2009 07:31:28 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 May 2009 09:31:24 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc3-00005-g51bc6b7-dirty; KDE/4.2.2;
	x86_64; ; )
References: <C62896630644CE43BF64B0FF0AC27F0E05AF1C@mail.ad.skymv.com>
In-Reply-To: <C62896630644CE43BF64B0FF0AC27F0E05AF1C@mail.ad.skymv.com>
MIME-Version: 1.0
Message-Id: <200905160931.25224.marcin@juszkiewicz.com.pl>
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
X-List-Received-Date: Sat, 16 May 2009 07:38:31 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia sobota, 16 maja 2009 o 01:22:46 Chuck Kamas napisa=C5=82(a):
> Hi all,
>
> I am trying to compile a very small kernel.  To do this I have a few
> kernel modules I would like in the root file system.  But when I load
> OE I see that there are no kernel modules in the fs.  I found a way
> to include them by adding a RDEPENDS line with
> kernel-module-i2c-core. This places it in the rootfs.  My question is
> there a better, automatic way, to have all kernel modules included in
> the rootfs?

"kernel-modules" package depends on all packages with kernel modules.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




