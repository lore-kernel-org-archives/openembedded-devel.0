Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Nbt85-0004Wg-Gx
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 11:03:40 +0100
Received: (qmail 5863 invoked by uid 813007); 1 Feb 2010 10:01:13 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Feb 2010 10:01:13 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 1 Feb 2010 11:00:54 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc5-00011-gf6760aa; KDE/4.3.4; x86_64; ;
	)
References: <> <1265015418-8090-1-git-send-email-camelguo@gmail.com>
In-Reply-To: <1265015418-8090-1-git-send-email-camelguo@gmail.com>
MIME-Version: 1.0
Message-Id: <201002011100.55371.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] chumby-kernel: add a patch to remove hard setting CROSS_COMPILE from Makefile
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
X-List-Received-Date: Mon, 01 Feb 2010 10:03:40 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia poniedzia=C5=82ek, 1 lutego 2010 o 10:10:18 Guo Hongruan napisa=C5=82(=
a):
> * linux-2.6.16-chumby-1.2.tar.gz set CROSS_COMPILE as arm-linux- hardly.
> * It causes the AR used to compile chumby-kernel is arm-linux-, but it
>  should be set dynamically * according CROSS_COMPILE passed by openembedd=
ed
>=20
> Signed-off-by: Guo Hongruan <camelguo@gmail.com>

pushed

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




