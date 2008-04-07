Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JisjD-0001hJ-4c
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Apr 2008 16:53:47 +0200
X-ASG-Debug-ID: 1207580024-4c0c001f0000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id ECC103A27F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Apr 2008 09:53:44 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id MEX0nDJCpMlHjaRj for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 07 Apr 2008 09:53:44 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] Building multiple gdb-cross targets
Date: Mon, 7 Apr 2008 09:53:49 -0500
User-Agent: KMail/1.9.7
References: <200804041057.55738.geoffrey@pager.net>
	<200804041346.08584.geoffrey@pager.net>
	<c384c5ea0804041354m576977a8he7b3a20acb99a3f5@mail.gmail.com>
In-Reply-To: <c384c5ea0804041354m576977a8he7b3a20acb99a3f5@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200804070953.49658.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1207580024
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Re: Building multiple gdb-cross targets
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
X-List-Received-Date: Mon, 07 Apr 2008 14:53:47 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 04 April 2008 03:54:36 pm Leon Woestenberg wrote:

> > From the avr32linux wiki entry on kernel debugging:
> > avr32-gdb (the standalone debugger) or avr32-linux-gdb. Preferably the
> > former since it has the ability to read and write system registers.
>
> Why would the linux-gdb not be able to touch those registers?

Don't know for sure, but I'd guess it has something to do with how Atmel 
patched gdb.

---
Geoffrey




