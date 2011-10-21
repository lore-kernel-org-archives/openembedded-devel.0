Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RHKZU-0005jb-RM for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 21:16:00 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RHKTl-0007x1-SP for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 21:10:06 +0200
Received: from 72.5.59.140 ([72.5.59.140])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 21:10:05 +0200
Received: from wylder.keane by 72.5.59.140 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 21:10:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Wylder <wylder.keane@gmail.com>
Date: Fri, 21 Oct 2011 19:07:11 +0000 (UTC)
Message-ID: <loom.20111021T210119-168@post.gmane.org>
References: <4D3DE56B.7020803@freyther.de> <4D3DF7CF.7010308@freyther.de>
	<4D3DFE34.3090706@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 72.5.59.140 (Mozilla/5.0 (X11;
	Linux i686) AppleWebKit/535.1 (KHTML, like Gecko) Ubuntu/11.10
	Chromium/14.0.835.202 Chrome/14.0.835.202 Safari/535.1)
Subject: Re: build errors in openssl-native
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
X-List-Received-Date: Fri, 21 Oct 2011 19:16:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Holger Freyther <holger+oe <at> freyther.de> writes:

> 
> On 01/24/2011 11:06 PM, Holger Freyther wrote:
> > On 01/24/2011 09:47 PM, Holger Freyther wrote:
> >> Hi,
> >>
> >> is anyone else seeing build errors like this:
> 
> next weird breakage is curl-native... compiled without gnutls ending up
> linking to the system gnutls that uses gcrypt but does not link to it...
> 

Any luck with this? I've run into the same error and can't seem
to resolve the issue. I can't find anyone else who's had this issue.

I'm running Ubuntu 11.10 with Python 2.6 and gcc 4.6

I wonder if it has to do with the version of gcc, or maybe a
stray link or include path. I'm gonna keep working on it and
will let you know if I find anything.




