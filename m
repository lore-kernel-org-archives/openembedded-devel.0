Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1NlqpX-0004RK-Tm
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 22:37:40 +0100
Received: from [192.168.1.2] (e180134197.adsl.alicedsl.de [85.180.134.197])
	by drlauer-research.com (Postfix) with ESMTP id A284C584132
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 23:30:01 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11002281139g6963e753w970c97002611c78c@mail.gmail.com>
References: <ac9c93b11002281139g6963e753w970c97002611c78c@mail.gmail.com>
Organization: Vanille-Media
Date: Sun, 28 Feb 2010 22:35:28 +0100
Message-ID: <1267392928.13054.1.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC} glib-2.0 cleanup
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
X-List-Received-Date: Sun, 28 Feb 2010 21:37:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Sonntag, den 28.02.2010, 20:39 +0100 schrieb Frans Meulenbroeks:
> We have 26 glib-2.0 recipes (and 8 native ones). (see ls below)
> Only a few versions are used (see also the grep below)
> 
> for glib-2.0:
> "2.12.12"
> "2.16.4"
> "2.18.3"
> "2.20.3"
> "2.22.1"
> "2.22.4"
> "2.6.4"
> "2.8.6"
> 
> for glib-2.0-native:
> "2.16.1"
> "2.18.0"
> "2.22.1"
> "2.22.4"
> 
> Both include the last two versions
> Proposal is to remove all versions that are not used.
> 
> How do people feel about this?

Sounds good to me, althoug I'd recommend not removing them but just
moving them out of sight, i.e. in an 'old' folder. That way we could
please both the lets-keep-everything-no-matter-how-rotten and also the
lets-strive-for-few-high-quality recipes.

Cheers,

-- 
:M:



