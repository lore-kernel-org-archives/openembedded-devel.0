Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1P5JHV-0002ny-1x
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 16:23:19 +0200
Received: (qmail 24495 invoked by uid 813007); 11 Oct 2010 14:22:40 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 11 Oct 2010 14:22:40 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Oct 2010 16:24:34 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.35-22-generic; KDE/4.5.2; x86_64; ; )
References: <AANLkTi=qFpjK39fB7NzZ-aTBfasWBjq5LBxKSbG9dWec@mail.gmail.com>
	<201010111109.38439.marcin@juszkiewicz.com.pl>
	<AANLkTi=ZKTqZGhV-qK14+ckj_tNkAwDB-SAcVSvuo9Gg@mail.gmail.com>
In-Reply-To: <AANLkTi=ZKTqZGhV-qK14+ckj_tNkAwDB-SAcVSvuo9Gg@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201010111624.34772.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: zsafe
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
X-List-Received-Date: Mon, 11 Oct 2010 14:23:20 -0000
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Dnia poniedzia=B3ek, 11 pa=BCdziernika 2010 o 13:46:06 Frans Meulenbroeks=20
napisa=B3(a):
> 2010/10/11 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>:

> > Dropping that FILES_zsafe =3D "zsafe" line may be safe - but I would
> > suggest doing build to check it.
>=20
> As someone who never played with opie, I'll leave it to an expert.

"bitbake zsafe" should work for any device in OE. Do Angstrom arm build.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




