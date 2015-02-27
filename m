Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 3729972491
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 20:42:08 +0000 (UTC)
Received: (qmail 30398 invoked by uid 1003); 27 Feb 2015 20:42:09 -0000
Received: from unknown (HELO ?10.16.32.77?)
	(philip@opensdr.com@209.234.137.234)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	27 Feb 2015 20:42:09 -0000
Message-ID: <54F0D69F.1090209@balister.org>
Date: Fri, 27 Feb 2015 12:42:07 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <54ED1B78.4040101@balister.org> <20150227083113.GF2309@jama>
In-Reply-To: <20150227083113.GF2309@jama>
Subject: Re: [meta-oe][dizzy]Update PyQt and related recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Feb 2015 20:42:13 -0000
X-Groupsio-MsgNum: 54544
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="PjjJ52Q5TrXUG55Ma0S71NGhCLMt3S0cF"

--PjjJ52Q5TrXUG55Ma0S71NGhCLMt3S0cF
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 02/27/2015 12:31 AM, Martin Jansa wrote:
> On Tue, Feb 24, 2015 at 04:46:48PM -0800, Philip Balister wrote:
>> Please pull these three patches into meta-oe/dizzy.
>>
>> https://github.com/openembedded/meta-oe/pull/19
>>
>> These lead to a working PyQt4, which will reduce the number of questio=
ns
>> I get about gnuradio-companion not working on dizzy.
>=20
> I'm not sure if we should do upgrades in release branch which should
> receive only bug fixes, but I'll let daisy maintainers to decide.

Basically, what is in dizzy doesn't work for anyone. To make it work, we
need to upgrade to pickup some changes that made pyqt easier to cross
compile.

Philip


>=20
>> 1) I apologize for using the meta-oe repo instead of meta-openembedded=
=2E
>> 2) If this is annoying, I can send via email like a sane person.
>>
>> Philip
>>
>> --=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
>=20
>=20


--PjjJ52Q5TrXUG55Ma0S71NGhCLMt3S0cF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJU8NagAAoJEMDJd4rr0merM3kIAK1QvCVs7URYbIcm4dYybQJ6
UcLI4cimqYxteFvDYYHo0Q7mQuFLW17/k0s4B+P8xNGBjpOvn+G/gazkHHsO7P1w
siwXz5/Wi0JaGpUMJ5p4CLq2R6HEgiqudJ4K18eRvutzBJAg3MnZZf2QEhl8B30u
XskpV7R5KzRC5swF9xqf8oknJ9V1uo7JV5eQ0kyhFwaWVSWfZtZ5oj/G40r/yxf1
3LuFV9+FO8FkXu1s5ICDyU/sz+QX6szfHBL7owewXTu6PuV7wLxWoijBcIt1M2SL
Ty+jfjPGxoeKwlYM48Y6vqIFDrmdcXT/9iklaN1ceYzmZmhz/i2xhvEecXW3sEQ=
=j2Bu
-----END PGP SIGNATURE-----

--PjjJ52Q5TrXUG55Ma0S71NGhCLMt3S0cF--
