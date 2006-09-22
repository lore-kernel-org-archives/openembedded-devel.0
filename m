Received: from [87.246.78.22] (helo=orlando.wolfsonmicro.main)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <Liam.Girdwood@wolfsonmicro.com>) id 1GQhHT-0002Ae-LA
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Sep 2006 11:25:11 +0200
Received: from [172.20.21.37] ([172.20.21.37]) by orlando.wolfsonmicro.main
	with Microsoft SMTPSVC(6.0.3790.211); 
	Fri, 22 Sep 2006 10:20:48 +0100
From: Liam Girdwood <liam.girdwood@wolfsonmicro.com>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <45136FA6.6080201@mitac-mtc.com.tw>
References: <45136FA6.6080201@mitac-mtc.com.tw>
Date: Fri, 22 Sep 2006 10:20:47 +0100
Message-Id: <1158916847.18071.5.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 (2.6.3-1.fc5.5) 
X-OriginalArrivalTime: 22 Sep 2006 09:20:48.0257 (UTC)
	FILETIME=[63E3CF10:01C6DE28]
Subject: Re: which branch/distro for mainstone ?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Sep 2006 09:25:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2006-09-22 at 13:07 +0800, Axel.Lin wrote:
> hi,
> I'm trying to use OE on a mainstone develop board.
> I'd like to build gpe-image & opei-image.
> Which branch should I use?
> Which distro should I use?
> 

I'm using org.openembedded.dev and Angstrom on Mainstone. However, I
still need to add an EABI kernel.bb for Mainstone (as the current
Mainstone kernel is too old for EABI). I'll do that this morning.

Liam




