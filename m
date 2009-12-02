Received: from caiajhbdcahe.dreamhost.com ([208.97.132.74]
	helo=homiemail-a17.g.dreamhost.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NFjIx-0003Kf-7Z
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 08:07:18 +0100
Received: from [129.132.133.199] (mtec-hg-docking-1-dhcp-199.ethz.ch
	[129.132.133.199])
	by homiemail-a17.g.dreamhost.com (Postfix) with ESMTPA id 723C87A8063
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2009 23:05:40 -0800 (PST)
Message-ID: <4B1611C3.7050101@SSpaeth.de>
Date: Wed, 02 Dec 2009 08:05:39 +0100
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
Organization: ETH Zurich
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B14BAD9.2060402@fqingenieria.es>	<20091201072521.GA11505@denix.org>
	<4B14D2E1.6050506@SSpaeth.de> <20091201194025.GB11505@denix.org>
In-Reply-To: <20091201194025.GB11505@denix.org>
X-Enigmail-Version: 0.95.7
OpenPGP: id=C827A062
X-SA-Exim-Connect-IP: 208.97.132.74
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Recipes relation tree
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
X-List-Received-Date: Wed, 02 Dec 2009 07:07:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Denys Dmytriyenko wrote:
>> A related question. This generates depends.dot just fine, but I found a
>> reference to rdepends.dot in some manual. I would be very much
>> interested in an RDEPENDS tree, is there a way to get this?
> 
> Actually it does generate both.

Interesting, here with bitbake 1.8 I definitely only get
	depends.dot  task-depends.dot

Is this only in 1.10, or am I missing a secret config option?

spaetz


