Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JlSyR-0001MI-No
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Apr 2008 20:00:16 +0200
X-ASG-Debug-ID: 1208196009-42e7000d0000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 463F840851
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2008 13:00:09 -0500 (CDT)
Received: from [192.168.1.71] (LRS-CiscoBackup [192.168.1.1]) by
	barracuda.pager.net with ESMTP id 06bxD58HY0T4XDah for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2008 13:00:09 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: binutils 2.17.atmel.1.2.6 and gcc 4.2.2.atmel.1.0.8 for AVR32
Date: Mon, 14 Apr 2008 13:00:16 -0500
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200804141300.16904.geoffrey@pager.net>
X-Barracuda-Connect: LRS-CiscoBackup[192.168.1.1]
X-Barracuda-Start-Time: 1208196009
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: binutils 2.17.atmel.1.2.6 and gcc 4.2.2.atmel.1.0.8 for AVR32
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
X-List-Received-Date: Mon, 14 Apr 2008 18:00:16 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

For anyone interested in the AVR32, I just submitted patches to upgrade gcc to 
4.2.2.atmel.1.0.8 and binutils 2.17.atmel.1.2.6.  See 
http://bugs.openembedded.net/show_bug.cgi?id=4178

Yes, I know OE contains binutils 2.17.atmel.1.3.0, but this 2.17.atmel.1.2.6 
is actually newer.  It's also required to assemble the output of the new gcc 
4.2.2.atmel.1.0.8.

There's also a fix in the binutils patch for having a texinfo version >= 4.10.  
See https://bugzilla.redhat.com/show_bug.cgi?id=345621 for more info.

---
Geoffrey


