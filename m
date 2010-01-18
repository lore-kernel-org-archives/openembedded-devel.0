Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NWscR-00072M-E4
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2010 15:30:18 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o0IENjfg009701 for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2010 14:23:45 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id e8VhAfoT0r5f
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2010 14:23:45 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o0IENfun009678
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2010 14:23:43 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1263820243.3675.560.camel@mill.internal.reciva.com>
References: <1263760344-26105-1-git-send-email-eric@eukrea.com>
	<hivtt3$v2r$1@ger.gmane.org>
	<1263763723.5353.16.camel@mattotaupa.wohnung.familie-menzel.net>
	<hj09k8$km$1@ger.gmane.org>
	<1263820243.3675.560.camel@mill.internal.reciva.com>
Date: Mon, 18 Jan 2010 14:28:16 +0000
Message-Id: <1263824896.26227.112.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	o0IENjfg009701
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
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
X-List-Received-Date: Mon, 18 Jan 2010 14:30:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-01-18 at 13:10 +0000, Phil Blundell wrote:
> On Mon, 2010-01-18 at 01:22 +0100, Rolf Leggewie wrote:
> > Paul Menzel wrote:
> > >> Setting PR is relatively minor, but lets stay consistent :)=20
> > >=20
> > > Could someone please change this in the manual please [1].
> > >=20
> > > =C2=BBIt is good practice to always define PR in your recipes, even=
 for the
> > > "r0" release, so that when editing the recipe it is clear that the =
PR
> > > number needs to be updated.=C2=AB
> >=20
> > I think it's safe to say that there are two factions with regard to P=
R
> > being set to r0.  And as you can see, both have their arguments in
> > favor.  Even though it may sound like it, Koen's position is not the
> > only one.  And I guess, neither one is official.
>=20
> Yes, I think that's an accurate summary of the situation.  I think the
> only way we will get a definitive answer would be to have the TSC hand
> down a judgement on the matter.

That would seem sensible if only to lay this matter to rest once and for
all! It would also be good to test the TSC processes...

Cheers,

Richard





