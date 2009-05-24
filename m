Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M86mX-0000ZO-8P
	for openembedded-devel@openembedded.org; Sun, 24 May 2009 08:02:01 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M86ev-0004Xh-EL
	for openembedded-devel@openembedded.org; Sun, 24 May 2009 05:54:09 +0000
Received: from p5b3b3ffc.dip.t-dialin.net ([91.59.63.252])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 24 May 2009 05:54:09 +0000
Received: from no2spam by p5b3b3ffc.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 24 May 2009 05:54:09 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sun, 24 May 2009 07:53:50 +0200
Message-ID: <gvandm$f73$1@ger.gmane.org>
References: <065E68EB87448440A3E75B4DBB5E871C3DA962@CORPUSMX100C.corp.emc.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b3ffc.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
In-Reply-To: <065E68EB87448440A3E75B4DBB5E871C3DA962@CORPUSMX100C.corp.emc.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [patch] fix rpm package in qa stage error
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
X-List-Received-Date: Sun, 24 May 2009 06:02:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Lin_Lynn@emc.com wrote:
> In rpm package,some .debug file weren't in any .debug package
> The following patch to fix this bug,pls review ,thanks

Lynn, thank you for this patch.  This is bug 5069.  It generally looks 
sane to me.  I can't verify it, though, because rpm fails do_configure 
for me.  Does it work for you?



