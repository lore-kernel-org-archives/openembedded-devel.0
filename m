Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1L2Dhq-00011D-Fl
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Nov 2008 00:40:34 +0100
Received: from andromeda.vanille.de (e180131129.adsl.alicedsl.de
	[85.180.131.129])
	by drlauer-research.com (Postfix) with ESMTP id CC92E584188
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2008 00:53:52 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Nov 2008 00:38:08 +0100
User-Agent: KMail/1.9.10
References: <20081115233908.1158D189341@amethyst.openembedded.net>
	<200811160133.01482.mickey@vanille-media.de>
	<200811171408.26298.zecke@selfish.org>
In-Reply-To: <200811171408.26298.zecke@selfish.org>
MIME-Version: 1.0
Message-Id: <200811180038.08931.mickey@vanille-media.de>
Subject: Re: [oe-commits] Holger Hans Peter Freyther : u-boot-openmoko: Remove AUTHOR line, this was meant to be the recipe author line
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
X-List-Received-Date: Mon, 17 Nov 2008 23:40:34 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Monday 17 November 2008 14:08:26 schrieb Holger Freyther:
> > No, that's wrong. AUTHOR refers to the package author -- since day one of
> > OE :)
>
> Mental note: AUTHOR != MAINTAINER :)

:)

> still the AUTHOR line is most of the time not correct. The best example is
> OpenStreetmap and and the creative commons license. It is not practicable
> to list all authors.

True. That's why it's only rarely used. I would not object to removing it 
completely.

> did you already revert that particual commit? or should i?

Nothing urgent. Please do when you have a chance.

Thanks,

:M:


