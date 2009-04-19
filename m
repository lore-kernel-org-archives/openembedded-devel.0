Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1Lvc75-0005wH-CA
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Apr 2009 20:51:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id C223B2C7FD;
	Sun, 19 Apr 2009 18:45:19 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18cqfHB8sBx3; Sun, 19 Apr 2009 18:45:18 +0000 (UTC)
Received: from [10.1.10.2] (host61-87-static.14-79-b.business.telecomitalia.it
	[79.14.87.61]) by wiki.koala.it (Postfix) with ESMTP id C19672C797;
	Sun, 19 Apr 2009 18:45:17 +0000 (UTC)
Message-ID: <49EB7194.2030307@gmail.com>
Date: Sun, 19 Apr 2009 20:46:44 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [BUG][STABLE] bluez-utils fails with stable/2009
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
X-List-Received-Date: Sun, 19 Apr 2009 18:51:46 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi,
I am trying to build stable/2009 - qemux86 - x11-image
but I face to an error in bluez-utils-3.36-r4

bitbake -cclean bluez-utils && bitbake bluez-utils
http://tinderbox.openembedded.net/public/logs/4468808.txt

Seems that with org.openembedded.dev branch bluez-utils builds, although
x11-image is broken

I tried some workaround without success, and I need help from someone or
the mantainer of this recipe.
TIA

/marco


