Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NZ1va-0001ec-GZ for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 13:50:57 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NZ1tL-0005c1-98
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 13:48:35 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 13:48:35 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 13:48:35 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 24 Jan 2010 13:48:14 +0100
Message-ID: <hjhfid$tqo$1@ger.gmane.org>
References: <201001241235.23795.holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100113 Shredder/3.0.2pre
In-Reply-To: <201001241235.23795.holger+oe@freyther.de>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Request to revert latest devicekit patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Jan 2010 12:50:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-01-10 12:35, Holger Hans Peter Freyther wrote:
> Hi all,
> 
> 9c5d1cb40bcb1d9412112bf73d7c7f4732989e89 was removing "-nonet" option from 
> devicekit Makefiles. This means that everyone now needs to have internet 
> connectivity to build devicekit, which I don't have most of the time.
> 
> Can anyone ack the revert please?

The commit says:

Note: Another (maybe better) fix would be to package up docbook-xsl but
that is overkill for these two recipes.

Wouldn't that be a better option than introducing a regression?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLXEGNMkyGM64RGpERAv7vAKCi1lVeVkrBrIf964XEJVmvM4YktgCeOkbq
OWDh9TD6uSnJkQnNLrOoxos=
=Jc7b
-----END PGP SIGNATURE-----



