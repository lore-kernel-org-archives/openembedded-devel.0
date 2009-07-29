Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MW4sp-0007oi-FF
	for openembedded-devel@openembedded.org; Wed, 29 Jul 2009 10:51:35 +0200
Received: (qmail 27205 invoked by uid 813007); 29 Jul 2009 08:36:42 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 29 Jul 2009 08:36:41 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Jul 2009 10:36:33 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4-00009-g83a3792-dirty; KDE/4.2.96;
	x86_64; ; )
References: <4A6FD077.1060001@gmail.com> <h4ou1e$s42$1@ger.gmane.org>
In-Reply-To: <h4ou1e$s42$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200907291036.35562.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH] remove duplicated code from linux.inc
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
X-List-Received-Date: Wed, 29 Jul 2009 08:51:35 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia =C5=9Broda, 29 lipca 2009 o 09:34:05 Koen Kooi napisa=C5=82(a):
> NAK, this breaks the resulting kernel-image ipk

So we have to check why this code has to be duplicated.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




