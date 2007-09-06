Received: from [62.169.194.61] (helo=memova2.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1ITAp4-0001PU-Fq
	for openembedded-devel@openembedded.org; Thu, 06 Sep 2007 08:26:38 +0200
Received: from dias (62.169.211.226) by memova2.tellas.gr (7.3.118.8)
	id 4638635B02D49011 for openembedded-devel@openembedded.org;
	Thu, 6 Sep 2007 08:22:56 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Thu, 6 Sep 2007 09:24:01 +0300
Message-ID: <HOECLKEKOHLAMMGDLLBHEEOGMCAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3138
Importance: Normal
In-Reply-To: <1189029160.7849.61.camel@localhost.localdomain>
Subject: Re: [oe-commits] org.oe.dev conf/machine/i586-generic.conf:Add	pentium optimization for i586-generic machine
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
X-List-Received-Date: Thu, 06 Sep 2007 06:26:38 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Richard i am sorry but i missed that. 
Fixed it with a new commit

Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com


> -----Original Message-----
> From: openembedded-devel-bounces@openembedded.org 
> [mailto:openembedded-devel-bounces@openembedded.org]On Behalf Of 
> Richard Purdie
> Sent: Thursday, September 06, 2007 12:53 AM
> To: openembedded-devel@openembedded.org
> Subject: Re: [oe] [oe-commits] org.oe.dev 
> conf/machine/i586-generic.conf:Add pentium optimization for 
> i586-generic machine
> 
> 
> On Wed, 2007-09-05 at 19:31 +0200, ifaistos commit wrote:
> > conf/machine/i586-generic.conf: Add pentium optimization for 
> i586-generic machine
> > 
> > Author: ifaistos@openembedded.org
> > Branch: org.openembedded.dev
> > Revision: 75a1835734e4451c1fbfe778538e2af0ae991114
> > ViewMTN: 
> http://monotone.openembedded.org/revision.psp?id=75a1835734e4451c1
fbfe778538e2af0ae991114
> Files:
> 1
> conf/machine/include/tune-pentium.conf
> conf/machine/i586-generic.conf

I just renamed all of conf/machine/include to .inc :-(

Richard


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




