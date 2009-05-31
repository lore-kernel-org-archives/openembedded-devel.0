Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MAgwb-0001Sh-KS
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 May 2009 11:03:05 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MAgoG-0003MB-Be
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 May 2009 09:54:28 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090531044100.GW23842@smtp.west.cox.net>
References: <20090530215243.GS23842@smtp.west.cox.net>
	<be7a9f3d0905301518g48862da6s9b51fe38dc0ee1e9@mail.gmail.com>
	<1243726480.4869.98.camel@lenovo.internal.reciva.com>
	<be7a9f3d0905301746tbec95a8pe14ea91d32ba19a9@mail.gmail.com>
	<20090531044100.GW23842@smtp.west.cox.net>
Date: Sun, 31 May 2009 09:54:27 +0100
Message-Id: <1243760067.4869.103.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: (e)glibc.inc: add minimal sane kernel versions
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
X-List-Received-Date: Sun, 31 May 2009 09:03:05 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-05-30 at 21:41 -0700, Tom Rini wrote:
> On Sat, May 30, 2009 at 09:46:39PM -0300, Otavio Salvador wrote:
> > Hello,
> > 
> > On Sat, May 30, 2009 at 8:34 PM, Phil Blundell <philb@gnu.org> wrote:
> > > OLDEST_KERNEL is, at least partially, distro dependent: this was its
> > > original purpose, and it would be a shame to lose the ability to
> > > override it from DISTRO.conf.  But, moving the default definition from
> > > bitbake.conf to (e)glibc.inc would be fine if it's also changed to a
> > > weak assignment (?=) at the same time.
> 
> I thought it was weak already..

Doh, you're quite right, so it is.  Nevermind then.

p.




