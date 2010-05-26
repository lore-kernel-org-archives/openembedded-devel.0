Received: from ppsw-30.csi.cam.ac.uk ([131.111.8.130])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jic23@cam.ac.uk>) id 1OHGRH-000329-EJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 15:15:59 +0200
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:39750)
	by ppsw-30.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.156]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-AES256-SHA:256)
	id 1OHG7k-00006M-BF (Exim 4.70)
	(return-path <jic23@cam.ac.uk>); Wed, 26 May 2010 13:54:16 +0100
Message-ID: <4BFD1A6C.3000406@cam.ac.uk>
Date: Wed, 26 May 2010 13:56:12 +0100
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100426 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.0
X-SA-Exim-Connect-IP: 131.111.8.130
X-SA-Exim-Mail-From: jic23@cam.ac.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: ibrdtn recipes broken
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
X-List-Received-Date: Wed, 26 May 2010 13:16:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Just a quick heads up, I may get round to a patch later.

A build of imote2-image today is failing as the location for the
files needed for these recipes no longer contains versions
as old as we have recipes for.

Simply adding new versions of the recipe looks fine so far.

I have
ibrcommon_0.3.28.bb
ibrdtn_0.3.31.bb
ibrdtnd_0.3.35.bb

Jonathan

p.s. Stefan, thanks for doing the zigbee recipes!



