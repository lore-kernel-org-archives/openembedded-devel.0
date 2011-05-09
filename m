Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QJMZu-00031x-TQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 11:16:34 +0200
Received: from [2001:638:602:1183:4da:ff61:f5c:b7b4] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QJMXH-0000MF-42 by authid <stefan@sostec.de> with srv_auth_cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 11:13:53 +0200
Received: from stefan by excalibur.local with local (Exim 4.75)
	(envelope-from <stefan@excalibur.local>) id 1QJMXF-000066-2Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 11:13:49 +0200
Date: Mon, 9 May 2011 11:13:48 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110509091348.GA32544@excalibur.local>
References: <cover.1304925139.git.stefan@buglabs.net>
	<dda8ff6c3b7e006ed3114bc7de15dbf8b1742313.1304925139.git.stefan@buglabs.net>
	<1304931412.3791.2.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1304931412.3791.2.camel@mattotaupa>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: [PATCH 2011.03-maintenance 1/7] icedtea6-native_1.7.10: Remove reference to deleted patch.
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
X-List-Received-Date: Mon, 09 May 2011 09:16:35 -0000
X-Groupsio-MsgNum: 31786
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline

--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello.

On Mon, 2011-05-09 at 10:56, Paul Menzel wrote:
>=20
> Am Montag, den 09.05.2011, 09:29 +0200 schrieb Stefan Schmidt:
> > From: Stefan Schmidt <stefan@buglabs.net>
> >=20
> > During my cherry-pick of Henning's patch from master I somehow b0rked t=
he commit
> > by loosing this hunk that also deletes the reference to the deleted pat=
ch file.
>=20
> why is not it possible to fix the borked commit using `git rebase` or
> just squash this patch and Hennings and resend the pull request?

Because the broken commit was in my _last_ pull request which already
is pulled into the 2011.03 maintenance branch.

As this is a public branch we can't rebase it and thus I'm going with
an incremental fix. Hope that clears it up. Maybe the changelog should
have been more clear that I meant an old commit already sitting in the
tree.

Normally I squash and rebase a lot on non-public or temp branches. :)

regards
Stefan Schmidt

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: http://www.datenfreihafen.org/contact.html

iEYEARECAAYFAk3HsEwACgkQbNSsvd31FmXx9ACgiRb805NZ0UW620FtsMzH+Huq
bSMAoLyjUuL/BdYhv517nEMZxyJPhrWw
=YMz9
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
