Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1SG5GO-00086C-8D
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Apr 2012 11:15:24 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SG57V-0004eH-O0>; Fri, 06 Apr 2012 11:06:13 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SG57V-0007wK-Ld>; Fri, 06 Apr 2012 11:06:13 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1SG57U-0001sL-Ib
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Apr 2012 11:06:12 +0200
Date: Fri, 6 Apr 2012 11:06:12 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120406090612.GA6542@mi.fu-berlin.de>
References: <OF169404D2.136201F5-ONC12579D7.0035BDC1-C12579D7.003FCEB6@ra.rockwell.com>
MIME-Version: 1.0
In-Reply-To: <OF169404D2.136201F5-ONC12579D7.0035BDC1-C12579D7.003FCEB6@ra.rockwell.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: openssl build broken for distros without IPv6
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
X-List-Received-Date: Fri, 06 Apr 2012 09:15:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

the diff is unreadable, but you could have fixed it by using a patch
rather than the sed command.

Bye Henning


