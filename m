Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NVwFg-00009m-Nk for openembedded-devel@lists.openembedded.org;
	Sat, 16 Jan 2010 01:10:56 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NVwDZ-0005v9-1c
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Jan 2010 01:08:41 +0100
Received: from p5b3b2855.dip.t-dialin.net ([91.59.40.85])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jan 2010 01:08:41 +0100
Received: from no2spam by p5b3b2855.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jan 2010 01:08:41 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sat, 16 Jan 2010 01:08:10 +0100
Message-ID: <hir01f$uj0$1@ger.gmane.org>
References: <1263582089-6122-1-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b2855.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
In-Reply-To: <1263582089-6122-1-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] qt3e.bbclass: fix paths for staging
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
X-List-Received-Date: Sat, 16 Jan 2010 00:10:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz <marcin@buglabs.net>
> 
> Without that patch uicmoc3-native fails to build.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

verified problem and fix

Acked-by: Rolf Leggewie <foss@rolf.leggewie.biz>



