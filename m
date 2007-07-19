Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1IBXwD-0003W8-M0
	for openembedded-devel@openembedded.org; Thu, 19 Jul 2007 17:29:09 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1IBXvY-0000XX-QZ
	for openembedded-devel@openembedded.org; Thu, 19 Jul 2007 17:28:28 +0200
Received: from cm203.kappa85.maxonline.com.sg ([58.182.85.203])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 19 Jul 2007 17:28:28 +0200
Received: from robk by cm203.kappa85.maxonline.com.sg with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 19 Jul 2007 17:28:28 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rob Kramer <robk@starhub.net.sg>
Date: Thu, 19 Jul 2007 23:28:15 +0800
Message-ID: <f7nvum$kaj$1@sea.gmane.org>
References: <f7kde4$rum$1@sea.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: cm203.kappa85.maxonline.com.sg
User-Agent: KNode/0.10.5
Sender: news <news@sea.gmane.org>
Subject: Re: Packaging problem.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jul 2007 15:29:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit

Or more succinctly put:

--------
BB>> peek base-passwd FILES_base-passwd
None
BB>> peek base-passwd FILES_base-passwd-doc
 /usr/share/doc
--------

It seems all my packages are incompletely packaged or missing due to this.
What could cause the FILES_${PN} from bitbake.conf to be unset?

Cheers,

    Rob



