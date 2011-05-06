Received: from mail.paepke.net ([85.115.14.134])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tobias.paepke@paepke.net>) id 1QIMCV-0006mY-GH
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 16:40:15 +0200
Received: from localhost ([127.0.0.1])
	by mail.paepke.net with esmtp (Exim 4.69)
	(envelope-from <tobias.paepke@paepke.net>) id 1QILkV-0000aM-Ir
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 16:11:19 +0200
X-Virus-Scanned: Debian amavisd-new at paepke.net
Received: from mail.paepke.net ([127.0.0.1])
	by localhost (mail.paepke.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gQ7MfpTxKt0Y
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2011 16:11:16 +0200 (CEST)
Received: from p5dd27c33.dip.t-dialin.net ([93.210.124.51]
	helo=[192.168.66.199])
	by mail.paepke.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <tobias.paepke@paepke.net>)
	id 1QILkS-0000aH-HH for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 16:11:16 +0200
Message-ID: <4DC40186.7030901@paepke.net>
Date: Fri, 06 May 2011 16:11:18 +0200
From: Tobias Paepke <tobias.paepke@paepke.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20110307 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.0.1
Subject: bin/install fix on 2011.03-maintenance
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
X-List-Received-Date: Fri, 06 May 2011 14:40:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

hi,

please pull commit 653fddf050941958aeaa49f8e70814a7c0b3fded from oe.dev
into 2011.03-maintenance

cause it fixes the missing -t argument of the install wrapper on the
mozilla/nss recipe.

thanks in advance

tobias


