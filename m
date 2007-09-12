Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IVNrW-0002b1-Qa
	for openembedded-devel@openembedded.org; Wed, 12 Sep 2007 10:46:18 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8C8h2xW011922 for <openembedded-devel@openembedded.org>;
	Wed, 12 Sep 2007 10:43:02 +0200
Message-ID: <46E7A69A.4060407@student.utwente.nl>
Date: Wed, 12 Sep 2007 10:43:06 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <HOECLKEKOHLAMMGDLLBHGENPMDAA.skoroneos@digital-opsis.com>
	<46E79AFE.9040304@xora.org.uk>
In-Reply-To: <46E79AFE.9040304@xora.org.uk>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: Task-base is big :(
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
X-List-Received-Date: Wed, 12 Sep 2007 08:46:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Graeme Gregory schreef:
> Stelios Koroneos wrote:
>> True.
>> As more people start to use OE and as these people would be mostly
>> interested in "vertical" solutions (develop an app or add apps to an
>> existing distro without having to rebuild everything) i think we need to
>> have a closer look at the OE SDK vs build everything from scratch.
>> Having a "standard" toolchain availiable (and the way to use it) for people
>> that are not interested in developing distro's would IMHO provide additional
>> "user friendliness" and make OE an even more attractive solution.
>>   
> I personally think this discussion is a clear example of why Koen's
> work on packaged staging needs to be finished.

There's a proof of concept patch at http://bugs.openembedded.org/show_bug.cgi?id=2948,
which needs at least a cleanup to make it possible to use .debs.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG56aaMkyGM64RGpERAnWnAJwO1+ZDriFctPSwHCJC+Oh6GMBCcQCfd1DZ
BSDeSMHVTjCr5h+8OSl9Z7g=
=JRez
-----END PGP SIGNATURE-----


