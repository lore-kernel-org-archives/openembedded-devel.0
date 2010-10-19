Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1P8CVH-0008Pt-Uu
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 15:45:24 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 438A911000E8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 15:44:49 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B4D8F11000E3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 15:44:48 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225147224.adsl.alicedsl.de
	[92.225.147.224]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 15:44:48 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id E1E263C105; Tue, 19 Oct 2010 15:44:23 +0200 (CEST)
Date: Tue, 19 Oct 2010 15:44:23 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101019134423.GA3443@rhein.zuhause.netz>
References: <1287420263-28528-1-git-send-email-msmith@cbnco.com>
	<lypqv6492b.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<AANLkTikkRYEJUGrR5VYDwS7Yb6fW-aqfF_Ta1gh5sA8c@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikkRYEJUGrR5VYDwS7Yb6fW-aqfF_Ta1gh5sA8c@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] package.bbclass: copy dotfiles in root D to PKGD
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
X-List-Received-Date: Tue, 19 Oct 2010 13:45:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hm,

the overall question here is, why the class is still using os.system instead of subprocess.

Bye Henning


