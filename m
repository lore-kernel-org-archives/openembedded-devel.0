Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IDdPD-0000iN-IU
	for openembedded-devel@openembedded.org; Wed, 25 Jul 2007 11:43:43 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l6P9gRj1008225 for <openembedded-devel@openembedded.org>;
	Wed, 25 Jul 2007 11:42:27 +0200
Message-ID: <46A71B03.8090304@dominion.kabel.utwente.nl>
Date: Wed, 25 Jul 2007 11:42:27 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <46A711DB.6000205@dominion.kabel.utwente.nl>
	<AD0B1F77-712E-4268-83C6-03CDAC55EB44@gmx.net>
In-Reply-To: <AD0B1F77-712E-4268-83C6-03CDAC55EB44@gmx.net>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Activating autotools updates
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
X-List-Received-Date: Wed, 25 Jul 2007 09:43:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Holger Freyther schreef:
> Am 25.07.2007 um 11:03 schrieb Koen Kooi:
> 
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hi,
>>
>> At guadec we discussed activating autoconf-native 2.61, pkgconfig- 
>> native 0.22 and
>> m4-native 1.4.8. The test builds we did didn't show any errors but  
>> we'd like more people
>> to try to build their favourite target and report back.
> 
> Hi Koen,
> 
> I would propose to use ipkg-diff. Do a old build, do a new build and  
> compare the resulting packages using ipkg-diff which is in oe contrib.

That would be inconclusive, since a difference might be a good thing. I'm interesting in
people running the generated packages.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGpxsDMkyGM64RGpERAqXWAJ4vtKMyEPjUkMyu8v05TYTywuAV5ACfZecw
w22KlXyXrvzpfhYFZn3HJxg=
=EhQl
-----END PGP SIGNATURE-----


