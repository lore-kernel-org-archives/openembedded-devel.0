Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JRnWr-0004En-Sb
	for openembedded-devel@openembedded.org; Wed, 20 Feb 2008 12:54:27 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JRnVv-00063n-BA
	for openembedded-devel@openembedded.org; Wed, 20 Feb 2008 11:53:28 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 20 Feb 2008 11:53:27 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 20 Feb 2008 11:53:27 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Wed, 20 Feb 2008 12:53:17 +0100
Message-ID: <fph4bd$luq$1@ger.gmane.org>
References: <200802201241.00635.mickey@vanille-media.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
In-Reply-To: <200802201241.00635.mickey@vanille-media.de>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: opkg
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
X-List-Received-Date: Wed, 20 Feb 2008 11:54:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael 'Mickey' Lauer schreef:
| Hi guys,
|
| you may know that OpenMoko Inc. has started to work on improving and
enhancing
| our favourite package management system (i***). A list of planned
features is
| @ http://wiki.openmoko.org/wiki/Opkg and there is now a mailing list
for the
| development @ http://lists.openmoko.org/mailman/listinfo/opkg-devel

Can that be made available through gmane?

| I think this is a good chance to fix some of the problems that were
due to
| i*** and I want to invite your to participate, if you're interested.

I already added opkg-ipkg-compat.bb that should provide drop-in
compatibility between opkg and ipkg.
The plan for angstrom 2008 is to have opkg and deb support and no ipkg
support.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHvBStMkyGM64RGpERAsjWAJ9QjtKKDmx3xTz4Uzz9ZzYQMz7dTACgkzn2
uNRC7oRdDBIShJi8OA+H4TE=
=+4Kx
-----END PGP SIGNATURE-----



