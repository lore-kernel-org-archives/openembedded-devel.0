Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LmCes-0000u4-Ao
	for openembedded-devel@openembedded.org; Tue, 24 Mar 2009 20:51:34 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090324195002.IWTU15318.fed1rmmtao105.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 24 Mar 2009 15:50:02 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id X7q11b0094dMFYL047q1qe; Tue, 24 Mar 2009 15:50:01 -0400
X-Authority-Analysis: v=1.0 c=1 a=NfHW1gY9qQmrc5nluFAA:9
	a=vClcCFTrWnlYnEvzf2kA:7 a=alpK4RGeFkh1L2JglDHh0h1kEh8A:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 24 Mar 2009 12:50:01 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090324195001.GR14278@smtp.west.cox.net>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
	<b6ebd0a50903231335y1ddfcb3bpd447b646e18d439a@mail.gmail.com>
	<1237885606.5348.8.camel@dax.rpnet.com>
	<b6ebd0a50903240808p4e07c61g6a088df634e161b2@mail.gmail.com>
	<ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>
	<b6ebd0a50903241155u7743eaads81be33e350925b7a@mail.gmail.com>
	<gqbbf3$jak$1@ger.gmane.org>
	<b6ebd0a50903241224j9f11e8dp73fe5eb1a81bfd86@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <b6ebd0a50903241224j9f11e8dp73fe5eb1a81bfd86@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Package Maintenance
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
X-List-Received-Date: Tue, 24 Mar 2009 19:51:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 24, 2009 at 12:24:27PM -0700, Chris Larson wrote:
[snip]
> I also don't think the fact that a recipe builds is an excuse to
> ignore it.  Recipes should be kept in good shape, by current
> standards, in my opinion.  As an example, many recipes still don't
> take advantage of the ${BP}, etc variables, and are overriding
> FILES{DIR,PATH} unnecessarily.

I'm saying this as an example, but, the what-now variable?  And why
didn't however added a handy new variable regex an update in?  If we're
going to push cleanups off of the person writing them and onto the
maintainer, they need to be documented and linked from a single spot or
so (so people can check a page once a week / whenever and see what's
been put on their plate).

-- 
Tom Rini


