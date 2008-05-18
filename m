Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JxmTl-0006Gb-2X
	for openembedded-devel@openembedded.org; Sun, 18 May 2008 19:15:25 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JxmRf-0002k3-2H
	for openembedded-devel@openembedded.org; Sun, 18 May 2008 17:13:15 +0000
Received: from ip-62-143-23-251.hsi.ish.de ([62.143.23.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 18 May 2008 17:13:15 +0000
Received: from no2spam by ip-62-143-23-251.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 18 May 2008 17:13:15 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sun, 18 May 2008 19:13:07 +0200
Message-ID: <g0po33$t9c$1@ger.gmane.org>
References: <1211081495.8550.60.camel@isis>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-23-251.hsi.ish.de
User-Agent: Thunderbird 2.0.0.14 (X11/20080505)
In-Reply-To: <1211081495.8550.60.camel@isis>
Sender: news <news@ger.gmane.org>
Subject: Re: scp-argument-fix.patch is not needed for dropbear 0.50
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 18 May 2008 17:15:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> applied scp-argument-fix.patch to all versions of dropbear. However this
> patch is not needed for dropbear 0.50 e.g. Only 0.49 requires it.

Thanks.  Updated in 3690cf9a949f76acaa2b247794d6ee00339acd46



