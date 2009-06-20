Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MI5cT-0004Ly-Mm
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 20:48:54 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MI5S0-0006cx-7r
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 19:38:06 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <3186A9DE-F7A1-4400-8B6B-ABE119EDA16A@mac.com>
References: <B7B72D38-62FD-4B6B-9856-DF4F470F832F@mac.com>
	<1245521341.29153.288.camel@lenovo.internal.reciva.com>
	<3186A9DE-F7A1-4400-8B6B-ABE119EDA16A@mac.com>
Date: Sat, 20 Jun 2009 19:37:49 +0100
Message-Id: <1245523070.29153.290.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: Recipe for libserial_0.6.0rc1
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
X-List-Received-Date: Sat, 20 Jun 2009 18:48:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-06-20 at 22:27 +0400, Elvis Dowson wrote:
> Hi Phil,
> 
> On Jun 20, 2009, at 10:09 PM, Phil Blundell wrote:
> 
> > Try:
> >
> > do_compile() {
> > 	oe_runmake SUBDIRS="src doc examples"
> > }
> 
> It compiled all the files in src, doc and example, and then went  
> looking for another sub dir called src.

I'm not quite sure what you mean by "another" subdir called src.  Can
you post the actual log output that you're seeing?

p.




