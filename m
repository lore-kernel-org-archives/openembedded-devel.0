Received: from [192.115.104.17] (helo=sa3.bezeqint.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mike@compulab.co.il>) id 1IcEd1-0006ps-QQ
	for openembedded-devel@openembedded.org; Mon, 01 Oct 2007 08:19:39 +0200
Received: from localhost (sa3 [127.0.0.1])
	by sa3.bezeqint.net (Bezeq International SMTP out Mail Server) with
	ESMTP id B988330127 for <openembedded-devel@openembedded.org>;
	Mon,  1 Oct 2007 08:14:40 +0200 (IST)
X-Virus-Scanned: amavisd-new at bezeqint.net
Received: from sa3.bezeqint.net ([127.0.0.1])
	by localhost (sa3.bezeqint.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ZagTZUImPuS for <openembedded-devel@openembedded.org>;
	Mon,  1 Oct 2007 08:14:40 +0200 (IST)
Received: from mail.linux-boards.com (mail.linux-boards.com [192.114.83.142])
	by sa3.bezeqint.net (Bezeq International SMTP out Mail Server) with
	ESMTP for <openembedded-devel@openembedded.org>;
	Mon,  1 Oct 2007 08:14:40 +0200 (IST)
Received: from [10.1.1.95] ([10.1.1.95])
	by mail.linux-boards.com (8.12.5/8.12.8) with ESMTP id l91590at015263
	for <openembedded-devel@openembedded.org>;
	Mon, 1 Oct 2007 07:09:05 +0200
Message-ID: <47008E79.6020502@compulab.co.il>
Date: Mon, 01 Oct 2007 08:06:49 +0200
From: Mike Rapoport <mike@compulab.co.il>
User-Agent: Thunderbird 2.0.0.6 (X11/20070822)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
Subject: tune-iwmmx vs tune-xscale
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Oct 2007 06:19:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,
I'd like to ask if it is better to use "tune-xscale.conf" or "tune-iwmmx.conf"
for PXA270 based machine.

-- 
Sincerely yours,
Mike.



