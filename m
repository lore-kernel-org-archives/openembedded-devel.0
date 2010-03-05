Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Nnecf-0001q2-6g
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 21:59:53 +0100
Received: (qmail 24945 invoked by uid 813007); 5 Mar 2010 20:56:57 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 5 Mar 2010 20:56:57 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 5 Mar 2010 21:56:34 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc7-00064-gac73fdd; KDE/4.3.4; x86_64; ;
	)
References: <E1NnZxZ-0006br-Jk@melo.openembedded.org>
	<de63f7891003050859j4835ec78od6a27f818aff710a@mail.gmail.com>
	<hmrnrv$4oc$1@dough.gmane.org>
In-Reply-To: <hmrnrv$4oc$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201003052156.35132.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Marcin Juszkiewicz : gnutls: added 2.8.5, adapted to new staging
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
X-List-Received-Date: Fri, 05 Mar 2010 20:59:53 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia pi=C4=85tek, 5 marca 2010 o 20:59:58 Koen Kooi napisa=C5=82(a):
> I haven't seen that problem, but there are more problems with 2.8.5:
>=20
> * doesn't ship the .m4 the do_install_append looks for -> build breakage

fixed.

> * doesn't ship a binconfig file anymore -> build breakage for dependant
> recipes

=46rom gnutls 2.8.0 release notes:

>> ** Old libgnutls.m4 and libgnutls-config scripts removed. Please use=20
>> pkg-config instead.


Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




