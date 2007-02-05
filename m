Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HE5RV-00081k-Pu
	for openembedded-devel@openembedded.org; Mon, 05 Feb 2007 16:07:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l15F7fqR005022
	for <openembedded-devel@openembedded.org>; Mon, 5 Feb 2007 15:07:41 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04460-06 for <openembedded-devel@openembedded.org>;
	Mon,  5 Feb 2007 15:07:38 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l15F7boS005014
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 5 Feb 2007 15:07:38 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <45C7267D.7060906@4g-systems.com>
References: <995082.46394.qm@web15204.mail.cnb.yahoo.com>
	<45C7267D.7060906@4g-systems.com>
Date: Mon, 05 Feb 2007 15:07:37 +0000
Message-Id: <1170688058.5801.82.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: How to use the qemu-arm to run an image which was built	in oe?
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
X-List-Received-Date: Mon, 05 Feb 2007 15:07:42 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-02-05 at 13:43 +0100, Patrick Fischer wrote:
> zechao wang wrote:
> > Hello:
> > The image was based on arm. I was told that the qemu-arm could run it, but i don't know how?
> >   
> *Hello
> http://www.rpsys.net/openzaurus/qemu/

That page is way out of date. I'll fix it...

> Please let me know if it works for you. I cound not get it working.
> Using Debian Etch or Ubuntu 6.10

http://svn.o-hand.com/view/poky/trunk/scripts/
and more specifically
http://svn.o-hand.com/view/poky/trunk/scripts/poky-qemu.README?rev=1146&view=auto

A qemu deb and a poky standalone scripts deb for edgy are available at:
http://debian.o-hand.com/edgy/

http://debian.o-hand.com/edgy/poky-scripts_2_all.deb
http://debian.o-hand.com/edgy/qemu_0.8.2-3oh5_i386.deb

Other distros have repositories there but might not be as up to date.

Cheers,

Richard



