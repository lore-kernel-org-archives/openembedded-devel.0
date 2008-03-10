Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JYiol-0001bZ-EA
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Mar 2008 15:17:38 +0100
X-ASG-Debug-ID: 1205158537-5a1500140000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id A0B1C13F63
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Mar 2008 09:15:38 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id CyKpssw4KTVIRvcH for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 10 Mar 2008 09:15:38 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] AVR32 init segfault: Any resolution?
Date: Mon, 10 Mar 2008 09:15:36 -0500
User-Agent: KMail/1.9.7
References: <200803071113.40387.geoffrey@pager.net>
	<fqrti8$nlt$2@ger.gmane.org>
In-Reply-To: <fqrti8$nlt$2@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200803100915.36819.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1205158538
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
X-SA-Exim-Connect-IP: 209.253.16.26
X-SA-Exim-Mail-From: geoffrey@pager.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: AVR32 init segfault: Any resolution?
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
X-List-Received-Date: Mon, 10 Mar 2008 14:17:40 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 07 March 2008 11:21:11 am Koen Kooi wrote:
> Geoffrey Wossum schreef:

> You should be able to use busybox as init nowadays, or add add uclibc
> 0.9.29 for avr32 :)

Going to uClibc 0.9.29 fixed some of the weird build problems I was having, 
but I still get a segfault on init.

So how do I go about making busybox my init?

---
Geoffrey



