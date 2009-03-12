Received: from [204.2.163.5] (helo=sjogate2.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Shane.Dixon@atmel.com>) id 1Lht4Z-0001jN-9B
	for openembedded-devel@openembedded.org; Thu, 12 Mar 2009 23:08:15 +0100
Received: from csomb01.corp.atmel.com ([10.95.30.150])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id n2CLwmob011011
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Mar 2009 15:06:42 -0700 (PDT)
Received: from 10.95.105.47 ([10.95.105.47]) by csomb01.corp.atmel.com
	([10.95.30.150]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu, 12 Mar 2009 22:02:46 +0000
Received: from homestead.cso.atmel.com by csomb01.corp.atmel.com;
	12 Mar 2009 16:02:46 -0600
From: Shane Dixon <shane.dixon@atmel.com>
To: openembedded-devel@openembedded.org
In-Reply-To: <200903122027.20010.marcin@juszkiewicz.com.pl>
References: <1236875362.11134.22.camel@homestead>
	<200903122027.20010.marcin@juszkiewicz.com.pl>
Organization: Atmel
Date: Thu, 12 Mar 2009 16:02:46 -0600
Message-Id: <1236895366.17908.127.camel@homestead>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: Re: Working with the Target
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Mar 2009 22:08:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-03-12 at 20:27 +0100, Marcin Juszkiewicz wrote:

> I used my at91sam9263ek with kernel fetched via TFTP and NFS root for 
> quite long time. It is very useful way to change rootfs contents - 
> especially when you can press 'Reset' any time without risk of 
> unfinished transactions.

I'd like to setup the same thing, but I didn't see anything in the OE
manual for creating a bootable rootfs directory.  Would it be possible
for you to dump a few files like your u-boot printenv, your tftp config,
your nfs config, and local.conf?



-- 
Shane Dixon
Atmel Corporation
Office: 719.540.1123
E-mail: shane.dixon@atmel.com


