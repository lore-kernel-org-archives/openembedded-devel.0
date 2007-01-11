Received: from [137.79.94.127] (helo=s383.jpl.nasa.gov)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <ehovland@s383.jpl.nasa.gov>) id 1H57ov-0004CM-Q8
	for openembedded-devel@openembedded.org; Thu, 11 Jan 2007 22:50:50 +0100
Received: from mage.jpl.nasa.gov (mage [137.78.15.62])
	by s383.jpl.nasa.gov (8.12.10/8.12.10) with ESMTP id l0BLmopg028532;
	Thu, 11 Jan 2007 13:48:50 -0800 (PST)
Received: by mage.jpl.nasa.gov (Postfix, from userid 4960)
	id 0C321300016B; Thu, 11 Jan 2007 13:48:49 -0800 (PST)
Date: Thu, 11 Jan 2007 13:48:49 -0800
From: Erik Hovland <erik@hovland.org>
To: openembedded-devel@openembedded.org, familiar@handhelds.org
Message-ID: <20070111214849.GD336@mage.jpl.nasa.gov>
References: <20070111203010.GB336@mage.jpl.nasa.gov>
	<45A6A0C2.2080400@dominion.kabel.utwente.nl>
Mime-Version: 1.0
In-Reply-To: <45A6A0C2.2080400@dominion.kabel.utwente.nl>
User-Agent: Mutt/1.5.9i
Subject: Re: [announce] new tagged version of ipkg
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
X-List-Received-Date: Thu, 11 Jan 2007 21:50:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Tarball?

No tarball at this time. If one is desired it can be facilitated.

> ChangeLog?

The ipkg/C/ChangeLog has been updated:

2007-01-11 erik ( erik@hovland.org)
        * Version update to 0.99.164
        * Fixed usage of temporary files to be more secure
        * Closed several potential memory/file descriptor leaks
        * Cleaned up warnings in several parts of the code
        * Added checking to libbb/unzip.c so it did not use tainted data
        * Changed code in several places where it is possible to dereference an invalid pointer

E

-- 
Erik Hovland
mail: erik AT hovland DOT org
web: http://hovland.org/
PGP/GPG public key available on request


