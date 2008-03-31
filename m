Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JgMxd-0002nE-Kt
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Mar 2008 18:34:17 +0200
X-ASG-Debug-ID: 1206981256-35f4000a0000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 666CE31A9C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2008 11:34:16 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id qQcorQSxyefDfnwm for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2008 11:34:16 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] New OE user question
Date: Mon, 31 Mar 2008 11:34:26 -0500
User-Agent: KMail/1.9.7
References: <200803310907.56781.e.robertson.svg@gmail.com>
	<c384c5ea0803310844l1e91faa0m86a699174afeabf7@mail.gmail.com>
	<fsr2gk$t6o$1@ger.gmane.org>
In-Reply-To: <fsr2gk$t6o$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200803311134.26764.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1206981256
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Re: New OE user question
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
X-List-Received-Date: Mon, 31 Mar 2008 16:34:17 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 31 March 2008 11:12:03 am Koen Kooi wrote:
> Leon Woestenberg schreef:
> | On Mon, Mar 31, 2008 at 4:07 PM, E Robertson

> | Can someone suggest a saner distribution for this Samsung chip?
>
> angstrom maybe?
>
> It's an atmel chip, and atmel itself recommends angstrom:
> http://www.linux4sam.org/twiki/bin/view/Linux4SAM/OpenEmbeddedAngstrom

That page looks pretty neutral on Angstrom to me.  Maybe it's been updated 
since you read it last?

Atmel does seems to like to use buildroot internally, but I've never seen them 
recommend against OE / Angstrom.  Interesting side note, it seems they 
recently had to rollback some of their AVR32 gcc patches in the buildroot 
mainline because they were breaking stuff there.

---
Geoffrey


