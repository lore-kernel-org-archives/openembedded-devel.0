Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1N9lMs-0001wY-DM
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Nov 2009 21:06:41 +0100
Received: from [192.168.0.100] (ip-81-210-244-172.unitymediagroup.de
	[81.210.244.172])
	by drlauer-research.com (Postfix) with ESMTP id AB42E584141
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2009 21:51:35 +0100 (CET)
Message-Id: <765C6FD6-3D2B-4E03-9DA5-F369ABC1A21F@vanille-media.de>
From: Michael Lauer <mickey@vanille-media.de>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <hdpei2$9pm$1@ger.gmane.org>
X-Mailer: iPhone Mail (7D11)
Mime-Version: 1.0 (iPhone Mail 7D11)
Date: Sun, 15 Nov 2009 21:05:16 +0100
References: <E1N9c2H-0004ay-Ni@melo.openembedded.org>
	<hdpei2$9pm$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Michael 'Mickey' Lauer : ltrace: fix wrong path to coreutils-native and add actual dependency
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
X-List-Received-Date: Sun, 15 Nov 2009 20:06:41 -0000
Content-Type: text/plain;
	charset=us-ascii;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: 7bit

Sorry, for some reason coreutils installs its install exactly with  
this path here - guess that's why it broke for me without my patch.

Which version are you building?

Cheers,

:M:


