Received: from [65.182.109.73] (helo=mta4.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1LXLRN-0006sl-8s
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Feb 2009 21:12:13 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta4.brinkster.com (Postfix) with ESMTP id 377795ED427
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2009 15:11:01 -0500 (EST)
X-Virus-Scanned: amavisd-new at 
X-Spam-Flag: NO
X-Spam-Score: 0.38
X-Spam-Level: 
X-Spam-Status: No, score=0.38 tagged_above=-10 required=5 tests=[AWL=-0.352,
	BAYES_00=-2.599, MSGID_MULTIPLE_AT=1.449, RCVD_IN_PBL=0.905,
	RCVD_IN_SORBS_DUL=0.877, RDNS_DYNAMIC=0.1]
Received: from mta4.brinkster.com ([127.0.0.1])
	by localhost (mta4.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5unz06GGwbEN
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2009 15:11:00 -0500 (EST)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta4.brinkster.com (Postfix) with ESMTP id 2C5DB5ED4A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2009 15:11:00 -0500 (EST)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
References: <008c01c98b68$bb7386e0$325a94a0$@Willis@Distant-earth.com>
	<499325FC.6030401@dls.net>
In-Reply-To: <499325FC.6030401@dls.net>
Date: Wed, 11 Feb 2009 20:10:24 -0000
Message-ID: <003701c98c84$c722d410$55687c30$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcmMf9k69zpf2AD9S6qY7fjfXfRgqQAA3cbw
Subject: Re: [PATCH] Add package for ntfs-3g 2009.1.1 (latest) and update checksums.ini accordingly.
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
X-List-Received-Date: Wed, 11 Feb 2009 20:12:13 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

> > Builds fine and quickly tested with no issues.
> 
> I can (and will) test on the NSLU2 (ixp4xx kernel).  What
> machines/distros have you tested with?
> 
> If nobody objects, I'll add this version.

Tested on the OMAP3EVM and Pandora (Both OMAP3/ARMv7). Basic OE images,
Angstrom GPE image and the Pandora Angstrom images. I did some controlled
read and write tests (100MB test file) and all seems good.

Also left it playing videos off the NTFS volume in a loop for about 12 hours
(something else I was testing). 
No issues.
 
> > Note: the ntfs-3g v1 package is suspect (download pulled from
> > http://www.ntfs-3g.org/) so that may well be best removed? Not sure
> what the
> > process is on such things.
> 
> Can you clarify what you mean by suspect?

If you go to ntfs-3g.org you find the download for version 1.0 has long
since been pulled in favor of newer releases. In this case that is what I
mean by suspect.

Regards,

John




