Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LxiCC-0003cp-5t
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Apr 2009 15:45:32 +0200
Received: from andromeda.vanille.de (e180133179.adsl.alicedsl.de
	[85.180.133.179])
	by drlauer-research.com (Postfix) with ESMTP id ED4E45849DF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Apr 2009 16:09:45 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Apr 2009 15:40:40 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.28-11-generic; KDE/4.2.2; x86_64; ; )
References: <20090425075933.E6E18188456@amethyst.openembedded.net>
	<200904251304.17624.mickey@vanille-media.de>
	<49F310E0.6030909@balister.org>
In-Reply-To: <49F310E0.6030909@balister.org>
MIME-Version: 1.0
Message-Id: <200904251540.40566.mickey@vanille-media.de>
Subject: Re: [oe-commits] Koen Kooi : Revert "ecore: catch up with the new SONAMEs; move to autosplitting"
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
X-List-Received-Date: Sat, 25 Apr 2009 13:45:32 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 25 April 2009 15:32:16 Philip Balister wrote:
> Michael 'Mickey' Lauer wrote:
> > I have net seen you getting a majority for this revert :(
>
> I did not ack it outright because I was hoping we could have resolved
> the upgradability issue first, without turning this into you versus Koen
> again.

Well, apparantly i'm the only one standing up against him, so who's going to 
do it if not me?

> Both Graeme and I have expressed concern that the commits in
> question should be reviewed.

Good. Then do that. The commits fix the linking and RRECOMMENDS issue which was 
not fixed by Koen's commit. Yes, they may break the update path, I'm sorry for 
that, but sometimes you have to catch up with upstream and we have a stable 
branch for a reason.

:M:



