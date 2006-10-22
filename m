Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Gbiv6-0006Dw-J8
	for openembedded-devel@openembedded.org; Sun, 22 Oct 2006 21:23:40 +0200
Received: from [130.89.6.158] (vpn006158.vpn.utwente.nl [130.89.6.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k9MJGAFh028664 for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Oct 2006 21:16:10 +0200
Message-ID: <453BC378.1000406@dominion.kabel.utwente.nl>
Date: Sun, 22 Oct 2006 21:16:08 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <453AA01B.5040300@dominion.kabel.utwente.nl>	<453AA142.4070002@dominion.kabel.utwente.nl>	<1161538687.5545.5.camel@localhost.localdomain>	<453BB676.1020100@dominion.kabel.utwente.nl>
	<E40B9975-E36D-4C14-B6B4-7B245A3FF7DB@inf.fu-berlin.de>
In-Reply-To: <E40B9975-E36D-4C14-B6B4-7B245A3FF7DB@inf.fu-berlin.de>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [Fwd: [oe-commits] org.oe.dev	package.bbclass:	Fix	split_locales to	remove spurious	references to -dbg packages.
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
X-List-Received-Date: Sun, 22 Oct 2006 19:23:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Holger Freyther schreef:
> Am 22.10.2006 um 20:20 schrieb Koen Kooi:
> 
> 
>> It would be quite easy to write a script that looks for .debug/  
>> entries in packages, and
>> file bugs against the offending packages.
> 
> Could you check if INHERIT += insane detects these packages? I think  
> line 56 needs to be changed to path.contains('.debug')

For future reference: you need python 2.4 for that.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFO8N4MkyGM64RGpERAkoqAJ9yMheYxEzm5QdFUobYPWf8SEpz5wCgp8e5
haGCHNVdjIzaDcZ0NfUBZgA=
=q3Bu
-----END PGP SIGNATURE-----


