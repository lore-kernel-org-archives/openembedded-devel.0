Received: from caiajhbdccac.dreamhost.com ([208.97.132.202]
	helo=homiemail-a12.g.dreamhost.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NFpsw-00030O-NL
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 15:08:53 +0100
Received: from [129.132.133.199] (mtec-hg-docking-1-dhcp-199.ethz.ch
	[129.132.133.199])
	by homiemail-a12.g.dreamhost.com (Postfix) with ESMTPA id 43CDF714060
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Dec 2009 06:07:16 -0800 (PST)
Message-ID: <4B167492.9040501@SSpaeth.de>
Date: Wed, 02 Dec 2009 15:07:14 +0100
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
Organization: ETH Zurich
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B16624C.3090400@SSpaeth.de> <hf5rjb$b3u$1@ger.gmane.org>
In-Reply-To: <hf5rjb$b3u$1@ger.gmane.org>
X-Enigmail-Version: 0.95.7
OpenPGP: id=C827A062
X-SA-Exim-Connect-IP: 208.97.132.202
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Proposed change to om-gta02.conf
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
X-List-Received-Date: Wed, 02 Dec 2009 14:08:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:

> Have you considered using usb-gadget-mode recipe for that? 

Nifty! We have have that installed already. THanks for the hint, Koen.

> And also not
> that changing module autoloads requires a PR bump for the kernel(s).

Yep, that I learned already the hard way.

spaetz


