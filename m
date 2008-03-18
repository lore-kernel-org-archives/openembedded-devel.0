Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JbcBw-0007U0-Bq
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Mar 2008 14:49:31 +0100
X-ASG-Debug-ID: 1205848160-470f013b0000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id C4BA922EF8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2008 08:49:22 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id hFpjsX81OhGJZsIJ for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2008 08:49:22 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] [RFC] move to opkg
Date: Tue, 18 Mar 2008 08:49:20 -0500
User-Agent: KMail/1.9.7
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>
In-Reply-To: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>
MIME-Version: 1.0
Message-Id: <200803180849.21108.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1205848162
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
X-SA-Exim-Connect-IP: 209.253.16.26
X-SA-Exim-Mail-From: geoffrey@pager.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] move to opkg
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
X-List-Received-Date: Tue, 18 Mar 2008 13:49:31 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 18 March 2008 03:55:01 am Koen Kooi wrote:

> Poky just switched to opkg and removed ipkg completely, which I think
> is a good thing, but here's a less drastic patch for OE.
>
> Executive summary: you still get .ipk packages, just as before, only
> your rootfs ends up with opkg.  Things like sharprom-compat and wrt54g-
> oe will continue to work just as before.

I understand that opkg is a fork of ipkg, since ipkg was unmaintained.  But 
could someone explain what, if anything, this means to me as someone 
currently building a product using OpenEmbedded for the underpinning?

TIA!
---
Geoffrey


