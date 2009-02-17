Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LZJaZ-00039H-5D
	for openembedded-devel@openembedded.org; Tue, 17 Feb 2009 07:37:51 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LZJYd-0004mH-Q9
	for openembedded-devel@openembedded.org; Tue, 17 Feb 2009 06:35:51 +0000
Received: from p5483af90.dip0.t-ipconnect.de ([84.131.175.144])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 17 Feb 2009 06:35:51 +0000
Received: from vjensen by p5483af90.dip0.t-ipconnect.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 17 Feb 2009 06:35:51 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Vitus Jensen <vjensen@gmx.de>
Date: Tue, 17 Feb 2009 06:35:43 +0000 (UTC)
Message-ID: <gndlrv$sht$1@ger.gmane.org>
References: <200901120019.45621.mickey@vanille-media.de>
	<200901141547.26513.mickey@vanille-media.de>
	<gme8cj$ejn$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5483af90.dip0.t-ipconnect.de
User-Agent: Pan/0.133 (House of Butterflies)
Sender: news <news@ger.gmane.org>
Subject: Re: python roadmap
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
X-List-Received-Date: Tue, 17 Feb 2009 06:37:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am Thu, 05 Feb 2009 08:35:31 +0000 schrieb Vitus Jensen:

> Am Wed, 14 Jan 2009 15:47:26 +0100 schrieb Michael 'Mickey' Lauer:
> 
>> Thanks to some extrashifts this work has proceeded faster than
>> scheduled. I plan to merge mickey/python26 into master on friday. If
>> you see something dangerous, yell.
> 
> Yell ;-)
> 
> See http://bugs.openembedded.net/show_bug.cgi?id=5013
> 
> python26 fails to build for the big-endian machines I tried, namely
> nslu2be.  And as python25 was removed it is a real blocker for packages
> which DEPEND on pathon, which inturn is the case for php.  And php I'm
> trying to get a version working again.
...

Does anyone build packages for bigendian machines?

Vitus

-- 
Vitus Jensen, Hannover, Germany, Earth, Milky Way, Universe (current)



