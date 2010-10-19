Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1P86cK-0006BQ-9n
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 09:28:18 +0200
Received: (qmail 10829 invoked by uid 813007); 19 Oct 2010 07:27:41 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 19 Oct 2010 07:27:40 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Oct 2010 09:27:26 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.35-22-generic; KDE/4.5.2; x86_64; ; )
References: <201010151039.08619.marcin@juszkiewicz.com.pl>
	<20101018201429.GA818@boggieman>
In-Reply-To: <20101018201429.GA818@boggieman>
MIME-Version: 1.0
Message-Id: <201010190927.27217.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: remove old kernels
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
X-List-Received-Date: Tue, 19 Oct 2010 07:28:19 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia poniedzia=C5=82ek, 18 pa=C5=BAdziernika 2010 o 22:14:29 Kristoffer Eri=
cson=20
napisa=C5=82(a):
> > 2. Drop kernels older then 2.6.20 - it was over 3 years ago so if someo=
ne
> > uses older one then probably also uses 3 years old OE.=20
>=20
> Not sure that this is a good idea really. As an example, the best kernel
> for the hp6xx is the 2.6.17 (yes its old I know, but everything works).
> For the hp7xx its currently 2.6.19 (although its changing shortly to
> 2.6.34).

Thats why I wrote "if you care about something raise your hand". As you are=
=20
maintainer of hp[67]xx machines and you know that 2.6.17/19 are best for th=
em=20
then they stay.
=20
> So how about putting the limit somewhat lower :) ? Like 2.6.15?

How about 2.2.2 one?

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




