Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KngkI-0004yc-Nv
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Oct 2008 23:39:02 +0200
Received: from 88-111-190-175.dynamic.dsl.as9105.com ([88.111.190.175]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1Kngfm-0007kT-FP
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Oct 2008 22:34:23 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48239d390810080715l700d1ce4i46c1e1cc97279b3@mail.gmail.com>
References: <48239d390810080715l700d1ce4i46c1e1cc97279b3@mail.gmail.com>
Date: Wed, 08 Oct 2008 22:34:20 +0100
Message-Id: <1223501660.4426.376.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: Locale support.
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
X-List-Received-Date: Wed, 08 Oct 2008 21:39:02 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-10-08 at 18:15 +0400, Sergey Lapin wrote:
> But I have problems with lots of UTF-8 characters on file system
> and applications. 'date' command works properly reporting according to locale.
> wget, however have problems, inventing names which contain junk.
> However, using scp, I'm able to store normal UTF-8-named files
> from my desktop Debian. ASCII characters in names are always OK.
> both wget and ls are stand-alone in my configuration.

Can you give some specific examples of what is going wrong for you?  Is
it just wget that has this issue, or is it all applications?

p.




