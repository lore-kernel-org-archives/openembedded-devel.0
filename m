Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LxOWP-0006dz-GV
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 18:45:10 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090424164018.ZFXM27308.fed1rmmtao101.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 24 Apr 2009 12:40:18 -0400
Received: from localhost.localdomain ([68.230.63.214])
	by fed1rmimpo03.cox.net with bizsmtp
	id jUgH1b00L4dMFYL04UgJth; Fri, 24 Apr 2009 12:40:18 -0400
X-Authority-Analysis: v=1.0 c=1 a=wtXCIhg2TaQA:10 a=9UqVfD8MlV0A:10
	a=WdFtJyupwkyhbagIkEYA:9 a=KyRmvWhjPJ85RaoiM_sA:7
	a=_g_ILGwRnX_mLLB7llBmh2kpi00A:4
X-CM-Score: 0.00
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Date: Fri, 24 Apr 2009 09:11:48 -0700
Message-Id: <1240589520-1104-1-git-send-email-trini@kernel.crashing.org>
X-Mailer: git-send-email 1.6.0.4
Subject: [PATCH][STABLE] Various SDK-related updates
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
X-List-Received-Date: Fri, 24 Apr 2009 16:46:06 -0000

The following series brings stable up to date with dev, with respect to
SDK and Canadian SDK changes.  The only not directly SDK related change
is the bugfix to wireless-tools so that libiw can be used.  mwester said
I should pull the SlugOS-related fix in myself rather than wait for him
to update SlugOS stuff in stable.  These changes have been build-tested
for gcc 4.1.2/4.2.4/4.3.3 and at91sam9263ek qemuarm omap5912osk
beagleboard vortex86sx qemux86 mpc8313e-rdb with DISTRO=angstrom-2008.1
in both dev and stable with identical results.  These changes are also
in the trini/stable/2009/sdk-updates branch.

-- 
Tom Rini



