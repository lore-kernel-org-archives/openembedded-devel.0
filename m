Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NkOML-0006Om-2R
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 22:01:33 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KYD00A7I69UVEEA@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	24 Feb 2010 14:58:43 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 73FE414AF60; Wed,
	24 Feb 2010 15:58:42 -0500 (EST)
Date: Wed, 24 Feb 2010 15:58:42 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <6ec4247d0911181455g6399eeeci38db4e9b727886d@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100224205842.GC9601@denix.org>
MIME-version: 1.0
References: <4B03CBF0.5010000@SSpaeth.de> <4B03CDD9.1010202@SSpaeth.de>
	<6ec4247d0911181320o1aae5e21o2f6a8038daff6173@mail.gmail.com>
	<1258582348.25369.689.camel@lenovo.internal.reciva.com>
	<6ec4247d0911181455g6399eeeci38db4e9b727886d@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BAD_RECOMMENDATIONS is broken (opkg issue)
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
X-List-Received-Date: Wed, 24 Feb 2010 21:01:33 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Thu, Nov 19, 2009 at 09:25:06AM +1030, Graham Gower wrote:
> 2009/11/19 Phil Blundell <philb@gnu.org>:
> >
> > It's meant to be handled by this chunk of code, and I'm fairly su=
re that
> > this used to work reliably. =A0Has that part of opkg changed rece=
ntly?
>=20
> Nope, no changes there. And no particularly invasive changes up to =
r240.
>=20
> I have some minor worries that
> http://code.google.com/p/opkg/source/detail?r=3D328 will have some =
non
> obvious fallout. (Obviously not the issue here though)

FYI, http://thread.gmane.org/gmane.comp.handhelds.openembedded/30417

--=20
Denys



