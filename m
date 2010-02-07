Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ne9kl-0000Iq-CF for openembedded-devel@lists.openembedded.org;
	Sun, 07 Feb 2010 17:12:58 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ne9iG-0007AV-K8 for openembedded-devel@lists.openembedded.org;
	Sun, 07 Feb 2010 17:10:20 +0100
Received: from 188-220-34-37.zone11.bethere.co.uk ([188.220.34.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Feb 2010 17:10:20 +0100
Received: from dp by 188-220-34-37.zone11.bethere.co.uk with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Feb 2010 17:10:20 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Graeme Gregory <dp@xora.org.uk>
Date: Sun, 7 Feb 2010 16:09:53 +0000 (UTC)
Message-ID: <loom.20100207T170912-780@post.gmane.org>
References: <BAY127-W217652A5FD6DFB2C0B4E2FD8570@phx.gbl>	<4B684D9D.2030001@dresearch.de>	<4B699C5A.70909@dresearch.de>	<20100203162120.GB26844@xora-build.xora.org.uk>	<4B6AC59A.90000@dresearch.de>
	<4B6AC734.4090807@balister.org> <4B6AD2B0.3020104@dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 188.220.34.37 (Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7)
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Problem in bitbaking
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
X-List-Received-Date: Sun, 07 Feb 2010 16:12:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Steffen Sledz <sledz <at> dresearch.de> writes:

> 
> Philip Balister wrote:
> >> [1] I've rechecked this again with angstrom distro and hipox,
> >> beagleboard, and x86 machine making a clean build of glib-2.0:
> >>
> >>    rm -rf tmp.5
> >>    bitbake glib-2.0
> > 
> > glib-2.0 is building for me. Do you have an error log?
> 
> Yepp.
> 
I have checked a fix into OE for this issue.

Graeme




