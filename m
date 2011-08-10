Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1QqwxP-0000NU-9G
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Aug 2011 02:47:40 +0200
Received: from server ([unknown] [173.74.34.213]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LPO00FVUSN3WY30@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	09 Aug 2011 19:42:44 -0500 (CDT)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 2B13EA; Tue, 09 Aug 2011 19:42:33 -0500
Received: from [192.168.1.5] by rkmorris.us with HTTP; Tue,
	09 Aug 2011 19:42:32 -0500
From: Russell Morris <openembedded@rkmorris.us>
Date: Tue, 09 Aug 2011 19:42:32 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1312936952840869500@rkmorris.us>
In-reply-to: <4E40AF8B.4080103@gmail.com>
References: <1312858153686306500@rkmorris.us> <4E40AF8B.4080103@gmail.com>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 1
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: ISO-Codes Build Failing
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
X-List-Received-Date: Wed, 10 Aug 2011 00:47:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,
I'd be more than happy to - but I admit, I'm a bit lost in meta-openembedd=
ed. I'm working off OpenEmbedded ... and don't understand the new meta- ite=
ms, and also can't find this recipe there ... :-(.
Thanks,... Russell


On Mon, 08/08/2011 10:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 08/08/2011 07:49 PM, Russell Morris wrote:
> > Hi,
> >=20
> > I have been trying to build angstrom-x-image, but it fails - at
> > iso-codes. The issue may be because Verizon FIOS is now blocking FTP
> > (as more and more ISP's are), but in any case I created a new recipe
> > to correct this (and it works). How do I get this change in to the
> > official OpenEmbedded build (or can I even?)?
> >=20
> > Also ... what is the official OE path? I admit, now with
> > OpenEmbedded, core, etc. - it's getting a bit confusing ... :-(. It
> > really seems like (base?) OpenEmbedded is getting quite out of date,
> > but I could be wrong.
> >=20
>=20
> send patches for meta-openembedded to add the recipe that will make it
> into the new layered metadata based distros.
>=20
>=20
> > On to gs next (which seems to be failing during the do_configure
> > stage).
> >=20
> > Thanks, ... Russell
> >=20
> > _______________________________________________ Openembedded-devel
> > mailing list Openembedded-devel@lists.openembedded.org=20
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20
> - --
> >=20
> - -Khem
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (GNU/Linux)
>=20
> iEYEARECAAYFAk5Ar4sACgkQuwUzVZGdMxQEYgCffYNw/R3mvw8XZQ8NkOxqKKgO
> Nv0An0g0n9S6r/vW/vKG0HrZ5ktvEgQu
> =3DHSTm
> -----END PGP SIGNATURE-----
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
From agnel.joel@gmail.com Wed Aug 10 03:49:29 2011
Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>)
	id 1QqxvF-0001vk-2H; Wed, 10 Aug 2011 03:49:29 +0200
Received: by eyb7 with SMTP id 7so565086eyb.18
	for <multiple recipients>; Tue, 09 Aug 2011 18:44:59 -0700 (PDT)
DKIM-Signature: v
