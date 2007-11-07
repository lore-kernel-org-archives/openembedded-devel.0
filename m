Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IpkUP-0004n4-2A
	for openembedded-devel@openembedded.org; Wed, 07 Nov 2007 13:58:37 +0100
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lA7CvaUo018734 for <openembedded-devel@lists.openembedded.org>;
	Wed, 7 Nov 2007 13:57:36 +0100
Message-ID: <4731B63E.6030806@student.utwente.nl>
Date: Wed, 07 Nov 2007 13:57:34 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1IpXlZ-0004u8-1Y@linuxtogo.org>
	<74d0deb30711070226u29479070te5f20880b1616aac@mail.gmail.com>
In-Reply-To: <74d0deb30711070226u29479070te5f20880b1616aac@mail.gmail.com>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
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
X-List-Received-Date: Wed, 07 Nov 2007 12:58:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

pHilipp Zabel schreef:
> On 11/7/07, koen commit <openembedded-commits@lists.openembedded.org> wrote:
>> rm_work: only remove ${S}, leave temp and install alone
> 
> Why? Leaving image/ and install/ alone seriously decreases rm_work's
> space saving powers.

It does, but it's needed for our new packaged-staging frameworks, and I
did mention this change two weeks ago (20071027) on oe-devel ml and
noone objected[*].

regards,

Koen

[*] read: "no response at all", which I have started interpreting as
"You rock! Go ahead!".

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHMbY+MkyGM64RGpERApexAKCRIz4+80Nzpt/ZNW8rxcl60EY79ACgmnkn
xKsYIEY/eMwOOV4YaPxmWxE=
=+lnU
-----END PGP SIGNATURE-----


