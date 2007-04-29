Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1HiBbA-0007Il-4Z
	for openembedded-devel@openembedded.org; Sun, 29 Apr 2007 17:46:04 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HiBSE-0000vl-Fr
	for openembedded-devel@openembedded.org; Sun, 29 Apr 2007 17:36:50 +0200
Received: from f7398.f.ppp-pool.de ([195.4.115.152])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 29 Apr 2007 17:36:50 +0200
Received: from no2spam by f7398.f.ppp-pool.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 29 Apr 2007 17:36:50 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sun, 29 Apr 2007 17:36:32 +0200
Message-ID: <f12e22$36e$1@sea.gmane.org>
References: <20070427105722.GA4340@twibble.org> <f0vs5r$6pm$1@sea.gmane.org>
	<20070429125909.GB8230@twibble.org>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: f7398.f.ppp-pool.de
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
In-Reply-To: <20070429125909.GB8230@twibble.org>
Sender: news <news@sea.gmane.org>
Subject: Re: perl 5.8.8 is ready
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 Apr 2007 15:46:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Jamie Lenehan wrote:
>> unfortunately, perl itself still has issues.  Bug 1700 is not yet resolved.
> 
> That uses an old out-of-tree toolchain doesn't it?

yes, 
http://handhelds.org/download/projects/toolchain/archive/cross-2.95.3.tar.bz2

More info at http://www.openembedded.org/usefulconfigurations

> I suspect that the gcc_s linking issue would be fixed. The other
> issue looks to be related to the compiler version being used. Can you
> attach the configure and compile logs for perl 5.8.8 builds using the
> sharprom toolchain to the bug? I'll then take a look at it and see if
> it can be fixed.

Thank you.  I have attached the requested files.  The gcc_s issue seems 
to be fixed indeed.



