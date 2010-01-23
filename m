Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYhOM-00061y-W2 for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 15:55:18 +0100
Received: from g225137047.adsl.alicedsl.de ([92.225.137.47]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYhMA-00047F-MW for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 14:52:58 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201001231056.17675.holger+oe@freyther.de>
References: <201001230943.24210.holger+oe@freyther.de>
	<201001231056.17675.holger+oe@freyther.de>
Date: Sat, 23 Jan 2010 15:53:05 +0100
Message-ID: <1264258385.21187.29.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Patchwork Workflow improvement
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
X-List-Received-Date: Sat, 23 Jan 2010 14:55:18 -0000
X-Groupsio-MsgNum: 16094
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-uY1F4JDdW9FGGemWf/fV"

--=-uY1F4JDdW9FGGemWf/fV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Holger,


Am Samstag, den 23.01.2010, 10:56 +0100 schrieb Holger Hans Peter Freyther:
> On Saturday 23 January 2010 09:43:24 Holger Hans Peter Freyther wrote:

[=E2=80=A6]

> I have pushed "holger/staging-branch" to the server. It does contain all=20
> patches from patchwork that are still applying. Please go through the bra=
nch=20
> and cherry-pick or follow up on the emails..

if I understood correctly you mean with =C2=BBpatches from patchwork that a=
re
still applying=C2=AB that the mbox file can be applied with `git am` as
`pw-am.sh` does [1].

That requires that all patches are submitted using `git send-email`,
which has been suggested lately on this list by several people, or that
everyone uses a MUA which provides easy handling of mbox files created
by `git format-patch`. Is that correct?

I will start a separate thread regarding `git send-email`.

> I also have a new version of the=20
> program I use attached... I will probably switch it to use pwclient in th=
e=20
> future.

Thank you for your effort and bringing up `pwclient`. It is so sad, that
there exists a lot of tools and stuff one does not know about which
could safe work and time for oneself. I wonder why others projects did
not face the same problems yet. Probably every project or developers
wrote her/his own scripts (as OE did with `pw-am.sh`) and everyone
reinvents the wheel.


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php/Patchwork
[2] http://wiki.openembedded.net/index.php/Commit_Policy

--=-uY1F4JDdW9FGGemWf/fV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktbDVEACgkQPX1aK2wOHVjzSACeOYRoo5P7EtCWNy9E2cB7m7RF
II4AoIbABiZiI/pAakC4LCnSjKILRM2M
=LUiO
-----END PGP SIGNATURE-----

--=-uY1F4JDdW9FGGemWf/fV--
