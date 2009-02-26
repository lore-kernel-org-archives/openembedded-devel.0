Received: from [85.13.140.93] (helo=dd20204.kasserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1Lcfkn-00033A-Pb
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Feb 2009 13:54:22 +0100
Received: from [192.168.1.102] (77-21-130-108-dynip.superkabel.de
	[77.21.130.108])
	by dd20204.kasserver.com (Postfix) with ESMTP id 2DE48180F7FCD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2009 13:51:02 +0100 (CET)
Message-ID: <49A69032.9050505@opensimpad.org>
Date: Thu, 26 Feb 2009 13:50:58 +0100
From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200902131728.08634.openembedded@haerwu.biz>	<20090224064639.GE2172@smtp.west.cox.net>	<1235492001.27962.60.camel@andromeda>	<8763izyarp.fsf@neumann.lab.ossystems.com.br>	<fce2a370902241036y359e2c7cv1126a62c8627d2bb@mail.gmail.com>	<20090224185059.GL2172@smtp.west.cox.net>	<87wsbfw9zy.fsf@neumann.lab.ossystems.com.br>	<20090225022507.GP2172@smtp.west.cox.net>	<go4d36$khh$1@ger.gmane.org>
	<20090225213536.GT2172@smtp.west.cox.net>
In-Reply-To: <20090225213536.GT2172@smtp.west.cox.net>
Subject: Re: checksums situation
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
X-List-Received-Date: Thu, 26 Feb 2009 12:56:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> This is one of my points.  People think we have security from our
> current checksum list, but we do not.
>
>   
Then we have to make clear that the checksums are for integrity only and 
not for security.
It is impossible for us to do security. E.g. most sourceforge projects 
do not sign their packages. We would need to review the source of every 
package to see if it does stuff it should not do. We would also need to 
track security updates for packages - which we should do anyway.

Best regards
Bernhard Guillon


