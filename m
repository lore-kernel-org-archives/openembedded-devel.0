Received: from cassiel.sirena.org.uk ([80.68.93.111] ident=Debian-exim)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <broonie@sirena.org.uk>) id 1O8uLB-0007tV-TX
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 May 2010 14:01:38 +0200
Received: from broonie by cassiel.sirena.org.uk with local (Exim 4.69)
	(envelope-from <broonie@sirena.org.uk>) id 1O8uHa-00042g-8F
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 May 2010 12:57:54 +0100
Date: Mon, 3 May 2010 12:57:54 +0100
From: Mark Brown <broonie@sirena.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100503115753.GA6579@sirena.org.uk>
References: <1272790986-26842-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1272790986-26842-1-git-send-email-eric@eukrea.com>
X-Cookie: Revenge is a form of nostalgia.
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 80.68.93.111
X-SA-Exim-Mail-From: broonie@sirena.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] zlib: Add version 1.2.5
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
X-List-Received-Date: Mon, 03 May 2010 12:01:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 02, 2010 at 11:03:06AM +0200, Eric Benard wrote:
> - update autotool patch for this version
> - tested on x86
> 
> Signed-off-by: Eric Benard <eric@eukrea.com>

I don't see any handling of the incompatibility with old versions of
libxml here?


