Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NYFZ2-0007D4-F9 for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 10:12:27 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NYFWm-00063I-Bc
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 10:10:04 +0100
Received: from 188-220-34-37.zone11.bethere.co.uk ([188.220.34.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 10:10:04 +0100
Received: from dp by 188-220-34-37.zone11.bethere.co.uk with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 10:10:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Graeme Gregory <dp@xora.org.uk>
Date: Fri, 22 Jan 2010 09:05:03 +0000 (UTC)
Message-ID: <loom.20100122T100408-864@post.gmane.org>
References: <4B564B3D.7020108@atmel.com>
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
Subject: Re: [PATCH v2] Enable bmp and JPEG files for fbv
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
X-List-Received-Date: Fri, 22 Jan 2010 09:12:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Ulf Samuelsson <ulf.samuelsson <at> atmel.com> writes:

> +PACKAGES = "fbv"

NAK

PACKAGES is never set in a recipe only added to.

Graeme





