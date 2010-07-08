Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1OWmEw-0001FM-1Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jul 2010 10:14:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id E3B8140005564
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jul 2010 10:08:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id DC1184001F936
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jul 2010 10:08:48 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3cqf6rZ3VGpL
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jul 2010 10:08:48 +0200 (CEST)
Received: from [192.168.4.51] (entw2.tarent.buero [192.168.4.51])
	by ugs.tarent.de (Postfix) with ESMTPSA id A7A0740005564
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jul 2010 10:08:48 +0200 (CEST)
Message-ID: <4C3587D9.7000905@gmx.net>
Date: Thu, 08 Jul 2010 10:10:01 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100423 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C3437D7.8050505@gmx.net>
In-Reply-To: <4C3437D7.8050505@gmx.net>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: thebohemian@gmx.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_FAIL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] GCC 4.3.1 unbuildable due to unapplyable patches - remove it then?
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
X-List-Received-Date: Thu, 08 Jul 2010 08:14:09 -0000
X-Groupsio-MsgNum: 20801
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig8F05643AD0C4CBE2293DB3BE"

--------------enig8F05643AD0C4CBE2293DB3BE
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Just FYI: Henning Heinold fixed that problem and made 4.3.1 buildable aga=
in:

http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3Daf6fac4f74=
b3b2b6c11e73870f84e3af7562d385

Regards,
Robert

Am 07.07.2010 10:16, schrieb Robert Schuster:
> Hi,
> GCC 4.3.1 does not build for an ARM target because a patch does not fit=
=2E
> So I assume that no one is really interested in that version of GCC
> anymore and would remove it then if nobody fixes the patch situation:
>
> http://tinderbox.openembedded.net/public/logs/task/6443736.txt
>
> Regards,
> Robert
>
>  =20
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>  =20


--------------enig8F05643AD0C4CBE2293DB3BE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkw1h9sACgkQG9cfwmwwEtrNxwCfYCSdZZnlyywNpEW7F0HDRbdT
JsAAmQHx4u5AMG1NCGmBNCdtYAfT+5xy
=klhr
-----END PGP SIGNATURE-----

--------------enig8F05643AD0C4CBE2293DB3BE--
