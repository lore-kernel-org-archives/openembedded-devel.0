Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RiZGM-0001Ea-MN
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Jan 2012 23:24:50 +0100
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LXA00B9MOKJVGD1@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	04 Jan 2012 16:17:07 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 46D7E202C2; Wed,
	04 Jan 2012 17:17:06 -0500 (EST)
Date: Wed, 04 Jan 2012 17:17:06 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120104221706.GF587@denix.org>
References: <20120104181400.GD587@denix.org>
	<CABcZAN=i6H+G_=v2KreWhzrOKe=fgVHv-vvrMhVMzKcefrXf2w@mail.gmail.com>
	<C0EC035D-D055-4E49-A36C-F42AF03D232C@gmail.com>
MIME-version: 1.0
In-reply-to: <C0EC035D-D055-4E49-A36C-F42AF03D232C@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [OE-core] BlueZ old releases have new checksums
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
X-List-Received-Date: Wed, 04 Jan 2012 22:24:50 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jan 04, 2012 at 09:41:43PM +0100, Adriano Pallavicino wrote:
> Temporaly i've manually changed md5 and sha256sum. If needed i can prepare a 
> patch

That wouldn't work reliably, as some people have an old copy saved locally, 
while others can still download the same old copy from one of the mirrors...

-- 
Denys


> Il giorno 04/gen/2012, alle ore 21:14, Chris Larson <clarson@kergoth.com> ha scritto:
> 
> > On Wed, Jan 4, 2012 at 11:14 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> >> The main archive of BlueZ/obexd/hcidump releases on kernel.org[1] finally
> >> re-appeared after missing for long time since kernel.org compromise.
> >> Unfortunately, all previous tarballs have new checksums, breaking builds for
> >> anyone w/o previous copy cached. Old copies were also extensively mirrored,
> >> so you never know which one you fetch next time...
> > 
> > Heh, checksums changing after a security compromise, that's worrisome
> > :) should diff their contents to see what's going on, or whether its
> > just a gzip timestamp change or something.
> > -- 
> > Christopher Larson
> > 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


