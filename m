Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Rvd9b-0007da-7C for openembedded-devel@lists.openembedded.org;
	Fri, 10 Feb 2012 00:11:52 +0100
Received: from g225175067.adsl.alicedsl.de ([92.225.175.67]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Rvd1w-0005JT-Ms; Thu, 09 Feb 2012 23:03:56 +0000
Message-ID: <1328828643.29809.7.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: Chris Tapp <opensource@keylevel.com>
Date: Fri, 10 Feb 2012 00:04:03 +0100
In-Reply-To: <DEE6B7FB-FCB8-47BF-A58B-CDD4C6BDC06D@keylevel.com>
References: <1328022931.3975.15.camel@mattotaupa>
	<DEE6B7FB-FCB8-47BF-A58B-CDD4C6BDC06D@keylevel.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Board support package (BSP) layers/distributions for Geode LX800
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
X-List-Received-Date: Thu, 09 Feb 2012 23:11:52 -0000
X-Groupsio-MsgNum: 37063
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-Y1xSoo0x1vzxAwVpThC9"

--=-Y1xSoo0x1vzxAwVpThC9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Chris and OE folks,



I am sorry for forwarding this message to the list that late.


Am Mittwoch, den 01.02.2012, 08:14 +0000 schrieb Chris Tapp:

> On 31 Jan 2012, at 15:15, Paul Menzel wrote:

> > searching for a suited build configuration for a Geode LX800 based
> > system I could only find the discussion about creating a BSP layer for
> > it [1]. Was this layer created? I could not find it anywhere.
> >
> > Additionally could you give recommendations which build =20
> > configuration is
> > suited for a Geode system? Especially with OE-Core as the base. Did
> > someone test the latest OE stuff with a Geode LX800 system recently?
>=20
> I've got a rough meta layer that I use with Yocto for the ALIX 3D3 =20
> (and similar). The aim (when I get a moment) is to make this in to a =20
> full BSP...
>=20
> I've got a modified kernel (linux-wrs 2.6.34.7) so that the ethernet, =
=20
> audio and Geode frame buffer are available and USB works.

These are great news!

> Works fine with Poky 4. I had a quick go with 5, but I ended up with =20
> an image that failed to boot. I've not looked to find out why, but I =20
> don't expect it to be anything major.
>=20
> This isn't in a suitable state to push back (to Yocto), but I'm happy =
=20
> to share what I've got if it's going to be of any help.

If you could publish your Git tree somewhere that would be great.

> Sorry for not sending this via the mailing list - the registered e-=20
> mail account is now just a forwarder and I can't get to the =20
> subscription page to change it as it's timing out. Please feel free to =
=20
> forward this to the list.

Done now. I am sorry that this took so long.



Thanks,

Paul


PS: Please keep Chris in CC and sorry Chris for sending this message
twice.


--=-Y1xSoo0x1vzxAwVpThC9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk80UOMACgkQPX1aK2wOHVgZqACeP7do9r3evif4+72AZszrZ9bl
l9YAnRScp4t5eUaWakGAMQjghwjaFxpx
=ChQg
-----END PGP SIGNATURE-----

--=-Y1xSoo0x1vzxAwVpThC9--
