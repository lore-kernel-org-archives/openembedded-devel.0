Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Hmxol-0003r2-M0
	for openembedded-devel@openembedded.org; Sat, 12 May 2007 22:03:51 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l4CK2uox031006 for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 May 2007 22:02:56 +0200
Message-ID: <46461D72.4020206@dominion.kabel.utwente.nl>
Date: Sat, 12 May 2007 22:02:58 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <464613B3.8090003@dominion.kabel.utwente.nl>
	<46461B73.8070900@trolltech.com>
In-Reply-To: <46461B73.8070900@trolltech.com>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: uclibc 0.9.29 recipe
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
X-List-Received-Date: Sat, 12 May 2007 20:03:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Lorn Potter schreef:
> 
> Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hi,
>>
>>
>> I just started working on a uclibc 0.9.29 recipe, are people interested in it already, or
>> should I finish it before committing it (with DEFAULT_PREF = -1)?
>>
>> regards,
> 
> I would be, especially if it worked in an angstrom build.

I'll add it once I solved the linux-libc-headers problems. Machine and distro maintainers
need to provide their parts of the uclibc configs to make it usefull, though.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGRh1yMkyGM64RGpERApzPAJ9dHfEynAkjYtpvJC6aKwcSLcF1PQCggceU
2wDlG7EN1RNSwOJ8YjfCItk=
=Un//
-----END PGP SIGNATURE-----


