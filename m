Received: from cassiel.sirena.org.uk ([80.68.93.111] ident=Debian-exim)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <broonie@sirena.org.uk>) id 1NrWzi-0002JL-Gh
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 14:39:38 +0100
Received: from broonie by cassiel.sirena.org.uk with local (Exim 4.69)
	(envelope-from <broonie@sirena.org.uk>) id 1NrWwn-00007N-Np
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 13:36:37 +0000
Date: Tue, 16 Mar 2010 13:36:37 +0000
From: Mark Brown <broonie@sirena.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100316133637.GE21604@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: Dealer prices may vary.
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 80.68.93.111
X-SA-Exim-Mail-From: broonie@sirena.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_00,FAKE_REPLY_C,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Need HELP :: Samsung SMDK6410 root file systemusing	open-embedded
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
X-List-Received-Date: Tue, 16 Mar 2010 13:39:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 16, 2010 at 06:17:10PM +0530, Sagar Jariwala wrote:

> Connecting to 192.168.0.5:22... sh:
> /home/sagar/KIT6410/OE/angstrom-dev/staging/i686-linux/usr/bin/oe_sha256sum:
> cannot execute binary file

Your build has managed to construct an oe_sha256sum binary which it
can't execute.  I'd suggest starting off by trying to figure out why -
running file on it might provide some hints.


