Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Pn7Wg-0006rQ-Nz
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 11:43:58 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Pn7Vf-0003vt-E4 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 11:42:57 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1Pn7Vc-0006J5-Hv
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 11:42:52 +0100
Date: Wed, 9 Feb 2011 11:42:52 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110209104252.GH28019@excalibur.local>
References: <4D519C83.9060502@mentor.com>
	<09D9BE2AC4AA764DABAA8C91E48D819E011A79A329@DEMCHP99E35MSX.ww902.siemens.net>
	<20110209095644.GE28019@excalibur.local>
	<iitplc$ago$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <iitplc$ago$1@dough.gmane.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: 2011.03 release testing, starts soon!
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
X-List-Received-Date: Wed, 09 Feb 2011 10:43:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2011-02-09 at 11:18, Koen Kooi wrote:
> On 09-02-11 10:56, Stefan Schmidt wrote:
> 
> >> 2. Do not delete the release branch after 2011.03 will be released (just like
> >>    it was done for 2010.12), but let it live and allow developpers committing
> >>    bug-fixes (backporting choosen things?) reported back by OE users (some would
> >>    would be happy to contribute this way)
> > 
> > That was already discussed. We make a tag with the release rev from which can be
> > branched again _if_ people are stepping up to support this branch on a mid or
> > long term base.
> > 
> > The branch Tom is using until the release is pretty useless froma history point
> > of view (all changes must be in master as well). When he thinks the release is
> > good enough the tag gets added and the old branch deleted. For the last release
> > nobody cared to support it afterwards with bugfixes so no release branch was
> > created.
> > 
> > I'm thinking about this for the upcoming release. If all works well we will base
> > a product on it which I would like to support directly from such a release
> > branch.
> > 
> > The hard part is how people could decide on pooling resources on this. Defining
> > goals for such a branch and stuff. E.g. only take serious fixes? What about
> > package updates? Security fixes? changes on the toolchain or classes?
> > 
> > This is up to the group who wants to support such a branch. Anyone else
> > interested in doing this for 2011-03?
> 
> I discussed this with Philip and Graeme and the idea is to retire
> angstrom-2008.1.conf into that branch. I still have customers (you
> indirectly :))

Well aware of it. :)

> using that, so having it in that branch would be very neat.

That sounds pretty good to me. I wanted to move on after this release anyway.
Angstrom 2010 based on OE-Core would be my favourite. :)

Does this mean you would like to get some "final" fixes into such  branch as
well? If we would need to think about what we would accept in there.

regards
Stefan Schmidt


