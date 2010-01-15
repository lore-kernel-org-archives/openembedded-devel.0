Received: from mxa.rambler.ru ([81.19.66.231])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alexondi@rambler.ru>) id 1NVoFB-0005gc-IN
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 16:37:52 +0100
Received: from mcgi66.rambler.ru (mcgi66.rambler.ru [81.19.67.202])
	by mxa.rambler.ru (Postfix) with ESMTP id 7388EA0354
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 18:35:39 +0300 (MSK)
Received: from mcgi66.rambler.ru (localhost [127.0.0.1])
	by mcgi66.rambler.ru (Postfix) with ESMTP id ED6451158D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 18:35:36 +0300 (MSK)
Received: from [77.52.228.248] by mcgi66.rambler.ru with HTTP (mailimap);
	Fri, 15 Jan 2010 18:35:34 +0300
From: Perepelica Alexander <alexondi@rambler.ru>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Jan 2010 18:35:34 +0300
MIME-Version: 1.0
Message-Id: <954760291.1263569734.52803256.32148@mcgi66.rambler.ru>
X-Mailer: Ramail 3u, (untone), http://mail.rambler.ru
X-SA-Exim-Connect-IP: 81.19.66.231
X-SA-Exim-Mail-From: alexondi@rambler.ru
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Package masking
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
X-List-Received-Date: Fri, 15 Jan 2010 15:37:52 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; format="flowed"

Hi!
How can I mask package, e.g. disable adding all versions of some 
package? In my case u-boot build is failed and I don't needed this 
package. I tried play with BBMASK and have don't create correct value 
for this variable.

--
Thank you.


