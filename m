Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NWrPh-0007IM-3n
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2010 14:13:04 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NWrNX-0000vD-JW
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2010 13:10:47 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NWrNX-0007py-Bs
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2010 13:10:47 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hj09k8$km$1@ger.gmane.org>
References: <1263760344-26105-1-git-send-email-eric@eukrea.com>
	<hivtt3$v2r$1@ger.gmane.org>
	<1263763723.5353.16.camel@mattotaupa.wohnung.familie-menzel.net>
	<hj09k8$km$1@ger.gmane.org>
Date: Mon, 18 Jan 2010 13:10:43 +0000
Message-ID: <1263820243.3675.560.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] barebox: Add recipe for this new bootloader
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
X-List-Received-Date: Mon, 18 Jan 2010 13:13:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-01-18 at 01:22 +0100, Rolf Leggewie wrote:
> Paul Menzel wrote:
> >> Setting PR is relatively minor, but lets stay consistent :)=20
> >=20
> > Could someone please change this in the manual please [1].
> >=20
> > =C2=BBIt is good practice to always define PR in your recipes, even for=
 the
> > "r0" release, so that when editing the recipe it is clear that the PR
> > number needs to be updated.=C2=AB
>=20
> I think it's safe to say that there are two factions with regard to PR
> being set to r0.  And as you can see, both have their arguments in
> favor.  Even though it may sound like it, Koen's position is not the
> only one.  And I guess, neither one is official.

Yes, I think that's an accurate summary of the situation.  I think the
only way we will get a definitive answer would be to have the TSC hand
down a judgement on the matter.

p.




