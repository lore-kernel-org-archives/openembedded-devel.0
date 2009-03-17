Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LjZ3N-0005kQ-3g
	for openembedded-devel@openembedded.org; Tue, 17 Mar 2009 14:10:05 +0100
Received: (qmail 20316 invoked by uid 813007); 17 Mar 2009 13:09:12 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 17 Mar 2009 13:09:12 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Mar 2009 14:09:10 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc7-00188-gebdcc81-dirty; KDE/4.2.1;
	x86_64; ; )
References: <1237246365-32076-1-git-send-email-denis@denix.org>
In-Reply-To: <1237246365-32076-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
Message-Id: <200903171409.14650.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] rename packages/ to recipes/ per earlier agreement
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
X-List-Received-Date: Tue, 17 Mar 2009 13:10:08 -0000
X-Groupsio-MsgNum: 8479
Content-Type: multipart/signed; boundary="nextPart2295193.cIkiAJSHrZ";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2295193.cIkiAJSHrZ
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia wtorek, 17 marca 2009 o 00:32:41 Denys Dmytriyenko napisa=C5=82(a):
> Renaming packages/ directory to recipes/, as one of the several
> structural changes, was proposed by Koen[1] and agreed/approved by
> many. Since Koen currently doesn't have time/ability to do the
> change, and some people are too eager to wait any longer, he asked me
> to do it. Please ack/nack.
>
> [1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/21326
>
> Denys Dmytriyenko (3):
>   rename packages/ to recipes/ per earlier agreement
>   recipes: fix hardcoded instances of packages/
>   base.bbclass: fix base_get_scmbasepath() to look for recipes/ and
>     fall back to packages/ while parsing BBFILES

Acked-By: Marcin Juszkiewicz <hrw@openembedded.org>

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

--nextPart2295193.cIkiAJSHrZ
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkm/oPcACgkQeQ6MlGH/2qu3IgCfWKJSnmTk2s9oyPBUzIWz/KBI
O0UAnRnDZAvVRzsWJYYAwTA92AF+7UPE
=QO8e
-----END PGP SIGNATURE-----

--nextPart2295193.cIkiAJSHrZ--
