Received: from [76.96.30.56] (helo=QMTA06.emeryville.ca.mail.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enelson1000@comcast.net>) id 1Ll5oI-0000WW-NH
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Mar 2009 19:20:43 +0100
Received: from OMTA05.emeryville.ca.mail.comcast.net ([76.96.30.43])
	by QMTA06.emeryville.ca.mail.comcast.net with comcast
	id VoS61b0010vp7WLA6uKW3Y; Sat, 21 Mar 2009 18:19:30 +0000
Received: from [192.168.1.116] ([71.198.120.50])
	by OMTA05.emeryville.ca.mail.comcast.net with comcast
	id VuKU1b00D15LFXK8RuKVlQ; Sat, 21 Mar 2009 18:19:30 +0000
From: ed <enelson1000@comcast.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <49C523BE.3000501@dls.net>
References: <1237656337.8743.5.camel@ed-hp-laptop> <49C523BE.3000501@dls.net>
Date: Sat, 21 Mar 2009 11:19:27 -0700
Message-Id: <1237659567.8743.7.camel@ed-hp-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: Re: Missing Packages directory
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
X-List-Received-Date: Sat, 21 Mar 2009 18:20:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks

But now how do I build angstrom console-image.

When I run command 
bitbake console-image

It comes back with
ERROR: Nothing PROVIDES 'console-image'

Thanks
Ed

On Sat, 2009-03-21 at 12:28 -0500, Mike (mwester) wrote:
> ed wrote:
> > When I try to install OE using the following command I do not see the
> > packages directory under openembedded directory.  Is something broken?
> 
> No, nothing is broken.  It's the "recipes" directory now.
> 
> Mike (mwester)
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



