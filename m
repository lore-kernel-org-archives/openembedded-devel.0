Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1KrgNt-0002RB-9Y
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Oct 2008 00:04:33 +0200
Received: from andromeda.vanille.de (e180135172.adsl.alicedsl.de
	[85.180.135.172])
	by drlauer-research.com (Postfix) with ESMTP id 999E4584712
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2008 00:17:25 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Oct 2008 00:04:08 +0200
User-Agent: KMail/1.9.10
References: <1224320609.5215.15.camel@dax.rpnet.com>
	<1224344240.5215.48.camel@dax.rpnet.com>
	<1224439610.5211.11.camel@dax.rpnet.com>
In-Reply-To: <1224439610.5211.11.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200810200004.09153.mickey@vanille-media.de>
Subject: Re: Some open issues
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
X-List-Received-Date: Sun, 19 Oct 2008 22:04:39 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Sunday 19 October 2008 20:06:50 schrieb Richard Purdie:
> The reason this is huge is that we seem to have ton of zero length
> files. Given its so totally broken I'm keen to do the above so we need a
> plan. I propose:
>
> a) repo goes read only
> b) checkout is made
> c) conversion is run
> d) sanity checks are made
> e) new revisions are pushed
> f) graft is added to the main OE repo
> g) commits based on the old history are blocked
> h) repo is made writable again
> i) people are advised to rebase any unpushed changes
>
> Is anyone strongly against this? If not, when should we do this?

No objection. Please synchronize with Jan L=FCbbe, he has lots of experienc=
e=20
with the conversion. Feel free to chose the time/date when you (both) have=
=20
resources to do that. Please announce a day before though.

Thanks,

Mickey.


