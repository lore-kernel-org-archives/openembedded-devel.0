Received: from cpe.ge-0-2-0-951.faaqnqu1.customer.tele.dk ([93.167.193.22]
	helo=mail.mikrofyn.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgh@sgh.dk>) id 1QLsP0-00071J-AE
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 09:39:42 +0200
Received: from koontz.localnet ([10.115.1.246]) by mail.mikrofyn.com with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 16 May 2011 09:41:50 +0200
From: =?iso-8859-1?q?S=F8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 May 2011 09:36:51 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38-9-generic; KDE/4.6.3; i686; ; )
References: <201105101555.50984.sgh@sgh.dk>
	<1305059211.9982.18.camel@mattotaupa>
	<20110515221647.GD24670@sakrah.homelinux.org>
In-Reply-To: <20110515221647.GD24670@sakrah.homelinux.org>
MIME-Version: 1.0
Message-Id: <201105160936.51355.sgh@sgh.dk>
X-OriginalArrivalTime: 16 May 2011 07:41:50.0609 (UTC)
	FILETIME=[B7C86010:01CC139C]
Subject: Re: acpid-1.0.10-r5.1 fails compilation
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
X-List-Received-Date: Mon, 16 May 2011 07:39:42 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Mandag 16 maj 2011 00:16:47 skrev Khem Raj:
>=20
> code paths are different between arm and x86. Apply this patch=20
>=20
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D616194#15
>=20
> and if it helps then post a patch for OE
>=20

I changed the code like that too before the weekend. I was afraid to post i=
t because a successfull compilation
is not a guarantee that it behaves correctly. Thanks, I'll post the change.

=2D-=20
S=F8ren Holm


