Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1H57rX-0004GM-Eh
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jan 2007 22:53:31 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 6CD0128C012; Thu, 11 Jan 2007 22:47:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7 (2006-10-05) on srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7
Received: from [192.168.2.128] (e180168253.adsl.alicedsl.de [85.180.168.253])
	by srv043.dedi23.de (Postfix) with ESMTP id B95A328C011;
	Thu, 11 Jan 2007 22:47:25 +0100 (CET)
Date: Thu, 11 Jan 2007 22:51:31 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.95.6) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <24388092.20070111225131@vanille-media.de>
To: Erik Hovland <erik@hovland.org>
In-Reply-To: <20070111214849.GD336@mage.jpl.nasa.gov>
References: <20070111203010.GB336@mage.jpl.nasa.gov>
	<45A6A0C2.2080400@dominion.kabel.utwente.nl>
	<20070111214849.GD336@mage.jpl.nasa.gov>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org, familiar@handhelds.org
Subject: Re: [announce] new tagged version of ipkg
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
X-List-Received-Date: Thu, 11 Jan 2007 21:53:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hey Erik,

Erik Hovland wrote:
>> Tarball?
> No tarball at this time. If one is desired it can be facilitated.

Yes, a tarball would be appreciated.

>> ChangeLog?
> The ipkg/C/ChangeLog has been updated:

> 2007-01-11 erik ( erik@hovland.org)
>         * Version update to 0.99.164
>         * Fixed usage of temporary files to be more secure
>         * Closed several potential memory/file descriptor leaks
>         * Cleaned up warnings in several parts of the code
>         * Added checking to libbb/unzip.c so it did not use tainted data
>         * Changed code in several places where it is possible to dereference an invalid pointer

Cool, thanks. Any plans to improve the speed problems?

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



