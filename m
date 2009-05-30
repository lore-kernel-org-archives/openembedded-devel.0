Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MAWcB-0005Zg-7n
	for openembedded-devel@openembedded.org; Sun, 31 May 2009 00:01:23 +0200
Received: (qmail 28127 invoked from network); 30 May 2009 21:52:44 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 30 May 2009 14:52:44 -0700
Date: Sat, 30 May 2009 14:52:44 -0700
From: Tom Rini <trini@embeddedalley.com>
To: Roman Khimov <khimov@altell.ru>,
	OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090530215243.GS23842@smtp.west.cox.net>
MIME-Version: 1.0
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: (e)glibc.inc: add minimal sane kernel versions
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
X-List-Received-Date: Sat, 30 May 2009 22:01:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2009 at 12:52:07AM -0000, Roman Khimov wrote:

> (e)glibc is configured for OLDEST_KERNEL, certain target architectures have
> specific requirements for kernel versions, if that are not satisfied (e)glibc
> reconfigures itself with what it think more appropriate and warns user that
> there is misconfiguration on his side.
> 
> Add minimal sane kernel versions for architectures requiring that.

Sorry for the late reply, I'd make one last request however, move
OLDEST_KERNEL from bitbake.conf to these files as well.

-- 
Tom Rini


