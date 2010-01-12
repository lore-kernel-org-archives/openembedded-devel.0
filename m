Received: from mxa.rambler.ru ([81.19.66.231])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alexondi@rambler.ru>) id 1NUbcw-0000VS-6w
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 08:57:25 +0100
Received: from mcgi65.rambler.ru (mcgi65.rambler.ru [81.19.67.199])
	by mxa.rambler.ru (Postfix) with ESMTP id 9B9C8A2BC1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 10:49:40 +0300 (MSK)
Received: from mcgi65.rambler.ru (localhost [127.0.0.1])
	by mcgi65.rambler.ru (Postfix) with ESMTP id 04D055CB0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 10:49:38 +0300 (MSK)
Received: from [77.52.17.176] by mcgi65.rambler.ru with HTTP (mailimap);
	Tue, 12 Jan 2010 10:49:35 +0300
From: Perepelica Alexander <alexondi@rambler.ru>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Jan 2010 10:49:35 +0300
MIME-Version: 1.0
Message-Id: <1234549968.1263282575.49599928.71648@mcgi65.rambler.ru>
X-Mailer: Ramail 3u, (untone), http://mail.rambler.ru
X-SA-Exim-Connect-IP: 81.19.66.231
X-SA-Exim-Mail-From: alexondi@rambler.ru
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Gnu/stubs-32.h not found
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
X-List-Received-Date: Tue, 12 Jan 2010 07:57:25 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; format="flowed"

Hi!
I try compile target for x86_64 platform but I get
/x86_64-oe-linux/usr/include/gnu/stubs.h:7:27: error: gnu/stubs-32.h: No 
such file or directory
Where can I disable multilib feature gcc?
Or maybe can I install multilibs into target?


--
Thank you.
Perepelica Alexander


