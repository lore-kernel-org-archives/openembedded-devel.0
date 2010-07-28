Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Oe9AJ-00066g-Je
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 18:07:35 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D443611000A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 18:07:14 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 2C428110009E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 18:07:13 +0200 (CEST)
Received: from rhein.familie-heinold.de (f052229176.adsl.alicedsl.de
	[78.52.229.176]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 18:07:13 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 68A503C0EF; Wed, 28 Jul 2010 18:07:12 +0200 (CEST)
Date: Wed, 28 Jul 2010 18:07:12 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100728160711.GA9553@rhein.zuhause.netz>
References: <mailman.126.1280326040.17151.openembedded-devel@lists.openembedded.org>
	<4C504C00.8080207@tycoelectronics.com>
MIME-Version: 1.0
In-Reply-To: <4C504C00.8080207@tycoelectronics.com>
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
Subject: Re: Qt4 recipe fix; fixes configure so compiler is detected properly, and QXMLPatterns gets built
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
X-List-Received-Date: Wed, 28 Jul 2010 16:07:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I would really kind of you to use "git diff" and attach the resulting patch here.
Or use git format-patch and git send-email.

Bye Henning


