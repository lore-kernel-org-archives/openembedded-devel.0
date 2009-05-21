Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M7G3R-0002Nr-S3
	for openembedded-devel@openembedded.org; Thu, 21 May 2009 23:43:57 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M7Fw4-00072X-Fl
	for openembedded-devel@openembedded.org; Thu, 21 May 2009 21:36:20 +0000
Received: from p5b3b3e33.dip.t-dialin.net ([91.59.62.51])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 21 May 2009 21:36:20 +0000
Received: from no2spam by p5b3b3e33.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 21 May 2009 21:36:20 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 21 May 2009 23:36:07 +0200
Message-ID: <gv4hg9$75o$1@ger.gmane.org>
References: <gv4d2h$oft$1@ger.gmane.org> <gv4ea5$sbp$1@ger.gmane.org>
	<4A15C20E.6020509@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b3e33.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
In-Reply-To: <4A15C20E.6020509@balister.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] policy about nonworking recipes
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
X-List-Received-Date: Thu, 21 May 2009 21:43:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Philip Balister wrote:
> thinking it would also need to be paired with COMPATIBLE_DISTRO also. 

COMPATIBLE_DISTRO does not exist as far as I know.  So if needed it 
would have to be added.  I tried to work with what's there.

Not sure if COMPATIBLE_DISTRO should be added and be OE's 
responsibility.  If there frequently is a situation where something 
builds in one distro and not the other then I guess it would be better 
to dig deeper into the choices those distros made which lead to that 
outcome and act on that.



