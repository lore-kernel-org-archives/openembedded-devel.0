Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1PzTxR-00060o-0x
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 14:06:42 +0100
Received: from server ([unknown] [71.164.183.134]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LI300EGLLJTPW00@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	15 Mar 2011 07:04:41 -0500 (CDT)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 2DB772; Tue, 15 Mar 2011 07:04:35 -0500
Received: from [192.168.1.11] by rkmorris.us with HTTP; Tue,
	15 Mar 2011 07:04:34 -0500
From: Russell Morris <openembedded@rkmorris.us>
Date: Tue, 15 Mar 2011 07:04:34 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1300190674277005500@rkmorris.us>
In-reply-to: <1300177015.3759.3.camel@mattotaupa>
References: <1300156772037897500@rkmorris.us>
	<1300177015.3759.3.camel@mattotaupa>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 5
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [solved] OpenEmbedded (Wiki) Web Site Down
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
X-List-Received-Date: Tue, 15 Mar 2011 13:06:42 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Yep, it's working again here now also - thanks!

... Russell

On Tue, Mar 15, 2011 03:16  AM, Paul Menzel <paulepanter@users.sourceforge=
.net> wrote:

>=20
Dear Russell,
>=20
>=20
> Am Montag, den 14.03.2011, 21:39 -0500 schrieb Russell Morris:
>=20
> > Just a heads up, but the Wiki / site seems to be down. Here is the err=
or message that I receive (tried from two different PC's, on two different =
networks),
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > Database error
> >=20
> > A database error has occurred
> > Query: SELECT lc_value FROM `l10n_cache` WHERE lc_lang =3D 'en' AND lc=
_key =3D 'deps' LIMIT 1=20
> > Function: LCStore_DB::get
> > Error: 1146 Table 'oe_mediawiki.l10n_cache' doesn't exist (10.10.10.7)
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> it works for me now, so I guess the problem has been fixed.
>=20
>=20
> Thanks,
>=20
> Paul
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
From paulepanter@users.sourceforge.net Tue Mar 15 14:12:28 2011
Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PzU32-00069K-K2 for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 14:12:28 +0100
Received: from f053032095.adsl.alicedsl.de ([78.53.32.95]
	helo
