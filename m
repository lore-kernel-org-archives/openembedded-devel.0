Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>)
	id 1IPrOl-0003lO-G9; Tue, 28 Aug 2007 05:05:56 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7S3411R014637; Tue, 28 Aug 2007 05:04:01 +0200
Message-ID: <46D390C3.5060002@dominion.kabel.utwente.nl>
Date: Tue, 28 Aug 2007 05:04:35 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1IPpOO-0001sJ-O8@linuxtogo.org>
In-Reply-To: <E1IPpOO-0001sJ-O8@linuxtogo.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] org.oe.dev add midori, a lightweight web browser based on webkit-gtk
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
X-List-Received-Date: Tue, 28 Aug 2007 03:05:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

mickeyl commit schreef:
> add midori, a lightweight web browser based on webkit-gtk

One recipe for midori isn't enough?!?!

koen@ubuntu:/media/hda4/OE/org.openembedded.dev/packages/gtk-webcore$ mtn log midori*
- --no-merges --no-graph
- -----------------------------------------------------------------
Revision: 19b3553f698a014d63c349b2723f835295c7b5da
Ancestor: 6d7ffa8639429361a773bc0b2834f143afea7a5d
Author: koen@openembedded.org
Date: 2007-08-23T08:07:40
Branch: org.openembedded.dev

Added files:
        packages/gtk-webcore/midori_0.0.5.bb

ChangeLog:

midori: update to 0.0.5


- -----------------------------------------------------------------
Revision: 910ef122d7ad65e399a502c31d5b798bf1068134
Ancestor: feb4e917e8c95268e0e117b5d46b9f6853adaa15
Author: koen@openembedded.org
Date: 2007-08-12T08:02:44
Branch: org.openembedded.dev

Modified files:
        packages/gtk-webcore/midori_0.0.4.bb
        packages/openmoko2/openmoko-feedreader2_svn.bb

ChangeLog:

midori, openmoko-feedreader2: catch up with webkit rename


- -----------------------------------------------------------------
Revision: 9e087391c8502ad6b8bdacdc9b39102f881b0a10
Ancestor: a6c6c8ca65ec928720b71675d12198c489833b73
Author: koen@openembedded.org
Date: 2007-08-10T14:31:20
Branch: org.openembedded.dev

Added files:
        packages/gtk-webcore/midori_0.0.4.bb

ChangeLog:

midori: add 0.0.4 (now based on webkit instead of gtk-webcore)


- -----------------------------------------------------------------
Revision: c293cc4e6d77cae86deaaf6f134d6640daa2f04c
Ancestor: 11f7fe52979b2ee9abafdfceeca3addb08ec96ce
Author: koen@openembedded.org
Date: 2007-07-22T15:23:55
Branch: org.openembedded.dev

Added files:
        packages/gtk-webcore/midori_0.0.3.bb

ChangeLog:

midori: update to 0.0.3
* is still using gtk-webcore instead of webkitgdk


- -----------------------------------------------------------------
Revision: 730a1eb946899965bd1703a6dcb9e962751d914a
Ancestor: d9256db65b95395a2410cbc69064e1405dc01e78
Author: koen@openembedded.org
Date: 2007-06-25T12:26:59
Branch: org.openembedded.dev

Added files:
        packages/gtk-webcore/midori_0.0.2.bb

ChangeLog:

midori: add version 0.0.2 of yet another gtk-webcore based web browser
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG05DDMkyGM64RGpERAm63AKCBea7ai9lSvyjKbhaQX/HyiSilAgCfeCgr
AOcORjx5lOL/o2LDWJF8UtQ=
=i/9f
-----END PGP SIGNATURE-----


