Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Nhp1Y-0002aW-Vy
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 19:53:28 +0100
Received: from [192.168.0.5] (e180132127.adsl.alicedsl.de [85.180.132.127])
	by drlauer-research.com (Postfix) with ESMTP id AC62758416A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2010 20:44:54 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1NhoRW-0004A2-AO@melo.openembedded.org>
References: <E1NhoRW-0004A2-AO@melo.openembedded.org>
Organization: Vanille-Media
Date: Wed, 17 Feb 2010 19:50:42 +0100
Message-ID: <1266432642.5977.20.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Koen Kooi : Revert "recipes/images/console-base-image.bb: factor out Angstrom-specific bits"
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
X-List-Received-Date: Wed, 17 Feb 2010 18:53:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

What has become of our revertion policy?

If I recall correctly, reverting foreign commits need ACK from two
members.

On the actual subject of recipes; Rolf, let me encourage you to create
another set of console-image[-base], i.e. agnostic-console-image or so.
If we can no longer refactor in OE, then we have to resort to creating a
parallel world.

Cheers,

:M:




