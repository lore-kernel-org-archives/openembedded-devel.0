Received: from 83-216-141-215.markhi700.adsl.metronet.co.uk ([83.216.141.215]
	helo=mx.hindley.org.uk) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mark@hindley.org.uk>) id 1OCUDy-0000FW-KV
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 10:56:59 +0200
Received: from vpn.hindleynet
	([10.254.254.2] helo=mercury.hindleynet ident=Debian-exim)
	by mx.hindley.org.uk with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <mark@hindley.org.uk>) id 1OCU0h-00059I-NV
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 09:43:15 +0100
Received: from mark by mercury.hindleynet with local (Exim 4.69)
	(envelope-from <mark@hindley.org.uk>) id 1OCU0d-0000mZ-3Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 09:43:11 +0100
Date: Thu, 13 May 2010 09:43:11 +0100
From: Mark Hindley <mark@hindley.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100513084311.GH1136@hindley.org.uk>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 83.216.141.215
X-SA-Exim-Mail-From: mark@hindley.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: h3900: Kernel 2.4/2.6 selector or build for Famliar
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
X-List-Received-Date: Thu, 13 May 2010 08:56:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I have been trying to build some more recent GPE packages for my h3900
which is running Familiar. I have managed it successfully by fixing and
adding .bb files to the Familiar build tree, but as Familiar dev seems
to have finished, I was wondering whether it was more sensible to use
current OE.

Hardware support for 2.6 in Angstrom is not really complete enough for
everyday use. 

I was thinking of adding a 2.4/2.6 kernel selector for h3900 (in the
same way as collie etc) and then using distro/angstrom (with the
necessary PREFERRED_VERSION overrides in local.conf) or recreating
distro/familiar.

Does anybody have any thoughts/comments/suggestions/caveats on this approach?

Many thanks

Mark


