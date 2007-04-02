Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1HYH3y-0004Gq-Kf
	for openembedded-devel@openembedded.org; Mon, 02 Apr 2007 09:34:50 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 85B4C28C012; Mon,  2 Apr 2007 09:27:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL, RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180143221.adsl.alicedsl.de [85.180.143.221])
	by srv043.dedi23.de (Postfix) with ESMTP id DDC0B28C011;
	Mon,  2 Apr 2007 09:27:45 +0200 (CEST)
Date: Mon, 2 Apr 2007 09:34:49 +0200
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.98.4) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <912610941.20070402093449@vanille-media.de>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1175383522.5852.21.camel@localhost.localdomain>
References: <1175383522.5852.21.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: Fixing OE.dev dependency issues
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
X-List-Received-Date: Mon, 02 Apr 2007 07:34:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> http://www.rpsys.net/openzaurus/temp/oe-depends-fixes.patch

> but of course once we do this, bitbake 1.6 is no longer going to work
> with the metadata since this change is not backwards compatible.

This shouldn't be a problem for most people. I guess only a handful of
insane projects like OpenMoko were brave enough to patch BitBake ;)

> I'm proposing to release bitbake 1.8.2 with code to handle the above,
> and epoch handling code in the very near future. We will then have to
> aim to make bitbake 1.8.2 the minimum bitbake version for .dev before
> the above fix can be checked in and epoch packages can be more
> widely/easily used. Does anyone have any objections to a move to bitbake
> 1.8 in due course? What timescale would people class as acceptable?

2 months after announcing?

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



