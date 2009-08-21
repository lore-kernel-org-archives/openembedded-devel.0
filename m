Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MeSxn-0002y6-8n
	for openembedded-devel@openembedded.org; Fri, 21 Aug 2009 14:11:23 +0200
Received: (qmail 27547 invoked by uid 813007); 21 Aug 2009 11:53:59 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 21 Aug 2009 11:53:59 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Aug 2009 13:53:56 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc5-00256-g8e6bcae; KDE/4.3.0; x86_64; ;
	)
References: <4A81BE84.6010607@atmel.com>
	<200908121433.31479.marcin@juszkiewicz.com.pl>
	<4A82C482.6060008@atmel.com>
In-Reply-To: <4A82C482.6060008@atmel.com>
MIME-Version: 1.0
Message-Id: <200908211353.59344.marcin@juszkiewicz.com.pl>
Subject: Re: Contents of the "origin/ulf/linux-2.6.30.2" branch. Help with testing wanted.
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
X-List-Received-Date: Fri, 21 Aug 2009 12:11:23 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia =C5=9Broda, 12 sierpnia 2009 o 15:32:50 Ulf Samuelsson napisa=C5=82(a):
> > I had to add patch to 2.12 to get rid of -fno-dwarf2-cfi-asm parametr
> > passed to GCC. Did not tested with 2.13-rc1 as at91.com is not
> > reachable.
>
> Yes, fixed in 2.13-rc1
> Will send you the source file.

2.13-rc1 gaves me non-booting board:

RomBOOT                                                                    =
                                                                           =
             =20
> *** AT91Bootstrap-2.13-rc1                                               =
                                                                           =
             =20
> AT45DB642D detected                                                      =
                                                                           =
             =20
> invalidboot                                                              =
                                                                           =
             =20
> AT45DB642D detected                                                      =
                                                                           =
             =20
> invalidboot                                                              =
                                                                           =
             =20
> AT45DB642D detected                                                      =
                                                                           =
             =20
> invalidboot                                                              =
                                                                           =
             =20

Any ideas? I have same problem when 2.12 is used. 1.14 works still.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




