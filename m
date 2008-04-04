Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JhoIR-0004Ec-Ue
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Apr 2008 17:57:44 +0200
X-ASG-Debug-ID: 1207324662-151300140000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 401FC3778B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Apr 2008 10:57:42 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id rXCDfUz2Z6jiTUgm for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 04 Apr 2008 10:57:42 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Building multiple gdb-cross targets
Date: Fri, 4 Apr 2008 10:57:55 -0500
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200804041057.55738.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1207324662
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Building multiple gdb-cross targets
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
X-List-Received-Date: Fri, 04 Apr 2008 15:57:44 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

Another question about build gdb-cross for the AVR32.  Building gdb-cross gets 
me avr32-angstrom-linux-uclibc-gdb.  But over at this page, 
http://avr32linux.org/twiki/bin/view/Main/KernelDebugging, it says you really 
want an standalone gdb for kernel debugging.

How can I get OE to build just an avr32-gdb?  How can I get OE to build both 
avr32-gdb and avr32-linux-gdb (aka avr32-angstrom-linux-uclibc-gdb)?  

TIA,
---
Geoffrey


