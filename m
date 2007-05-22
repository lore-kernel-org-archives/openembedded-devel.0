Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HqPjz-0003ya-LW
	for openembedded-devel@openembedded.org; Tue, 22 May 2007 10:29:11 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l4M8SHox019617 for <openembedded-devel@openembedded.org>;
	Tue, 22 May 2007 10:28:18 +0200
Message-ID: <4652A9A0.6060109@dominion.kabel.utwente.nl>
Date: Tue, 22 May 2007 10:28:16 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <4651EFEE.50907@atmel.com>	<189F751D-9A54-4A17-84FD-82CD2BF62403@gmx.net>	<003a01c79c29$1985a690$26031a0a@atmel.com>
	<f2u7if$5g3$1@sea.gmane.org>
In-Reply-To: <f2u7if$5g3$1@sea.gmane.org>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: ERROR: Task 2246 ( ...org.openembedded.dev/packages/gnome/gnome-desktop_2.16.1.bb, do_compile) failed
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
X-List-Received-Date: Tue, 22 May 2007 08:29:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Rolf Leggewie schreef:
> Ulf Samuelsson wrote:
>> Been trying to fetch all packages in advance by 
>>
>> $ bitbake -c fetch gpe-image
>>
>> but that does not work.
> 
> You want bitbake -c fetchall gpe-image

Actually, no. With angstrom you want 'bitbake -c fetchall angstrom-x11-image'

regards,

KOen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGUqmgMkyGM64RGpERArd8AJ96Hc/IqpB0nHLyNOSlImfhs6AbcQCdFGJS
ok7J/m0QH6pWYgfm1Qww0y0=
=tovE
-----END PGP SIGNATURE-----


