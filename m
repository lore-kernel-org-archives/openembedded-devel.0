Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1S8XQ7-0004m4-Hj
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Mar 2012 14:42:15 +0100
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1S8XHe-0005DG-2B>; Fri, 16 Mar 2012 14:33:30 +0100
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1S8XHd-0005XZ-P0>; Fri, 16 Mar 2012 14:33:29 +0100
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1S8XHc-0003S0-MA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2012 14:33:28 +0100
Date: Fri, 16 Mar 2012 14:33:28 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120316133328.GA13219@mi.fu-berlin.de>
References: <4F62FFB7.5070401@nedap.com>
MIME-Version: 1.0
In-Reply-To: <4F62FFB7.5070401@nedap.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: remove dbg and dev packages
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
X-List-Received-Date: Fri, 16 Mar 2012 13:42:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 16, 2012 at 09:54:15AM +0100, Jaap de Jong wrote:
> Hi!
> 
> is there an option (in local.conf?) to not build (or not add to the
> repository of) the dbg and dev packages?
> 
> Thanks!
> Jaap


Why dont write a shell skript which deletes all dbg and dev packages and calles the opkg index command afterwards?

Bye Henning


