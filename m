Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JS8BT-0001GM-Q0
	for openembedded-devel@openembedded.org; Thu, 21 Feb 2008 10:57:49 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JS8BL-00079i-6M
	for openembedded-devel@openembedded.org; Thu, 21 Feb 2008 09:57:35 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 21 Feb 2008 09:57:35 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 21 Feb 2008 09:57:35 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Thu, 21 Feb 2008 10:57:28 +0100
Message-ID: <fpjhu8$d3l$1@ger.gmane.org>
References: <1203419692.21824.35.camel@dax.rpnet.com>	<20080219113024.32ba3368@cimmeria>	<47BAC66A.8090700@bolloretelecom.eu>
	<c384c5ea0802201437l5a15ddbcu13904422f9bf7aa6@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
In-Reply-To: <c384c5ea0802201437l5a15ddbcu13904422f9bf7aa6@mail.gmail.com>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=AWL,RDNS_NONE,WEIRD_PORT
	autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE.dev roadworks notification
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
X-List-Received-Date: Thu, 21 Feb 2008 09:57:50 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg schreef:

| To what stage is .stable synchronized with current .dev?

People propose revisions from .dev to get backported and 2 core
developers have to ACK them to get applied, and BACKPORTS.txt[1] is
updated with those revisions. That way the stable branch is a 'subset'
of .dev, and we aim to keep 'branch-only' fixes to an absoulute minimum
('zero' is our goal).

| I would like
| to move all my running projects across both branches so that I can
| both
| (1) continue working on them
| (2) test Richard's efforts on .dev

That shouldn't be a problem, if you find something missing, apply the
change locally or propose it for inclusion.

regards,

Koen

[1] e.g.
http://www.openembedded.org:1081/revision/file/4ade39d8fb840c136daf5a450ece76d6b7280dea/BACKPORTS.txt
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHvUsIMkyGM64RGpERAv4ZAKCZOfIdj6ykpiRh/pOo5bul3yCFOgCfSXCt
gkMYa6UTiNYgEnOoZHiIM8g=
=8o1N
-----END PGP SIGNATURE-----



