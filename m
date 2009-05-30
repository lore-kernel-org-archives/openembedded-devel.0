Received: from [195.135.220.2] (helo=mx1.suse.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mhrusecky@suse.cz>) id 1MAUZw-0007HQ-U5
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 May 2009 21:50:52 +0200
Received: from relay2.suse.de (mail2.suse.de [195.135.221.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.suse.de (Postfix) with ESMTP id EFC035362F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2009 21:42:19 +0200 (CEST)
Date: Sat, 30 May 2009 21:42:15 +0200
From: Michal Hrusecky <mhrusecky@suse.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090530194215.GA1186@misibook.miska.isageek.net>
References: <20090529233958.GA16815@misibook.miska.isageek.net>
	<200905301417.14796.bluelightning@bluelightning.org>
	<gvrgts$7uc$2@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gvrgts$7uc$2@ger.gmane.org>
X-Operating-System: WindowsKiller Linux
User-Agent: Mutt - the best e-mail client in the world
Subject: Re: [PATCH] zuc: fixed build
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
X-List-Received-Date: Sat, 30 May 2009 19:50:53 -0000
X-Groupsio-MsgNum: 10857
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline

--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Rolf Leggewie - 23:47 30.05.09 wrote:
> Paul Eggleton wrote:
> > On Sat, 30 May 2009, Michal Hrusecky wrote:
> >> Corrected include name so it can be found and package can be built aga=
in.
>=20
> > Applied, thanks.
>=20
> do_fetch fails for this package.  Can you guys please look into this?

You are right, it seems like sources are no longer available on original
URL. I got them in my download directory. I found that it has
sourceforge pages. There is some downloadable version but it is older
then version which was on URL in bitbake file. Will try to contact
original author and if he wouldn't respond, will try to merge it
somehow...

--=20
Michal Hrusecky

Package Maintainer
SUSE LINUX, s.r.o
e-mail: mhrusecky@suse.cz

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEARECAAYFAkohjBcACgkQJkqfF/7WVvZcOQCeKKNSXqNn7M8EnSZpQDf8WdZw
70YAnA3U77hsgU3lPaszvUDI1QvkFj+f
=p7Tj
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
