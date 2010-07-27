Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OdeRR-0007t1-GL
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 09:19:10 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 4C00F1100092
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 09:18:49 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 13BDD1100085
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 09:18:44 +0200 (CEST)
Received: from rhein.familie-heinold.de (f052237230.adsl.alicedsl.de
	[78.52.237.230]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 09:18:43 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 93DF93C0EF; Tue, 27 Jul 2010 09:18:27 +0200 (CEST)
Date: Tue, 27 Jul 2010 09:18:27 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100727071827.GA3397@rhein.zuhause.netz>
References: <20100727010733.1B6BB46773@linux.fjfi.cvut.cz>
MIME-Version: 1.0
In-Reply-To: <20100727010733.1B6BB46773@linux.fjfi.cvut.cz>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] cmake-native: add recipe for cmake 2.8.2.
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
X-List-Received-Date: Tue, 27 Jul 2010 07:19:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Eduardo Lima sends in patches for cmake 2.8 too. So please coordinate with him.
I would like to see a fine recipe with which uses the latest features
available in OE like BBCLASSEXTENDED and so on.

Bye Henning


