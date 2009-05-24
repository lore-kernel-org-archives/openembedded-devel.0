Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1M8IsY-0005ST-1p
	for openembedded-devel@openembedded.org; Sun, 24 May 2009 20:57:04 +0200
Received: (qmail 21379 invoked by uid 813007); 24 May 2009 18:49:06 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 24 May 2009 18:49:06 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 May 2009 20:49:29 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc6-00082-g7aff192-dirty; KDE/4.2.2;
	x86_64; ; )
References: <20090522213142.GF23842@smtp.west.cox.net>
In-Reply-To: <20090522213142.GF23842@smtp.west.cox.net>
MIME-Version: 1.0
Message-Id: <200905242049.30726.marcin@juszkiewicz.com.pl>
Subject: Re: Kernel recipes with broken PRs now
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
X-List-Received-Date: Sun, 24 May 2009 18:57:14 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia pi=C4=85tek, 22 maja 2009 o 23:31:43 Tom Rini napisa=C5=82(a):
> Hey all.  With the MACHINE_KERNEL_PR stuff, the following recipes
> will now revert to r0 rather than:

One solution is to set PR after 'inherit kernel'. But thats workaround.

Other would be checking is MACHINE_KERNEL_PR !=3D 'r0' and use it as PR.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




