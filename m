Received: from [204.2.163.5] (helo=sjogate2.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Shane.Dixon@atmel.com>) id 1Lhnmt-000407-Gt
	for openembedded-devel@openembedded.org; Thu, 12 Mar 2009 17:29:39 +0100
Received: from csomb01.corp.atmel.com ([10.95.30.150])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id n2CGS8um009719
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Mar 2009 09:28:08 -0700 (PDT)
Received: from 10.95.105.47 ([10.95.105.47]) by csomb01.corp.atmel.com
	([10.95.30.150]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu, 12 Mar 2009 16:29:22 +0000
Received: from homestead.cso.atmel.com by csomb01.corp.atmel.com;
	12 Mar 2009 10:29:22 -0600
From: Shane Dixon <shane.dixon@atmel.com>
To: openembedded-devel@openembedded.org
Organization: Atmel
Date: Thu, 12 Mar 2009 10:29:22 -0600
Message-Id: <1236875362.11134.22.camel@homestead>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: Working with the Target
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
X-List-Received-Date: Thu, 12 Mar 2009 16:29:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi all,

I am curious to know how others are working with their target device.
My last application would build from OE and I had a public/private key
on my device and a makefile that automatically scp'd the program,
uninstall the old, install the new, and ran the program to test it.  I'd
like to do something like netboot the device and keep the kernel and
rootfs on my machine shared over NFS, but I'm not sure if I can do that
with OE.  

How are others testing new applications with their target boards?

(By the way, my target is an at91sam9263ek)

-- 
Shane Dixon
Atmel Corporation
E-mail: shane.dixon@atmel.com


