Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1PmTeq-0003wi-CW
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Feb 2011 17:09:44 +0100
Received: from [2001:638:602:1183:ddb9:f004:e190:c1ea] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1PmTdq-0008Jx-VP by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Feb 2011 17:08:45 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PmTdp-0000MD-8x
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Feb 2011 17:08:41 +0100
Date: Mon, 7 Feb 2011 17:08:41 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110207160841.GB29011@excalibur.local>
References: <20110126102308.GA29416@excalibur.local>
	<4D3FFB03.9010206@xora.org.uk> <4D4035D2.9090203@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4D4035D2.9090203@mentor.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: OE 2011.03 release vs. oe-core migration
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
X-List-Received-Date: Mon, 07 Feb 2011 16:09:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2011-01-26 at 07:55, Tom Rini wrote:
> On 01/26/2011 03:44 AM, Graeme Gregory wrote:
> >On 26/01/2011 10:23, Stefan Schmidt wrote:
> >>
> >>During last OEDEM we set out a timeline for quarterly releases. The first one
> >>hit on time in december 2010 (Thanks Khem).
> >>
> >>The next one would be scheduled for 2011-03. As our plans towards oe-core are
> >>getting into shape I wonder if and how these both are going to conflict.
> >>
> >>Will we go ahead and make the 2011-03 release, maybe the last one before moving
> >>over to oe-core? Personally I don't think these two block each other. Syncing
> >>would be needed, but people will keep working on the OE repo for a bit longer
> >>anyway I would think.
> >>
> >>If we are going to scratch the release what would be the next target for it?
> >>Yocto 1.0 is planned for April 2011. Somehow I doubt we will have oe-core ready
> >>for this in time, including yocto movs to it and we base the rest of OE on top
> >>of it. Am I wrong here and that is the actual plan?
> >>
> >>
> >My opinion is 2010-03 should be the last release on the old source tree.
> >Releases after this should be on the new oe-core layer system. I don't
> >think we should scrap the release as its going to take some time to kick
> >oe-core into shape and finish the poky merge. Then there is work on
> >meta-openembedded and meta-distro to do on top of that.
> 
> I think this depends a little on who is going to run the release
> again.  We probably won't have a perfect release, stop committing,
> switch.  If we're looking for volunteers again to run the next
> release, assuming folks will be busy with the migration work too,
> I'd throw my hat in the ring (and defer to Khem if he wants to do it
> again, along with all of the fun we'll have in oe-core :))

I would welcome if we could make the release manager role rotating. So if Tom
would be able to pick this up it would be great if Khem can feed him some of his
experience with the last release. Be it only theoretical with some hints or
practically with helping to review and apply patches towards. Does this sound
good to both of you?

I will do some more testing over the next days/weeks and also trying to help
with some patches if needed.

regards
Stefan Schmidt


