Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LcEoo-0006Is-6c
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Feb 2009 09:08:38 +0100
Received: from [192.168.1.105] (e180139171.adsl.alicedsl.de [85.180.139.171])
	by drlauer-research.com (Postfix) with ESMTP id 47251584146
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2009 09:29:35 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <go2tek$akt$1@ger.gmane.org>
References: <20090224211929.77E79E8037@amethyst.openembedded.net>
	<1235513110.2621.7.camel@andromeda>  <go2tek$akt$1@ger.gmane.org>
Organization: Vanille-Media
Date: Wed, 25 Feb 2009 09:05:28 +0100
Message-Id: <1235549128.2621.20.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: Re: [oe-commits] Koen Kooi : gstreamer-ti: bump to r126 to make gstreamer autoplug and playbin work
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
X-List-Received-Date: Wed, 25 Feb 2009 08:08:39 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 25.02.2009, 08:53 +0100 schrieb Koen Kooi:
> On 24-02-09 23:05, Michael 'Mickey' Lauer wrote:
> > Hi Koen,
> >
> >> -SRCREV = "121"
> >> +SRCREV = "126"
> >
> > Is there any specific reason you're not using sane-srcrevs.inc for that?
> 
> The 5 minute reparse time everytime someone touches sane-srcrevs.

Aha. I don't think that's a good reason, but YMMV. So we should get rid
of sane-srcrevs.inc and put it all into the files?

-- 
:M:



