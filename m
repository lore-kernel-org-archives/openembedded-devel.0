Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1KiQdj-0005gi-HV
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Sep 2008 11:26:31 +0200
Received: from [172.16.23.197] (firewall.tw.openmoko.org [124.219.5.210])
	by drlauer-research.com (Postfix) with ESMTP id C1FAC584D38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2008 11:34:00 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gbct33$rh4$1@ger.gmane.org>
References: <gb0738$dcq$1@ger.gmane.org>
	<200809191645.13840.zecke@selfish.org>  <gbct33$rh4$1@ger.gmane.org>
Date: Wed, 24 Sep 2008 17:21:40 +0800
Message-Id: <1222248100.15974.4.camel@ip6-localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.0-1mdv2009.0 
Subject: Re: Math is hard, but please pay attention to PV
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
X-List-Received-Date: Wed, 24 Sep 2008 09:26:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 24.09.2008, 10:17 +0200 schrieb Koen Kooi:
> Holger Freyther wrote:
> > On Friday 19 September 2008 14:48:40 Koen Kooi wrote:
> >
> >> Anyway, PE has been bumped, things should work again this the next EFL
> >> 'upgrade' happens. I just need to find a way to get the past 2 hours of
> >> my life back.
> >
> > Thanks!
> 
> I just fixed linux-openmoko as well, '0' is _less_ than '7', so changing 
> PR from 'r7' to 'r0' is *bad*, I've increased it to 'r8' now.

> Seriously, is math that hard for openmoko people?

Much less the math but rather being used to reset PR on version updates.
Alas this breaks with hash-based SCMs. I begin to regret the decision to
use git in my projects.

:M:




