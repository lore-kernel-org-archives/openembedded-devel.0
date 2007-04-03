Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HYeoy-00066i-Dd
	for openembedded-devel@openembedded.org; Tue, 03 Apr 2007 10:56:56 +0200
Received: from [130.89.138.60] (wlan138060.mobiel.utwente.nl [130.89.138.60])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l338uqox022562 for <openembedded-devel@openembedded.org>;
	Tue, 3 Apr 2007 10:56:52 +0200
Message-ID: <461216D1.1010705@dominion.kabel.utwente.nl>
Date: Tue, 03 Apr 2007 10:56:49 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <46121476.1030609@4g-systems.com>
In-Reply-To: <46121476.1030609@4g-systems.com>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: DosFStools mirror missing
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
X-List-Received-Date: Tue, 03 Apr 2007 08:56:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Patrick Fischer schreef:
> Andre Renaud wrote:
>> The mirror for DosFSTools,
>> ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools/dosfstools-${PV}.src.tar.gz
>>
>>
>> appears to be down at the moment. Using the Debian mirror however works
>> fine. Attached is an alternative bitbake package which uses the debian
>> mirror system to do the download, which should be much more robust.

INHERIT += "angstrom-mirrors" will give you access to
http://www.angstrom-distribution.org/unstable/sources/dosfstools-2.10.src.tar.gz

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGEhbRMkyGM64RGpERAq/hAJ4iwCuplFH+7N9PEcpz+FVaUgBxggCfUBCW
qfKzKPmH9Mr+4XeJZZO3jDo=
=pt74
-----END PGP SIGNATURE-----


