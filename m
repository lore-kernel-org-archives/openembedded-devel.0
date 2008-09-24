Received: from [194.183.74.10] (helo=smtp.mesa-lab.it ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alex@amiran.it>) id 1KiQg0-0005pR-Uj
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Sep 2008 11:28:52 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp.mesa-lab.it (Postfix) with ESMTP id 395FF5F40E4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2008 11:25:15 +0200 (CEST)
Received: from smtp.mesa-lab.it ([127.0.0.1])
	by localhost (posta.mesa-lab.it [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AYHJWnfgnbM6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2008 11:25:15 +0200 (CEST)
Received: from [192.168.1.201]
	(host146-91-static.34-85-b.business.telecomitalia.it [85.34.91.146])
	by smtp.mesa-lab.it (Postfix) with ESMTP id D8C5F5F40E1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2008 11:25:14 +0200 (CEST)
From: Alessandro Pellizzari <alex@amiran.it>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gb0738$dcq$1@ger.gmane.org>
References: <gb0738$dcq$1@ger.gmane.org>
Date: Wed, 24 Sep 2008 11:24:24 +0200
Message-Id: <1222248265.4350.11.camel@al.mesalab.lan>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: Math is hard, but please pay attention to PV
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
X-List-Received-Date: Wed, 24 Sep 2008 09:28:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Il giorno ven, 19/09/2008 alle 14.48 +0200, Koen Kooi ha scritto:

> Old version:
> libedje0 1:0.9.9.043+cvs20080610-r0
> 
> New version:
> libedje0 1:0.5.0.043+svnr35727-r1

Speaking of this, last weekend I tried to create a recipe for fbreader
0.8.17, but bitbake insisted on compiling fbreader 0.8.2a because 2 > 1
I had to remove the recipe for 0.8.2a from packages/fbreader.

Bye.

P.S.: No, I didn't succeed. I must study bb recipes better and review
some patches that don't apply.

-- 
Alessandro Pellizzari




