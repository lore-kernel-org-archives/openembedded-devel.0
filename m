Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GYPe3-0006S5-Sw
	for openembedded-devel@openembedded.org; Fri, 13 Oct 2006 18:12:23 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k9DG5qZS023635 for <openembedded-devel@openembedded.org>;
	Fri, 13 Oct 2006 18:05:53 +0200
Message-ID: <452FB977.1090702@dominion.kabel.utwente.nl>
Date: Fri, 13 Oct 2006 18:06:15 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
References: <452B5D2B.3000806@dominion.kabel.utwente.nl>
	<1160736442.21755.89.camel@gandalf.tm.informatik.uni-frankfurt.de>
In-Reply-To: <1160736442.21755.89.camel@gandalf.tm.informatik.uni-frankfurt.de>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] removing pre-modular X from .dev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Oct 2006 16:12:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael 'Mickey' Lauer schreef:
>> A number of users have been seeing problems with their builds due to mixing pre-modular X
>> stuff with Xorg 7.x stuff. I want to propose the following:
>>
>>   'Remove all pre-modular X servers, libraries, proto's and extentsions from .dev'
> 
> That's a good proposal. It is very inconevient to our users having to
> choose between so many possible ways to end up with non-building stuff.
> We have a branch where pre-modular Xorg builds fine and we have an SCM
> for a reason.
> 
> Yank it!

The patch doing so is here: http://ewi546.ewi.utwente.nl/tmp/die-pre-xorg-die.diff
Let me know if that deletes too much :)

regards,

Koen



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFL7l3MkyGM64RGpERArtDAJ45E4dG4sr+pZUyRWQKC7R5YL3zwgCfQh8c
fDdIwM61zo+d7t19q9s/hog=
=B4g5
-----END PGP SIGNATURE-----


