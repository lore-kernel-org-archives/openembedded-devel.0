Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HNsD3-0004Cm-W5
	for openembedded-devel@openembedded.org; Sun, 04 Mar 2007 16:01:59 +0100
Received: from [172.20.0.21] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l24F17Lr032404 for <openembedded-devel@openembedded.org>;
	Sun, 4 Mar 2007 16:01:07 +0100
Message-ID: <45EADF33.1060409@dominion.kabel.utwente.nl>
Date: Sun, 04 Mar 2007 16:01:07 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <45E77A73.5020800@protium.com>	<45E7F2C4.9030300@dominion.kabel.utwente.nl>	<1172949738.5942.57.camel@localhost.localdomain>	<45EA86BE.2030002@dominion.kabel.utwente.nl>	<1173005960.5832.17.camel@localhost.localdomain>	<45EAAE13.4070308@dominion.kabel.utwente.nl>
	<1173019764.11398.143.camel@localhost.localdomain>
In-Reply-To: <1173019764.11398.143.camel@localhost.localdomain>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev rootfs_ipk: as per OE, policy:	remove feed management tools
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
X-List-Received-Date: Sun, 04 Mar 2007 15:02:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Matthias Hentges schreef:
> Am Sonntag, den 04.03.2007, 12:31 +0100 schrieb Koen Kooi:

>> Assuming the above didn't break, what about this:
>>
>> 'bitbake package-index' will generate a deploy/bogofeed, everything else stays as it is now.
> 
> My reverted cset did exactly the above, it didn't even so much as touch
> your holy new ipk directory.

But you put it in do_rootfs, where it doesn't belong.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF6t8yMkyGM64RGpERAtJyAKCLvpQRXnPVj5fN1A6mmbHtCGfBbgCgqEHU
gPSso5b2k0TVv/uT9cFlRfk=
=DODQ
-----END PGP SIGNATURE-----


