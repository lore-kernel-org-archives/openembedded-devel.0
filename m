Received: from [193.33.178.145] (helo=inhex.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dion@inhex.net>) id 1JZvxl-0005aX-UY
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Mar 2008 23:31:54 +0100
Received: from laptop.vpn ([192.168.250.6]:44327 helo=laptop.deb)
	by inhex.net with esmtp (Exim 4.63) (envelope-from <dion@inhex.net>)
	id 1JZvt8-0005HF-LN for openembedded-devel@lists.openembedded.org;
	Fri, 14 Mar 2008 00:27:04 +0200
Received: from dion by laptop.deb with local (Exim 4.69)
	(envelope-from <dion@inhex.net>) id 1JZvvl-0005un-0M
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Mar 2008 00:29:45 +0200
Date: Fri, 14 Mar 2008 00:29:44 +0200
From: Dmitry Nezhevenko <dion@inhex.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080313222944.GA17236@laptop.deb>
References: <f96d234e0803110712t6d88dfc6t521fdf39081e2c76@mail.gmail.com>
	<20080311145739.GN30267@ibawizard.net>
	<1205250588.4521.111.camel@dax.rpnet.com>
	<20080312014945.4783ae6a@widy.localdomain>
	<1205280598.16531.26.camel@dax.rpnet.com>
	<20080312024408.44d9192e@widy.localdomain>
	<c384c5ea0803121138r4bf89729t18c530b67e80c107@mail.gmail.com>
	<fr997r$aat$1@ger.gmane.org>
	<1205356290.4530.7.camel@dax.rpnet.com>
	<87ejaf1v4x.fsf@frontier.dottedmag.net>
MIME-Version: 1.0
In-Reply-To: <87ejaf1v4x.fsf@frontier.dottedmag.net>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
X-SA-Exim-Connect-IP: 193.33.178.145
X-SA-Exim-Mail-From: dion@inhex.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Mar 2008 22:31:55 -0000
X-Groupsio-MsgNum: 4645
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline

--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2008 at 03:37:34AM +0600, Mikhail Gusarov wrote:
> Twas brillig at 21:11:30 12.03.2008 UTC+00 when Richard Purdie did gyre a=
nd gimble:
>=20
>  >> while with hg it's just 'hg serve'.
>  RP> How do two hg servers interact?
>=20
> They don't. It's a pull-, not push-model.
>=20

However it's possible to create hook that will send command to remote
server after repository update (for example via ssh with public-key auth.)
to pull changes from master.

--=20
WBR, Dmitry

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH2arY0T/aIlRaJQYRAqJzAJ4oRoNPPVoAicff9hWUTIFJAagmqwCdFEPp
rDKxsxV5caUSmZZckoQq9cw=
=tKFZ
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
