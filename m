Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1NtJeo-0006j5-HN
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Mar 2010 12:49:30 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1NtJbn-0007Gq-VP
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Mar 2010 14:46:21 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Mar 2010 14:43:43 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <1239889359-13953-1-git-send-email-khimov@altell.ru>
	<20100319214907.GN2425@xora-desktop.xora.org.uk>
	<bd4a003f1003191643m15c0aa40id914236ef35ce037@mail.gmail.com>
In-Reply-To: <bd4a003f1003191643m15c0aa40id914236ef35ce037@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201003211443.46205.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cmake.bbclass: force CMAKE_INSTALL_SO_NO_EXE to be0
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
X-List-Received-Date: Sun, 21 Mar 2010 11:49:30 -0000
X-Groupsio-MsgNum: 17903
Content-Type: multipart/signed; boundary="nextPart1383961.fRtb4id5mx";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1383961.fRtb4id5mx
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: base64

0JIg0YHQvtC+0LHRidC10L3QuNC4INC+0YIg0KHRg9Cx0LHQvtGC0LAgMjAg0LzQsNGA0YLQsCAy
MDEwIDAyOjQzOjUwINCw0LLRgtC+0YAgQXNoIENoYXJsZXMg0L3QsNC/0LjRgdCw0Ls6Cj4gQWNr
ZWQtYnk6IEFzaCBDaGFybGVzIDxhc2hjaGFybGVzQGdtYWlsLmNvbT4KCtCSINGB0L7QvtCx0YnQ
tdC90LjQuCDQvtGCINCS0L7RgdC60YDQtdGB0LXQvdGM0LUgMjEg0LzQsNGA0YLQsCAyMDEwIDEw
OjA1OjA3INCw0LLRgtC+0YAgS2hlbSBSYWog0L3QsNC/0LjRgdCw0Ls6Cj4gQWNrZWQtYnk6IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CgpUaGFua3MsIHB1c2hlZC4KCi0tIAogaHR0cDov
L3JvbWFuLmtoaW1vdi5ydQptYWlsdG86IHJvbWFuQGtoaW1vdi5ydQpncGcgLS1rZXlzZXJ2ZXIg
aGtwOi8vc3Via2V5cy5wZ3AubmV0IC0tcmVjdi1rZXlzIDB4RTVFMDU1QzMK

--nextPart1383961.fRtb4id5mx
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkumBnIACgkQXJ70z+XgVcOHUgCcD4gi4eN12QXFK15sFycMN+18
ECcAoMXrS508wVOH95wMCkyipJYMSZgO
=WZQ0
-----END PGP SIGNATURE-----

--nextPart1383961.fRtb4id5mx--
