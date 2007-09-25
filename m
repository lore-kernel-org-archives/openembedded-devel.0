Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IaCD7-0008Gk-Rw
	for openembedded-devel@openembedded.org; Tue, 25 Sep 2007 17:20:29 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8PFFqxW006202 for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2007 17:15:53 +0200
Message-ID: <46F9262B.3040008@student.utwente.nl>
Date: Tue, 25 Sep 2007 17:15:55 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <46F587F7.4060501@balister.org>	<D61182AC8012EA4EBC531B3AF23BE1093F1639@tranzeo-mail2.12stewart.tranzeo.com>
	<1190722797.46f8fced3640a@www.emile.com>
In-Reply-To: <1190722797.46f8fced3640a@www.emile.com>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: How should OE be used?
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
X-List-Received-Date: Tue, 25 Sep 2007 15:20:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Stelios Koroneos schreef:
>> I tried using OE, but could not get it to complete a build for PowerPC
>> 405 (neither uclibc or glibc - both failed but in different ways.
>> Uclibc gets cross compiler badness errors - I think it is part of this
>> powerpc vs ppc stuff in Linux).  After days of frustration, I had to
>> bail out and use buildroot for this particular project instead.
>> Obviously OE has lots of ARM and x86 users, but the PPC support falls
>> behind because it isn't as popular.  I'll check back for a later
>> project.
>>
> 
> Well, not sure when you tried it, what distro etc but the ppc405 targets in OE
> work :)
> 
> Infact i am giving a presentation today at the Power.org developer conference in
> Austin on powerpc/OE
> 
> As we needed a stable tree for our devices/projects we have our distro called
> OPLinux and OPlinux-uclibc with gcc 4.1.1 glibc 2.5 or uclibc 0.9.28
> We push the changes back to OE on a regular bases and recently provided Koen
> with a 405 board so he can do more test on Angstrom which uses newer versions
> of gcc/uclibc.
> If you (or any other) want a copy of what we use just let me know. 

I'm fairly sure gcc 4.1.2 and 4.2.1 are busted, they can't compile glibc, eglibc and
uclibc. I'll try to look into it next week.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG+SYrMkyGM64RGpERAtUpAJ9zu8zHb9An4DJsgC/fm6AMaGcN+wCeJj/L
hXHntnJV2ZPNcYr51FmghsA=
=sx7p
-----END PGP SIGNATURE-----


