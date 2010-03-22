Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1NtawN-0004Vi-5a
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 07:16:47 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1NtatL-0000RT-Fz
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 09:13:36 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 09:10:53 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <1269211675-15854-1-git-send-email-enrico.scholz@informatik.tu-chemnitz.de>
In-Reply-To: <1269211675-15854-1-git-send-email-enrico.scholz@informatik.tu-chemnitz.de>
MIME-Version: 1.0
Message-Id: <201003220910.59623.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rm_work.bbclass: reordered 'rm $dir -rf' arguments
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
X-List-Received-Date: Mon, 22 Mar 2010 06:16:47 -0000
X-Groupsio-MsgNum: 17910
Content-Type: multipart/signed; boundary="nextPart1714990.IOGG0lXJMU";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1714990.IOGG0lXJMU
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: base64

0JIg0YHQvtC+0LHRidC10L3QuNC4INC+0YIg0J/QvtC90LXQtNC10LvRjNC90LjQuiAyMiDQvNCw
0YDRgtCwIDIwMTAgMDE6NDc6NTUg0LDQstGC0L7RgCBFbnJpY28gU2Nob2x6INC90LDQv9C40YHQ
sNC7Ogo+IFVzaW5nIGFuICdybSAtcmYgJGRpcicgb3JkZXJpbmcgaXMgbW9yZSBwb3J0YWJsZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBFbnJpY28gU2Nob2x6IDxlbnJpY28uc2Nob2x6QGluZm9ybWF0
aWsudHUtY2hlbW5pdHouZGU+CgpBY2tlZC1ieTogUm9tYW4gSSBLaGltb3YgPGtoaW1vdkBhbHRl
bGwucnU+CgotLSAKIGh0dHA6Ly9yb21hbi5raGltb3YucnUKbWFpbHRvOiByb21hbkBraGltb3Yu
cnUKZ3BnIC0ta2V5c2VydmVyIGhrcDovL3N1YmtleXMucGdwLm5ldCAtLXJlY3Yta2V5cyAweEU1
RTA1NUMzCg==

--nextPart1714990.IOGG0lXJMU
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkunCfMACgkQXJ70z+XgVcNbFwCfTDB5pqgw2gmVp7v2iMr8Sd8r
eEUAoMY/eGxN1aRBJmzX2/Qgx65DvnUf
=F28p
-----END PGP SIGNATURE-----

--nextPart1714990.IOGG0lXJMU--
