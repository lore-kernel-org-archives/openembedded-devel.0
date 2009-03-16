Received: from [195.54.101.73] (helo=proxy3.bredband.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1LjLCW-0001WQ-Av
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Mar 2009 23:22:30 +0100
Received: from ironport2.bredband.com (195.54.101.122) by proxy3.bredband.net
	(7.3.139)
	id 49B5DCC6003E6C07 for openembedded-devel@lists.openembedded.org;
	Mon, 16 Mar 2009 23:21:46 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AtoOAOptvklT4zhBPGdsb2JhbAAIlUMBAQEBNb8Mg38G
X-IronPort-AV: E=Sophos;i="4.38,375,1233529200"; d="scan'208";a="464455884"
Received: from c-4138e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.101]) ([83.227.56.65])
	by ironport2.bredband.com with ESMTP; 16 Mar 2009 23:21:45 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Organization: Atmel Nordic AB
Date: Mon, 16 Mar 2009 22:52:48 +0100
Message-Id: <1237240368.5838.469.camel@grond>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1.1 
X-SA-Exim-Connect-IP: 195.54.101.73
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Deleting branches in main repository
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
X-List-Received-Date: Mon, 16 Mar 2009 22:22:30 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Still learning about git, and I managed to create one branch by mistake
  origin/local
There is also an obsolete branch which I want to remove 
  origin/ulf/atmel

Only want to keep the following.
  origin/ulf/linux

How can I clean up?

tried
git push origin :origin/local
and
git push origin :local
but this does not work

BR
Ulf Samuelsson



