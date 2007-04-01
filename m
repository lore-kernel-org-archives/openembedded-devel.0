Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HXuW8-0000os-71
	for openembedded-devel@openembedded.org; Sun, 01 Apr 2007 09:30:25 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l317UHox011802; Sun, 1 Apr 2007 09:30:18 +0200
Message-ID: <460F5F87.3060403@dominion.kabel.utwente.nl>
Date: Sun, 01 Apr 2007 09:30:15 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1HXnn8-0007Dx-JK@linuxtogo.org>
In-Reply-To: <E1HXnn8-0007Dx-JK@linuxtogo.org>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev prismstumbler: add 0.7.4pre1
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
X-List-Received-Date: Sun, 01 Apr 2007 07:30:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

florian commit schreef:
> prismstumbler: add 0.7.4pre1


> packages/prismstumbler/prismstumbler_0.7.4pre1.bb

That is against our versioning policy, this way you can't upgrade to 0.7.4 when it gets
released[1]. Use _0.7.3+0.7.4pre1 instead.

Regards,

Koen


[1] not without epoch support, but that's not meant to paper over bugs like this
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGD1+HMkyGM64RGpERAjFBAJ9Q8dl78nY+f/vm3YkqTnBntC9SJQCeN7Ho
VucIW14/SeQ597S2obc5t48=
=L5TC
-----END PGP SIGNATURE-----


