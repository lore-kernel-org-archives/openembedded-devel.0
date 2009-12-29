Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NPXt7-0004Ko-I2 for openembedded-devel@lists.openembedded.org;
	Tue, 29 Dec 2009 09:57:12 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NPXrE-0007b2-7e
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Dec 2009 09:55:12 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Dec 2009 09:55:12 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Dec 2009 09:55:12 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 29 Dec 2009 09:54:49 +0100
Message-ID: <hhcg4o$ubd$1@ger.gmane.org>
References: <c384c5ea0912281419h3c14c675r8ec6d044c234a381@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.5) Gecko/20091220 Shredder/3.0.1pre
In-Reply-To: <c384c5ea0912281419h3c14c675r8ec6d044c234a381@mail.gmail.com>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: helloworld image
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
X-List-Received-Date: Tue, 29 Dec 2009 08:57:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 28-12-09 23:19, Leon Woestenberg wrote:
> Hello (world),
> 
> 
> when compiling my favorite minimal image ("helloworld-image") under
> both the minimal-distro and angstrom
> shows 4 MB of cruft being dragged in.
> 
> What happened?
> 
> I would like to start with nothing and then configure the system for
> what I need.
> 
> Should I start another more-minimal distro or can we change the
> minimal distro to be truely minimalistic?

You're confusing image and distro again. With angstrom I'm using a 80KiB
big image that has an fbdev based gui, so it looks your image recipe is
doing something wrong.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLOcPZMkyGM64RGpERAkP9AKCE4ooqQ0ZfZs72oY5+y/YiYBeHiwCfTqbo
czpMNG83R1f5tge+nY2iK3E=
=YlYb
-----END PGP SIGNATURE-----



