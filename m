Received: from mxa.rambler.ru ([81.19.66.231])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alexondi@rambler.ru>) id 1NVotJ-0002Uj-2G
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 17:19:20 +0100
Received: from mcgi67.rambler.ru (mcgi67.rambler.ru [81.19.67.203])
	by mxa.rambler.ru (Postfix) with ESMTP id 20FF61E0D1F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 19:17:07 +0300 (MSK)
Received: from mcgi67.rambler.ru (localhost [127.0.0.1])
	by mcgi67.rambler.ru (Postfix) with ESMTP id 7A9D11152F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 19:17:04 +0300 (MSK)
Received: from [77.52.228.248] by mcgi67.rambler.ru with HTTP (mailimap);
	Fri, 15 Jan 2010 19:17:01 +0300
From: Perepelica Alexander <alexondi@rambler.ru>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Jan 2010 19:17:01 +0300
MIME-Version: 1.0
Message-Id: <629102848.1263572221.52729160.29574@mcgi67.rambler.ru>
X-Mailer: Ramail 3u, (untone), http://mail.rambler.ru
X-SA-Exim-Connect-IP: 81.19.66.231
X-SA-Exim-Mail-From: alexondi@rambler.ru
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Package masking
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
X-List-Received-Date: Fri, 15 Jan 2010 16:19:20 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; format="flowed"

Sorry, I found.
BBMASK = "\u-boot"
But my problem was not building but get git repo through proxy - I don't 
know how can do this, all what I found in google don't help. So I decide 
mask him


