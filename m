Received: from [192.115.104.18] (helo=sa4.bezeqint.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1K89Dt-0001uE-LY
	for openembedded-devel@openembedded.org; Mon, 16 Jun 2008 09:34:05 +0200
Received: from localhost (sa4 [127.0.0.1])
	by sa4.bezeqint.net (Bezeq International SMTP out Mail Server) with
	ESMTP id 47A9530036 for <openembedded-devel@openembedded.org>;
	Mon, 16 Jun 2008 10:21:47 +0300 (IDT)
X-Virus-Scanned: amavisd-new at bezeqint.net
Received: from sa4.bezeqint.net ([127.0.0.1])
	by localhost (sa4.bezeqint.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VrGUN1nzKHOj for <openembedded-devel@openembedded.org>;
	Mon, 16 Jun 2008 10:21:46 +0300 (IDT)
Received: from mail.linux-boards.com (mail.linux-boards.com [192.114.83.142])
	by sa4.bezeqint.net (Bezeq International SMTP out Mail Server) with
	ESMTP for <openembedded-devel@openembedded.org>;
	Mon, 16 Jun 2008 10:21:46 +0300 (IDT)
Received: from [10.1.1.95] (mike-pc.compulab.local [10.1.1.95])
	by mail.linux-boards.com (8.12.5/8.12.8) with ESMTP id m5G6Mxes019810
	for <openembedded-devel@openembedded.org>;
	Mon, 16 Jun 2008 09:23:01 +0300
Message-ID: <48561735.5030700@compulab.co.il>
Date: Mon, 16 Jun 2008 10:33:09 +0300
From: Mike Rapoport <mike@compulab.co.il>
User-Agent: Thunderbird 2.0.0.6 (X11/20070822)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
Subject: Different EXTRA_INSTALL for different machines
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
X-List-Received-Date: Mon, 16 Jun 2008 07:34:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I'm building Angstrom images for different machines and I need to include
different sets of extra packages in the images. Is it possible to make
EXTRA_INSTALL dependent on the machine in the same local.conf?

-- 
Sincerely yours,
Mike.




