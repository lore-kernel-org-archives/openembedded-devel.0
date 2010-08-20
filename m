Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OmF4Y-0001yq-EC
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 02:03:08 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L7F00IR9C42HVH4@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	19 Aug 2010 19:02:32 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 552FC14AF64; Thu,
	19 Aug 2010 20:02:26 -0400 (EDT)
Date: Thu, 19 Aug 2010 20:02:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <AANLkTinvou+tVwQ683OqsTrRvHJV8HdBfTJOuPiBoK5q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100820000226.GD26112@denix.org>
MIME-version: 1.0
References: <AANLkTiknntyGcs6gdHDx84J8m7QufqZ8CPVs4nF5urD7@mail.gmail.com>
	<AANLkTinytMQ0=hav0GiqPV0S-Avo16-DDFDcEd6QWYhg@mail.gmail.com>
	<AANLkTinvou+tVwQ683OqsTrRvHJV8HdBfTJOuPiBoK5q@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE stable, testing, dev (was Re: What to do about the	poor bitbake Quality Control?)
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
X-List-Received-Date: Fri, 20 Aug 2010 00:03:08 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Wed, Aug 18, 2010 at 07:05:48PM +0200, Frans Meulenbroeks wrote:
> 2010/8/18 Jason Kridner <jkridner@beagleboard.org>:
> > On Wed, Aug 18, 2010 at 11:07 AM, Cliff Brake <cliff.brake@gmail.=
com> wrote:
>=20
> >>
> >> Getting started
> >> (http://wiki.openembedded.net/index.php/Getting_started) points =
to a
> >> tarball for bitbake 1.8.18. =A0Is this still the recommended
> >> version/mechanism for new users? =A0I much prefer simply pulling=
 bitbake
> >> from git.
> >
> > Koen pointed me to
> > http://gitorious.org/angstrom/angstrom-setup-scripts/blobs/master=
/oebb.sh
> > for setting up my environment. =A0I also prefer pulling bitbake f=
rom
> > git. =A0Koen seems to be pulling bitbake 1.10, instead of 1.8.18.
> >
> 1.10 is now officially released and is supposed to be better and fa=
ster.
> I think we should change the wiki page to reflect using 1.10

1.10 is Python 2.6 based (AFAIK) and some people are not up to speed =
with=20
that, i.e. using older distros with 2.5 or even 2.4...

--=20
Denys



