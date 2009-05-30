Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MAWJS-0004vI-B3
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 23:41:59 +0200
Received: (qmail 28115 invoked from network); 30 May 2009 21:33:24 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 30 May 2009 14:33:24 -0700
Date: Sat, 30 May 2009 14:33:23 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090530213323.GR23842@smtp.west.cox.net>
References: <20090522213142.GF23842@smtp.west.cox.net>
	<200905242049.30726.marcin@juszkiewicz.com.pl>
	<20090530191647.GL23842@smtp.west.cox.net>
	<gvs7gu$3ha$2@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gvs7gu$3ha$2@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Kernel recipes with broken PRs now
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
X-List-Received-Date: Sat, 30 May 2009 21:42:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 30, 2009 at 11:13:01PM +0200, Koen Kooi wrote:
> On 30-05-09 21:16, Tom Rini wrote:
>> while this is a useful mechanism for machines that need
>> it, it's also a PITA for machines that don't
>
> Every machine needs it, since every machine can have external modules  
> (or kernel dependant userspace apps). So stating that "some machines"  
> need it is plain wrong.

Every machine might be able to make use of it, if it either depends on
unstable / in development programs or modules, OR it can use some
external kernel module (IMHO the right answer for this is versioned
dependancies, having the PR be increasing from 2.6.29 to 2.6.30 is
different than normal behavior).  This isn't always going to be an
option.

-- 
Tom Rini


