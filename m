Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HK8Ie-00012m-AA
	for openembedded-devel@openembedded.org; Thu, 22 Feb 2007 08:23:32 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1M7NSox017815 for <openembedded-devel@openembedded.org>;
	Thu, 22 Feb 2007 08:23:29 +0100
Message-ID: <45DD44EF.30504@dominion.kabel.utwente.nl>
Date: Thu, 22 Feb 2007 08:23:27 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1HFb2e-0007GK-Jp@linuxtogo.org>	<45D9CFF7.8060502@kernelconcepts.de>	<1908706584.20070220225528@gmail.com>	<1172009681.5884.108.camel@localhost.localdomain>	<45DCD020.1050002@kernelconcepts.de>
	<1172105348.5790.71.camel@localhost.localdomain>
In-Reply-To: <1172105348.5790.71.camel@localhost.localdomain>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev xserver-common	1.13:	Re-add	calibrate-only-if-ts.patch after merge.
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
X-List-Received-Date: Thu, 22 Feb 2007 07:23:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Thu, 2007-02-22 at 00:05 +0100, Florian Boor wrote:
>> Richard Purdie wrote:

> I didn't and don't want to spend time having to justify whatever changes
> we make in poky in that area to OE/GPE/whoever. I can guarantee I've
> already spent more time in this thread than any time I've spent
> maintaining that "fork". I say "fork" as I'm not blocking changes
> passing to/from poky, I actively encourage it and if I made any
> fundamental changes useful to upstream I would pass them on. I just know
> we need certain changes in Poky but I know upstream won't like certain
> changes and therefore I choose not to sync them. Some of the changes
> we're discussing originated in poky which kind of proves my point :-(.

FWIW, I synced back 'upstream' changes to the xserver-kdrive-common in OE, and I plan to
do the reverse when I get some time. So no fixes are getting lost and we all can be happy
using whichever version we want :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF3UTvMkyGM64RGpERAk3xAJ9y4wCHLuXkFExKF+kBactvpeNnfQCZAUnO
TIADUi5+67peDzNgeCdOaKE=
=dIg8
-----END PGP SIGNATURE-----


