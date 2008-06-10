Received: from [212.27.42.30] (helo=smtp4-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1K69Z0-0004Nx-9i
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jun 2008 21:31:26 +0200
Received: from smtp4-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 40DC23EA0B7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2008 21:26:01 +0200 (CEST)
Received: from sharky.jerryweb.org (vau75-7-82-234-248-119.fbx.proxad.net
	[82.234.248.119])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 281543EA0DA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2008 21:26:00 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id 7A87C184031
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2008 21:26:16 +0200 (CEST)
Message-ID: <484ED558.7070907@bolloretelecom.eu>
Date: Tue, 10 Jun 2008 21:26:16 +0200
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.14) Gecko/20080509 Lightning/0.8 Thunderbird/2.0.0.14
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <g2h415$pk1$1@ger.gmane.org>
In-Reply-To: <g2h415$pk1$1@ger.gmane.org>
Subject: Re: pkg_postinst_* not working anymore -> broken packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 10 Jun 2008 19:31:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Any chance of getting bitbake commit r1072 backed out soon (the one that
broke the postins* scripts), because for now pinning to r1071 is pretty
much the only sane way to get a sane build environment?

Cheers,
Jeremy


