Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1Lywtp-000745-As
	for openembedded-devel@openembedded.org; Wed, 29 Apr 2009 01:39:41 +0200
Received: (qmail 6143 invoked from network); 28 Apr 2009 23:34:28 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 28 Apr 2009 16:34:28 -0700
Date: Tue, 28 Apr 2009 16:34:27 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090428233427.GW18788@smtp.west.cox.net>
References: <49F59B68.1010208@balister.org>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF793@hiob.intern.dresearch.de>
	<20090427134352.GE18788@smtp.west.cox.net>
	<gt4ekt$ba2$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gt4ekt$ba2$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: gcc_4.2.4.bb: QA Issue: No GNU_HASH in the elf binary
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
X-List-Received-Date: Tue, 28 Apr 2009 23:39:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2009 at 04:14:52PM +0200, Koen Kooi wrote:
[snip]
> Anyway, isn't ldflags.patch supposed to fix missing ldflags?

Supposed to, but doesn't cover everything.

-- 
Tom Rini


