Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xrcalvar@igalia.com>) id 1OWsGE-000453-MT
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jul 2010 16:39:36 +0200
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AlAQAH1+NUxbdWOb/2dsb2JhbACTbIYdgQSGEcERhSUE
X-IronPort-AV: E=Sophos;i="4.53,558,1272837600"; 
	d="asc'?scan'208";a="739830361"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 08 Jul 2010 16:33:38 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1OWsAT-0000EJ-Hz
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jul 2010 16:33:37 +0200
Received: from ip128.dynamic.igalia.com ([192.168.10.128])
	by mail.igalia.com with esmtps 
	(Cipher SSL3.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1OWsAT-0006YZ-3C for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jul 2010 16:33:37 +0200
From: Xabier Rodriguez Calvar <xrcalvar@igalia.com>
To: openembedded-devel@lists.openembedded.org
Organization: Igalia, S.L.
Date: Thu, 08 Jul 2010 16:33:09 +0200
Message-ID: <1278599589.24868.8.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 212.51.32.151
X-SA-Exim-Mail-From: xrcalvar@igalia.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: u-boot_git sakoman
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
X-List-Received-Date: Thu, 08 Jul 2010 14:39:36 -0000
X-Groupsio-MsgNum: 20812
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-eD97JogX/E/ZfneAV5VD"

--=-eD97JogX/E/ZfneAV5VD
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hi everybody,

I am trying to build u-boot for omapzoop, but it seems that it cannot
download the specified git repository, which is
git://www.sakoman.net/git/u-boot-omap3.git .

Does anybody know why it is down? Do you know what I should use instead?

Br

--=20
Xabier Rodr=EDguez Calvar
Enxe=F1eiro en Inform=E1tica
IGALIA http://www.igalia.com

--=-eD97JogX/E/ZfneAV5VD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkw14aAACgkQnOMkPTyqZPQjxgCfVMwGbgLS+quXtaMvwLlXlJx0
pfgAn2c7rPUdzRA7ndTSIw+eD2M4Jr/s
=TEhG
-----END PGP SIGNATURE-----

--=-eD97JogX/E/ZfneAV5VD--
