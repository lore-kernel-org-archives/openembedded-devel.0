Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QHhDM-0003bS-5t for openembedded-devel@lists.openembedded.org;
	Wed, 04 May 2011 20:54:24 +0200
Received: from f053033156.adsl.alicedsl.de ([78.53.33.156]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QHhBr-0004Ra-NA for openembedded-devel@lists.openembedded.org;
	Wed, 04 May 2011 18:52:51 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DC18572.7010203@eukrea.com>
References: <1304358039-20934-1-git-send-email-christian.charreyre@cioinfoindus.fr>
	<1304499401.4127.53.camel@mattotaupa> <4DC17203.607@eukrea.com>
	<1304527727.20079.6.camel@mattotaupa>  <4DC18572.7010203@eukrea.com>
Date: Wed, 04 May 2011 20:51:46 +0200
Message-ID: <1304535106.20079.12.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH v4] mypaint: new recipe for version 0.9.1
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
X-List-Received-Date: Wed, 04 May 2011 18:54:24 -0000
X-Groupsio-MsgNum: 31625
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-c7l3X/ASbU2ZaKXa3LrU"

--=-c7l3X/ASbU2ZaKXa3LrU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Eric,


Am Mittwoch, den 04.05.2011, 18:57 +0200 schrieb Eric B=C3=A9nard:

> On 04/05/2011 18:48, Paul Menzel wrote:
> > Am Mittwoch, den 04.05.2011, 17:34 +0200 schrieb Eric B=C3=A9nard:
> >> On 04/05/2011 10:56, Paul Menzel wrote:
> >>> Please remember to add what build configuration you used. (You can ju=
st
> >>> paste it from the BitBake output.)
> >>
> >> You asked this several times on the list but this part is not in the c=
ommit
> >> log policy : http://wiki.openembedded.org/index.php/Commit_log_example
> >
> > I know and therefore I do *not* NACK patches and even commit them if th=
e
> > build configuration is not in the commit message. Still I think it
> > belongs to useful commit messages to be able to reproduce something and
> > therefore I am asking for it.
> >
> maybe this information could go under the commit log, between two --- lin=
es as=20
> this makes git log more difficult to read and this information in mostly=
=20
> useful for patch review.

In my opinion it is not so important for the review but for later bug
tracking.

Take the following example.

	$ git log recipes/prboom/

Why did those compilation fixes needed to be applied. Knowing what
distribution and machine was used I could conclude what other versions
of recipes were used and do some debugging.


Thanks,

Paul

--=-c7l3X/ASbU2ZaKXa3LrU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3BoEIACgkQPX1aK2wOHVhBTACfXmFOOEjPahEN7NIiQYi33VSh
dIIAnic1nj4A0pKBNmVj/mi3pGSTKPni
=kLNs
-----END PGP SIGNATURE-----

--=-c7l3X/ASbU2ZaKXa3LrU--
