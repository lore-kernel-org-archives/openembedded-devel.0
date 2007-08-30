Received: from [62.169.194.61] (helo=memova2.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1IQeaT-0004eg-91
	for openembedded-devel@openembedded.org; Thu, 30 Aug 2007 09:37:09 +0200
Received: from dias (62.169.211.226) by memova2.tellas.gr (7.3.118.8)
	id 4638635B02A6D7D7 for openembedded-devel@openembedded.org;
	Thu, 30 Aug 2007 09:34:09 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Thu, 30 Aug 2007 10:35:13 +0300
Message-ID: <HOECLKEKOHLAMMGDLLBHEEOHMBAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
Importance: Normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3138
In-Reply-To: <1188440260.32489.12.camel@localhost.localdomain>
Subject: Re: Problem: how to use kernel and cross-compiler that alreadyexist
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
X-List-Received-Date: Thu, 30 Aug 2007 07:37:09 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Check the wiki on using external toolchains with OE


Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com


> -----Original Message-----
> From: openembedded-devel-bounces@openembedded.org 
> [mailto:openembedded-devel-bounces@openembedded.org]On Behalf Of 
> Tongfeng.Yang
> Sent: Thursday, August 30, 2007 5:18 AM
> To: openembedded-devel@openembedded.org
> Subject: [oe] Problem: how to use kernel and cross-compiler that 
> alreadyexist
> 
> 
> Hello EveryOne:
>        I have a kernel and cross-compiler for a special device . and I
> want to run openmoko on that device .
> so the best way is use the exist tool to compile it ! I notice that OE
> auto fetch and compile cross tool .but think this :
>        My target device use glibc2.3.3 gcc 3.3.4 .so i change .conf file
> to this . But It can't pass . Lots of error occur when do_configure and
> do_build . so use exist tool is the only way i can go !
>         
>         how ?
> 
> Best wishes
> 
> Tongfeng.Yang 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 



