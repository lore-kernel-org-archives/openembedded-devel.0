Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <tobias.pflug@gmx.net>) id 1IuBQ4-0007ru-ID
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2007 19:32:28 +0100
Received: (qmail invoked by alias); 19 Nov 2007 18:30:24 -0000
Received: from p549AC0B1.dip0.t-ipconnect.de (EHLO [192.168.1.100])
	[84.154.192.177]
	by mail.gmx.net (mp044) with SMTP; 19 Nov 2007 19:30:24 +0100
X-Authenticated: #283898
X-Provags-ID: V01U2FsdGVkX18n//Q8H6Mn/0LNJqToJlkfsYpq4htfFbv14iSuYP
	ymBb1Meo4XcrrK
From: Tobias Pflug <tobias.pflug@gmx.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <C7148B94-6A92-42DE-BF35-75B409DAA8E7@selfish.org>
References: <20071119120819.GA17788@lenovo>
	<C7148B94-6A92-42DE-BF35-75B409DAA8E7@selfish.org>
Date: Mon, 19 Nov 2007 19:32:26 +0100
Message-Id: <1195497146.6376.351.camel@toontown>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
X-Y-GMX-Trusted: 0
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Mon, 19 Nov 2007 18:32:29 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Mon, 2007-11-19 at 15:41 +0100, Holger Freyther wrote:
> Am 19.11.2007 um 13:08 schrieb David Farning:
> 
> > This eliminates many of problems the new users have setting up bb
> > and oe.  There is no need to know any thing about svn of monotone.
> 
> Hey,
> 
> this is the issue you want to solve? IMO developers should know about  
> how to build software and this includes getting the source. I think  
> it is no use in hiding OpenEmbedded and BitBake behind a GNU Makefile.
> 
> I have the feeling that the issue you want to solve needs to be  
> solved by the distro/origanisation to provide a SDK so people can  
> build software.
> 
> z.
> 
> PS: This doesn't change the fact that we need better documentation...

On first thought I completely agree. On second thought things often 
go a bit different in real-life real working environments in companies.
With the ever present "time=money" dogma in mind it helps to have some
means to easily set up a working environment. 

At some point however someone will have to set up a problem specific
build environment for the company/project/.. Integration work is a
must and can never be solved by OE. 

So to conclude .. I think there is no point in trying to hide complexity
because if you want to do serious work with OE it /will/ get complex.
However making the setup/installation easier is always a good thing. One
way to do that would be to provide nice up-to-date packages with
all necessary dependencies. Some stuff is available already from what
I recall .. "OE and your distro" on the wiki ... Keeping those packages
working and up-to-date would be helpful I suppose. I will probably
have to look into that soon as I need to provide an SDK for my company
soon.



