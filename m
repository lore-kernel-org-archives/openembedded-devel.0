Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OF3ab-0000OD-7L
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 13:06:59 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id A15B0166037D; Thu, 20 May 2010 05:02:55 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 3AA831660311;
	Thu, 20 May 2010 05:02:55 -0600 (MDT)
Message-ID: <4BF516DF.7030501@mlbassoc.com>
Date: Thu, 20 May 2010 05:02:55 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100330 Fedora/3.0.4-1.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [Angstrom-devel] Can't build Angstrom
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
X-List-Received-Date: Thu, 20 May 2010 11:06:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Can't build 'beagleboard-demo-image' in recent tree :-(

MACHINE=beagleboard
DISTRO="angstrom-2008.1"
OE Branch = org.openembedded.dev
   commit 81a3db27c33d87401b33362c58f26ad69e2d7b4e

ERROR: QA Issue with staging: eet.pc failed sanity test (tmpdir) in path /local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/pkgconfig
ERROR: QA staging was broken by the package built above
ERROR: Error in executing: /local/Angstrom_BeagleBoard/openembedded/recipes/util-linux-ng/util-linux-ng_2.17.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Build of /local/Angstrom_BeagleBoard/openembedded/recipes/util-linux-ng/util-linux-ng_2.17.bb do_qa_staging failed
ERROR: Task 592 (/local/Angstrom_BeagleBoard/openembedded/recipes/util-linux-ng/util-linux-ng_2.17.bb, do_qa_staging) failed

Any ideas?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


