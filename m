Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P6Nlb-0008I3-36 for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 15:22:45 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P6Nl8-0004Ed-Hn for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 15:22:14 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 15:22:14 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 15:22:14 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 14 Oct 2010 15:22:05 +0200
Message-ID: <i9705t$i6g$1@dough.gmane.org>
References: <20101014124548.GJ28423@ibawizard.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100822 Shredder/3.0.7pre
In-Reply-To: <20101014124548.GJ28423@ibawizard.net>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] ts72xx, ts73xx, ts74xx? How to handle properly similar machines
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
X-List-Received-Date: Thu, 14 Oct 2010 13:22:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 14-10-10 14:45, Petr Štetiar wrote:
> Hi,
> 
> I've been asked if I could add support for the ts7400 board/machine in the OE.
> It's not a big deal, it's just an addition of one patch to the kernel recipe.
> 
> While I'll be into it, I was thinking about adding the base for the possible
> future addition of ts7300[2] boards also. Althought I own only ts7800 and
> ts7250, the ts7200[4], ts7300 and ts7400 families looks like they have a lot
> of common and it would be possible to have for example one kernel for all of
> them.
> 
> The question is, how to handle this correctly in OE? On the IRC, I was pointed
> to the SOC_FAMILY[3], but it says "The use of SOC_FAMILY as an override is
> currently a distribution or local setting", what does it mean?

It means you need to use angstrom or set is as override in local.conf
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMtwP9MkyGM64RGpERAq2FAJ94Ml70y8lAxRB+PzKOtwyRPnEAnQCeKlY/
LLaTsCmSsKZEP69CIvzkEzE=
=FrGw
-----END PGP SIGNATURE-----



