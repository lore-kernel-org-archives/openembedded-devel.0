Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M1pHw-0005lW-B6
	for openembedded-devel@openembedded.org; Thu, 07 May 2009 00:08:28 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M1pBt-0005zp-Rd
	for openembedded-devel@openembedded.org; Wed, 06 May 2009 22:02:19 +0000
Received: from 64.101.21.60 ([64.101.21.60])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 06 May 2009 22:02:13 +0000
Received: from msundius by 64.101.21.60 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 06 May 2009 22:02:13 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Michael Sundius <msundius@sundius.com>
Date: Wed, 6 May 2009 22:01:55 +0000 (UTC)
Message-ID: <loom.20090506T215941-130@post.gmane.org>
References: <loom.20090429T222752-306@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 64.101.21.60 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.15) Gecko/20080702 Fedora/2.0.0.15-1.fc8 Firefox/2.0.0.15)
Sender: news <news@ger.gmane.org>
Subject: Re: problem building an image
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
X-List-Received-Date: Wed, 06 May 2009 22:08:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Michael Sundius <msundius <at> sundius.com> writes:

> 
> I seem to be getting a build problem when I build an image. It does it
> on any image, even the helloworld-image. anyone can help?
> 
> please see below the bitbake output as well as the logfile contents:
> 
> bitbake out:

found the answer to my own question in the following post. The patch listed
seems to fix the problem. I thought I would post a reference just incase
anyone else see this problem. 

cheers.

http://article.gmane.org/gmane.comp.handhelds.openembedded/21786/match=arfile+py




