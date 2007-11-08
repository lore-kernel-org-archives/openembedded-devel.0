Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Iq7gz-0002i0-Of
	for openembedded-devel@openembedded.org; Thu, 08 Nov 2007 14:45:09 +0100
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lA8Di5Yk030827 for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Nov 2007 14:44:05 +0100
Message-ID: <473312A2.9010702@student.utwente.nl>
Date: Thu, 08 Nov 2007 14:44:02 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1IpXlZ-0004u8-1Y@linuxtogo.org>	<74d0deb30711070226u29479070te5f20880b1616aac@mail.gmail.com>	<4731B63E.6030806@student.utwente.nl>
	<c384c5ea0711071350i5533901cuf22da42e78b25dfb@mail.gmail.com>
In-Reply-To: <c384c5ea0711071350i5533901cuf22da42e78b25dfb@mail.gmail.com>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	lA8Di5Yk030827
Subject: Re: [oe-commits] org.oe.dev rm_work: only remove ${S}, leave temp and install alone
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Nov 2007 13:45:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg schreef:
> Hello Koen,
>=20
> On 11/7/07, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> pHilipp Zabel schreef:
>>> On 11/7/07, koen commit <openembedded-commits@lists.openembedded.org>=
 wrote:
>>>> rm_work: only remove ${S}, leave temp and install alone
>>> Why? Leaving image/ and install/ alone seriously decreases rm_work's
>>> space saving powers.
>> It does, but it's needed for our new packaged-staging frameworks, and =
I
>> did mention this change two weeks ago (20071027) on oe-devel ml and
>> noone objected[*].
>> Koen
>>
>> [*] read: "no response at all", which I have started interpreting as
>> "You rock! Go ahead!".
>>
> You rock! Go ahead!
>=20
> Disk space: $1/GB

The dollar is down down to =E2=82=AC0.18? Time to order some stuff from t=
he
states ;)


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHMxKOMkyGM64RGpERAqOkAJ9I02TSHAYFkZcMeH2iEaBgL2bgSgCgoiCJ
Xyy+BEKri+pU86OCNLeTB0c=3D
=3DPxp5
-----END PGP SIGNATURE-----


