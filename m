Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1N7t2W-000396-Mx
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 16:53:55 +0100
Received: from [192.168.1.7] (dialbs-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by drlauer-research.com (Postfix) with ESMTP id C10C8584D5F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 17:38:27 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20091110151412.GF3998@excalibur.local>
References: <1257858446.3077.3.camel@opal>
	<20091110132756.GC3998@excalibur.local> <1257864635.5228.17.camel@opal>
	<20091110151412.GF3998@excalibur.local>
Organization: Vanille-Media
Date: Tue, 10 Nov 2009 16:52:36 +0100
Message-ID: <1257868356.5472.1.camel@opal>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM: Summary of 'OE and Poky', 'Hosting', 'Bugtracker'
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
X-List-Received-Date: Tue, 10 Nov 2009 15:53:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Dienstag, den 10.11.2009, 16:14 +0100 schrieb Stefan Schmidt:
> > Access control: Having user branches in a dedicated tree means we can
> > give more users commit access so that they can prepare branches we can
> > pull. This might lead to (IMHO much appreciated) improvements in the
> > development model towards a pull model.
> 
> But why the hassle of administrate an own git repo service for this? I always
> thought OE was small on admin power.

Sorry, this might have been unclear on my part, it's just different
projects on the same repository, not different repositories. We'd like
to and recommend OE developers to host their branch in a 'contrib'
project on git.oe.org.

Cheers,

:M:




