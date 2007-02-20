Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HJQDJ-00036k-Va
	for openembedded-devel@openembedded.org; Tue, 20 Feb 2007 09:19:06 +0100
Received: from [172.20.0.21] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1K8J2ox029335 for <openembedded-devel@openembedded.org>;
	Tue, 20 Feb 2007 09:19:03 +0100
Message-ID: <45DAAEF4.50701@dominion.kabel.utwente.nl>
Date: Tue, 20 Feb 2007 09:19:00 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <45D98799.1080309@dominion.kabel.utwente.nl>	<200702191259.25200.openembedded@hrw.one.pl>
	<45D9984C.6090705@dominion.kabel.utwente.nl>
In-Reply-To: <45D9984C.6090705@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: splitting deploy/ipk into subarchs
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
X-List-Received-Date: Tue, 20 Feb 2007 08:19:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Marcin Juszkiewicz schreef:
>> Dnia poniedziaBek, 19 lutego 2007, Koen Kooi napisaB:
> 
>>> When using multimachine and ipkg deploy/ipk gets awfully crowded after
>>> a while. I want to propose sorting it by subarch. Attached is a patch
>>> that adds support for that to rootfs_ipk.bbclass.
>>>
>>> What do you think about that?
>> I like this idea. ipkg-make-index is slow enough already.
> 
>> Attached fixed, tested version of your rootfs_ipk.bbclass change. Also 
>> added patch to package_ipk.bbclass which will store package in proper 
>> dir.

Marcin and I merged a slightly different version of this today.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF2q70MkyGM64RGpERAjXNAJ9B2sh7Ly/KvcFkSfKNmAgXw+7VwACfbFfn
/sKicIMGzfx8EYkT/B/YR78=
=s1Iz
-----END PGP SIGNATURE-----


