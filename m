Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jluebbe@lasnet.de>) id 1MlLh4-0005He-2a
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 13:50:37 +0200
Received: from f053154035.adsl.alicedsl.de ([78.53.154.35]
	helo=[192.168.178.36]) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1MlLgE-0004E4-Lr by authid <jluebbe@lasnet.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Sep 2009 13:50:09 +0200
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jluebbe@lasnet.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <431b13f90909032334u268006d1t88fa437d76883be8@mail.gmail.com>
References: <431b13f90909021248y7e0cc019pfb388fe9b3d2fc8e@mail.gmail.com>
	<20090903113150.GA22344@rhein.zuhause.netz>
	<431b13f90909031309l2cf9bea0rae96d4b015776682@mail.gmail.com>
	<20090903231617.GA27116@rhein.zuhause.netz>
	<431b13f90909032334u268006d1t88fa437d76883be8@mail.gmail.com>
Date: Wed, 09 Sep 2009 13:49:41 +0200
Message-Id: <1252496981.5429.15.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: jluebbe@lasnet.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] add nzbget and libpar2
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
X-List-Received-Date: Wed, 09 Sep 2009 11:50:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

On Fri, 2009-09-04 at 08:34 +0200, Artur Wronowski wrote:
> +EXTRA_OECONF =3D "--with-tlslib=3DOpenSSL \
> +               --with-libcurses-libraries=3D${STAGING_LIBDIR} \
> +               --with-libcurses-includes=3D${STAGING_INCDIR} \
> +               --with-libpar2-libraries=3D{STAGING_INCDIR} \
> +               --with-libpar2-includes=3D{STAGING_INCDIR} \
> +               --with-openssl-libraries=3D{STAGING_INCDIR} \
> +               --with-openssl-includes=3D{STAGING_INCDIR}"

missing $ in some lines

> +EXTRA_OECONF =3D "--with-tlslib=3DOpenSSL \
> +               --with-libcurses-libraries=3D${STAGING_LIBDIR} \
> +               --with-libcurses-includes=3D${STAGING_INCDIR} \
> +               --with-libpar2-libraries=3D{STAGING_INCDIR} \
> +               --with-libpar2-includes=3D{STAGING_INCDIR} \
> +               --with-openssl-libraries=3D{STAGING_INCDIR} \
> +               --with-openssl-includes=3D{STAGING_INCDIR}"

same

--=20
Jan L=C3=BCbbe <jluebbe@lasnet.de>            http://sicherheitsschwankung.=
de
 gpg-key      1024D/D8480F2E 2002-03-20
 fingerprint  1B25 F91F 9E7B 5D4F 1282  02D6 8A83 8BE4 D848 0F2E



