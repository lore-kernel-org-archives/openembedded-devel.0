Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M4KMC-0006Rg-HU
	for openembedded-devel@openembedded.org; Wed, 13 May 2009 21:43:12 +0200
Received: (qmail 7374 invoked from network); 13 May 2009 19:36:26 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 13 May 2009 12:36:26 -0700
Date: Wed, 13 May 2009 12:36:25 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090513193625.GL7973@smtp.west.cox.net>
References: <1242226019-10881-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1242226019-10881-7-git-send-email-marcin@juszkiewicz.com.pl>
	<guen3q$p5u$1@ger.gmane.org>
	<20090513151848.GI7973@smtp.west.cox.net>
	<4A0AE5CC.5010407@balister.org>
	<20090513154842.GJ7973@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090513154842.GJ7973@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 6/6] angstrom: use GCC 4.3.3 for Geode devices
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
X-List-Received-Date: Wed, 13 May 2009 19:43:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 13, 2009 at 08:48:42AM -0700, Tom Rini wrote:
[snip]
> OK, I've got a 405GP eval board dug up, I'll get a 'make check' going
> sometime soon and report back.  That should cover the xilinx case too,
> fwiw.

OK, console-image built, but only with hdparm_6.6 as I'm getting a
checksum mismatch with 6.9.  Digging up good hardware is taking a bit
longer, but I'll hopefully have something soon.

-- 
Tom Rini


