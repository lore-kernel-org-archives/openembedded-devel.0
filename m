Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QEIkM-0007cG-NY for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 12:10:27 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QEIi0-0007xU-7B for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 12:08:00 +0200
Received: from 77.126.199.51 ([77.126.199.51])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2011 12:08:00 +0200
Received: from dzvernik by 77.126.199.51 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2011 12:08:00 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: DmitryZ <dzvernik@gmail.com>
Date: Mon, 25 Apr 2011 10:07:48 +0000 (UTC)
Message-ID: <loom.20110425T113723-263@post.gmane.org>
References: <1302979061.3780.6.camel@mattotaupa>
	<1303062425.23572.31.camel@mattotaupa>
	<4DACB16C.6050303@eric-weiss.de>
	<loom.20110423T113131-855@post.gmane.org>
	<1303553742.4551.2.camel@mattotaupa>
	<loom.20110423T144701-128@post.gmane.org>
	<1303655726.3956.4.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 77.126.199.51 (Mozilla/5.0 (X11; U; Linux i686;
	en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chrome/10.0.648.205
	Safari/534.16)
Subject: Re: [RFC] [PATCH] schroedinger: add version 1.0.10
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
X-List-Received-Date: Mon, 25 Apr 2011 10:10:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Dear Paul,

Sorry for the long delay, holidays you know and I have a very slow machine for 
building (32 bit etc.) available for me without Psyco JIT, since I have Python 
2.7 installed by default that current sources of Psyco JIT Compiler doesn't 
support.

So, answering your questions, yes after updating to the last master I 
successfully build the schroedinger package and the whole Angstrom 
console-image for the mini6410 with the parameters described earlier in this 
thread. Thanks a lot for the assistance and help. 
Just to let you know I haven't tested the image on the target board, so I can 
confirm only the build.

Again, as being newbie to the whole stuff I simply don't know where I should 
post 
the information and problems regarding the components compatibility issues and 
build problems (for example those described above for the kernel version 2.6.28 
for mini6410 and I have a few more). Would you please kindly instruct me on 
which of the OpenEmbedded mailing lists I should post this information. Simply 
according to the information given at openembedded.org for the Release 2011.03 
Tom Rini has the responsibily for the build for mini6410, so I want that this 
information somehow will reach the right address.
Sorry for junking the thread with irrelevant info.

Thanks,

Dmitry.






