Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MHCO8-00025O-Ny
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 09:50:25 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MHCDw-0001Ap-HL
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 08:39:53 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E701E0BB-B8EC-482B-8808-47449E0FD322@mac.com>
References: <9050EA3F-01E5-479A-8AF2-C6553F347FE7@mac.com>
	<4A396EBD.2010207@gmx.net>
	<E701E0BB-B8EC-482B-8808-47449E0FD322@mac.com>
Date: Thu, 18 Jun 2009 08:39:51 +0100
Message-Id: <1245310791.29153.146.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: classpath_0.98 recipe failure
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
X-List-Received-Date: Thu, 18 Jun 2009 07:50:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I think you must be looking at either the wrong repository or an old
checkout.  The org.openembedded.dev tree does indeed contain
jamvm-native 1.5.3, see:

http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/jamvm

You can download the file from the web interface there if you want.

p.

On Thu, 2009-06-18 at 08:34 +0400, Elvis Dowson wrote:
> Hi Robert,
> 
> On Jun 18, 2009, at 2:31 AM, Robert Schuster wrote:
> 
> > First thing to know is: What version of OE are you using? Is this the
> > development branch (org.openembedded.dev)?
> 
> I was using the overo-oe repository
> 
> git clone git://gitorious.org/gumstix-oe/mainline.git  
> org.openembedded.dev
> 
> After you email, I also checked the openembedded repository
> 
> git://git.openembedded.org/openembedded
> 
> 
> > If so I am wondering why you are not seeing a recipe for jamvm-native
> > 1.5.3. Such a recipe should be there and work just fine.
> 
> Both these repositories don't have a jamvm_1.5.3.bb recipe.
> 
> I am on the org.openembedded.dev branch.
> 
> Can you point me to a location where I can get the latest recipes for  
> jamvm and classpath?
> 
> Best regards,
> 
> Elvis
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



