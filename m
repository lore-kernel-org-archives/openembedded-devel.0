Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1P72yz-0003FX-Pu
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 11:23:19 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 7730C11000E8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 11:22:45 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 3B8B311000E3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 11:22:44 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225007172.adsl.alicedsl.de
	[92.225.7.172]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 11:22:44 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id A27783C0FD; Sat, 16 Oct 2010 11:22:16 +0200 (CEST)
Date: Sat, 16 Oct 2010 11:22:16 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101016092214.GA3651@rhein.zuhause.netz>
References: <1287157551.4233.20.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1287157551.4233.20.camel@mattotaupa>
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
Subject: Re: [PATCH] cacao-native-0.99.3: fix `install: cannot stat `src/cacaoh/.libs/cacaoh': No such file or directory`
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
X-List-Received-Date: Sat, 16 Oct 2010 09:23:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I suspect libtool 2.2 vs. 2.4 here.

Bye Henning


