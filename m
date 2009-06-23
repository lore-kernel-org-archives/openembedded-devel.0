Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MJ3MF-0005sU-Pj
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 12:36:07 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MJ3BX-0002sR-2j
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 10:25:03 +0000
Received: from p5b3b27d3.dip.t-dialin.net ([91.59.39.211])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 10:25:03 +0000
Received: from no2spam by p5b3b27d3.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 10:25:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Tue, 23 Jun 2009 19:22:52 +0900
Message-ID: <4A40ACFC.5040009@nospam.arcornews.de>
References: <E1MIlyT-00014Z-0q@melo.nslu2-linux.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b27d3.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
In-Reply-To: <E1MIlyT-00014Z-0q@melo.nslu2-linux.org>
Sender: news <news@ger.gmane.org>
Cc: Koen Kooi <koen@dominion.kabel.utwente.nl>
Subject: Re: Koen Kooi : bluez4: add 4.42
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
X-List-Received-Date: Tue, 23 Jun 2009 10:36:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

git version control wrote:
> Author: Koen Kooi <koen@openembedded.org>
> Date:   Mon Jun 22 18:01:10 2009 +0200
> 
> bluez4: add 4.42

Before adding even more versions of bluez, can we please unify the 
common parts in a .inc file?

Maybe we can tackle bug 5176 as well?



