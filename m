Received: from [69.17.117.3] (helo=mail1.sea5.speakeasy.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <erik@hovland.org>) id 1I95nn-00017L-1k
	for openembedded-devel@openembedded.org; Thu, 12 Jul 2007 23:02:20 +0200
Received: (qmail 8761 invoked from network); 12 Jul 2007 20:56:23 -0000
Received: from dsl092-045-201.lax1.dsl.speakeasy.net (HELO speakeasy.net)
	([66.92.45.201]) (envelope-sender <erik@hovland.org>)
	by mail1.sea5.speakeasy.net (qmail-ldap-1.03) with SMTP
	for <openembedded-devel@lists.openembedded.org>;
	12 Jul 2007 20:56:22 -0000
Received: by speakeasy.net (nbSMTP-1.00) for uid 1000
	erik@hovland.org; Thu, 12 Jul 2007 13:56:22 -0700 (PDT)
Date: Thu, 12 Jul 2007 13:56:22 -0700
From: Erik Hovland <erik@hovland.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070712205622.GB12515@hovland.org>
References: <193a0cf50707121105y703147cbr935d6a603d01e6d6@mail.gmail.com>
	<860C48AB-BFEE-414D-9275-B20556FA10B7@selfish.org>
MIME-Version: 1.0
In-Reply-To: <860C48AB-BFEE-414D-9275-B20556FA10B7@selfish.org>
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: Re: ipkg on MacOS X (missing feature.h)
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
X-List-Received-Date: Thu, 12 Jul 2007 21:02:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 12, 2007 at 08:57:04PM +0200, Holger Freyther wrote:
> 
> Am 12.07.2007 um 20:05 schrieb Krzysztof Kajkowski:
> 
> > Hello everyone!
> >
> > I am trying to set up OpenMoko environment on my Macbook - you can see
> > my efforts on  http://wiki.openmoko.org/wiki/ 
> > OpenMoko_under_QEMU_on_MacOSX
> >
> > Now I'm struggling with compiling ipkg. Here's my log:
> >
> 
> Check the OE wiki for building on non Linux. Go to the viewcvs of  
> handhelds.org for ipkg and check my old patch which was backed out.  
> Basicly features.h is a glibc (or was it gcc on linux?) thing and is  
> in (lib)busybox only to detect libc5.

If you still have the patch I might be convinced to give it another go.

E

-- 
Erik Hovland
mail: erik@hovland.org
web: http://hovland.org/
PGP/GPG public key available on request



