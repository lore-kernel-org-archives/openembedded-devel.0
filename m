Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <Patrick.Ohly@gmx.de>) id 1H6XDz-0007YG-Ri
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Jan 2007 20:10:32 +0100
Received: (qmail invoked by alias); 15 Jan 2007 19:08:10 -0000
Received: from c-134-227-90.d.dsl.de.ignite.net (EHLO ip6-localhost)
	[62.134.227.90]
	by mail.gmx.net (mp040) with SMTP; 15 Jan 2007 20:08:10 +0100
X-Authenticated: #489940
Received: from patrick by ip6-localhost with local (Exim 3.36 #1 (Debian))
	id 1H6Wyh-0003vz-00; Mon, 15 Jan 2007 19:54:43 +0100
From: Patrick Ohly <Patrick.Ohly@gmx.de>
To: OpenEmbedded <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jan 2007 19:54:43 +0100
Message-Id: <1168887283.14505.24.camel@ip6-localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
Sender: Patrick Ohly <patrick@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Maemo compatible toolchain
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
X-List-Received-Date: Mon, 15 Jan 2007 19:10:32 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

in July 2005 Florian Boor announced the maemo-1.0 distro for the Nokia
770. If I read the posting and the .txt file right, this replaced the
official Nokia image for the device. Is this effort still pursued by
someone?

While a worthwhile goal, I am more interested in building packages with
OE that work on the official image because I want my software to be
usable by "normal" users without having to reflash their devices.
There's Scratchbox of course, but it currently does not work for me
(known incompatibility with 2.6.18 kernel). Is compiling for Maemo with
OE something that has been tried before?

The problem would be to keep a list of the preferred versions of all
libraries and (as far as necessary) the toolchain and ensure that the
corresponding .bb files remain around and buildable.
org.openembedded.dev is probably changing too quickly for that - is
there a stable branch which is still in use by some other distro and
might have more of the older revisions? org.openembedded.oz354x perhaps?

-- 
Bye, Patrick Ohly
--  
Patrick.Ohly@gmx.de
http://www.estamos.de/


