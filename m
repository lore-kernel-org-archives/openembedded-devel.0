Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JZ0Mx-00046w-Fo
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 10:02:05 +0100
Received: from firewall.tw.openmoko.org ([124.219.5.210] helo=tamarin.local)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JZ0L4-00034h-Vh
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 10:00:03 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Mar 2008 09:59:59 +0100
User-Agent: KMail/1.9.9
References: <200803051942.12586.mickey@vanille-media.de>
	<1204748132.8110.165.camel@dax.rpnet.com>
In-Reply-To: <1204748132.8110.165.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200803110959.59702.zecke@selfish.org>
X-SA-Exim-Connect-IP: 81.169.183.159
X-SA-Exim-Mail-From: zecke@selfish.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: sysroot vs. finding header files
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
X-List-Received-Date: Tue, 11 Mar 2008 09:02:06 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 05 March 2008 21:15:32 Richard Purdie wrote:
> Hi Mickey,
>
> On Wed, 2008-03-05 at 19:42 +0100, Michael 'Mickey' Lauer wrote:
> [...]
>
> > With pkgconfig now pointing to /usr (and friends), this no longer finds a
> > keysymdef.h until you have X on your buildhost.
> >

> b) I've not seen any other package do anything that insane

aeh? finding a certain header file is quite common.. let us see how things 
work here. also I'm just slowly groking sysroot. It would be nice to know 
when and where certain path's get mapped away from /usr/include to something 
else...



