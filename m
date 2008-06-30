Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mdarland@pager.net>) id 1KDRdi-0000WP-TD
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jul 2008 00:14:28 +0200
X-ASG-Debug-ID: 1214863888-467c01c30000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from mail.pager.net (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id B3845E0D9A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2008 17:11:28 -0500 (CDT)
Received: from mail.pager.net (lrs-ad1.longragesystems.local [192.168.1.254])
	by barracuda.pager.net with ESMTP id slBt9GSDGzYfVHp0 for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2008 17:11:28 -0500 (CDT)
X-ASG-Whitelist: Sender
Received: from [192.168.1.43] ([192.168.1.43]) by mail.pager.net with
	Microsoft SMTPSVC(6.0.3790.1830); Mon, 30 Jun 2008 17:10:25 -0500
From: Matt Darland <mdarland@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: opkg and libgnutls linkage
Date: Mon, 30 Jun 2008 17:08:01 -0500
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200806301708.02305.mdarland@pager.net>
X-OriginalArrivalTime: 30 Jun 2008 22:10:25.0593 (UTC)
	FILETIME=[18FE5A90:01C8DAFE]
X-Barracuda-Connect: lrs-ad1.longragesystems.local[192.168.1.254]
X-Barracuda-Start-Time: 1214863888
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: opkg and libgnutls linkage
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
X-List-Received-Date: Mon, 30 Jun 2008 22:14:33 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

When I install opkg-nogpg and try to run it on my target system I get the 
error 

"opkg: error while loading shared libraries: libgnutls.so.26: cannot open 
shared object file: No such file or directory"

It appears that there is a libgnutls.so.13 installed on my system, but I can't 
seem to figure out where a '26' might be....

Any insight?

---
Thanks



