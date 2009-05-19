Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1M6V0O-0006x2-U7
	for openembedded-devel@openembedded.org; Tue, 19 May 2009 21:29:41 +0200
Received: (qmail 29606 invoked by uid 813007); 19 May 2009 19:22:16 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 19 May 2009 19:22:16 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 May 2009 21:22:09 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc3-00005-g51bc6b7-dirty; KDE/4.2.2;
	x86_64; ; )
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>
	<20090518201707.GL23842@smtp.west.cox.net>
	<200905191924.17002.khimov@altell.ru>
In-Reply-To: <200905191924.17002.khimov@altell.ru>
MIME-Version: 1.0
Message-Id: <200905192122.10014.marcin@juszkiewicz.com.pl>
Subject: Re: [oe-commits] Roman I Khimov : (e)glibc-package: fix	kernel version passed to qemu
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
X-List-Received-Date: Tue, 19 May 2009 19:29:41 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia wtorek, 19 maja 2009 o 17:24:16 Roman I Khimov napisa=C5=82(a):

> Ported OE QEMU patches to 0.10.3, apart from two:
>
> revert_arm_tcg.patch.gz
> qemu-n800-support.patch
>
> Just don't know why the first was needed and the second requires some
> real effort to update to 0.10.3. Could be interesting to hear
> something about those.

I would drop both and test do binary locales works for ARM targets (as=20
this is main use of qemu-native). n800 support is merged into qemu,=20
revert_arm_tcg.patch removed qemu new code generator for ARM.


Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




