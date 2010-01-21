Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NY2S1-0002I3-FA for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 20:12:20 +0100
Received: from f053040193.adsl.alicedsl.de ([78.53.40.193]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NY2Pq-0002NB-L8 for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 19:10:02 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B584559.1090704@balister.org>
References: <1264067024.3695.14.camel@mattotaupa.wohnung.familie-menzel.net>
	<201001211102.11252.holger+oe@freyther.de>
	<883120D4-C490-4713-B872-F02376E88CEE@vanille-media.de>
	<4B584559.1090704@balister.org>
Date: Thu, 21 Jan 2010 20:10:01 +0100
Message-ID: <1264101001.3163.11.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Getting patches committed
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
X-List-Received-Date: Thu, 21 Jan 2010 19:12:20 -0000
X-Groupsio-MsgNum: 15977
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-eVzYbubw11ymuK4UKaZO"

--=-eVzYbubw11ymuK4UKaZO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 21.01.2010, 07:15 -0500 schrieb Philip Balister:
> On 01/21/2010 05:20 AM, Dr. Michael Lauer wrote:
> > Am 21.01.2010 um 11:02 schrieb Holger Hans Peter Freyther:
> >
> >>> 2. Is there a way to have a staging branch where all patches are
> >>> committed to, which have not been reviewed for let us say one week, t=
o
> >>> get more testing and before they go into the dev branch? Maybe it is
> >>> easier for people to at least test build such a branch?
> >>
> >> Would you be interested in creating such a branch for us? I assume it =
is
> >> certainly easier to git cherry-pick a patch than to download the mbox =
and use
> >> git am..
> >
> > I fully agree. I'm neither using patchwork nor do I find patches on the=
 list a good idea.
> > I'd welcome for-oe-upstream trees that would contain patches that -- if=
 good -- we could
> > just pull from.
>=20
> I actually like patches on the list, because it makes me aware of how is=20
> doing work and keeps me aware of the kinds of things people without=20
> commit access are interested in. Also, it gives people with commit=20
> access a forum for changes they would like reviewed.
>=20
> I am not opposed to someone creating a git branch or branches created=20
> from list patches, but do not want to see the patches disappear from the=20
> list.

See my answer to Frans. The idea was to only apply those patches to the
new branch if they did not receive an answer for a certain amount of
time.

> If the patch that was sent to the list comes from git-send-patch (I hope=20
> I hve that correct) there is a script contrib/patchwork/git-am.sh that=20
> makes it really easy to apply the patch.

Thank you for this tip. Are the others developers aware of it. And if
yes and they do not use it, what are the reasons?


Thanks,

Paul

--=-eVzYbubw11ymuK4UKaZO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktYpogACgkQPX1aK2wOHVim3wCfXt2/tEMYKpvpdjpLy/blcDMD
c8AAn0VhBXtb9hI3BhE38kkvFOk46qo3
=1bp1
-----END PGP SIGNATURE-----

--=-eVzYbubw11ymuK4UKaZO--
