Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IVM65-0003NG-Ew
	for openembedded-devel@openembedded.org; Wed, 12 Sep 2007 08:53:13 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8C6o1xW025176 for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2007 08:50:01 +0200
Message-ID: <46E78C1C.5000007@student.utwente.nl>
Date: Wed, 12 Sep 2007 08:50:04 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <46E3F898.6090607@student.utwente.nl>
In-Reply-To: <46E3F898.6090607@student.utwente.nl>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: sane-srcrevs.inc content and update policy
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
X-List-Received-Date: Wed, 12 Sep 2007 06:53:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Hi,
> 
> I want to start using sane-srcrevs.inc in angstrom soon, but I heard some sounds from
> angstrom-derivatives about needing some bleeding-edge bits.
> 
> So I have a few questions:
> 
> * how can a SRC_REV-pn-${PN} be overriden in a clean way (e.g. SRC_REV-pn-foo = "now")?
> * what goes into sane-srcrevs.inc (everything with positive def_pref?)?
> * what policy will be set for updating it?
> 
> Having a complete sane-srcrevs.inc should fix the "can't build because berlios is down"
> type of problems.

And I just found out that the GFW of china blocks some svn hosts, so current .dev is
virtually impossible to use in china :(

regards,

KOen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG54wcMkyGM64RGpERAiIyAJ4m649D3Z5k/okZWUwVtA/rZYEDAwCgnrva
61AR3kjp14nmGXgfFyWPXxo=
=QSSA
-----END PGP SIGNATURE-----


