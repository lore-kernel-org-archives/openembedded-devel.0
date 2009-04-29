Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1LzCNk-0001pm-O7
	for openembedded-devel@openembedded.org; Wed, 29 Apr 2009 18:11:37 +0200
Received: (qmail 9932 invoked from network); 29 Apr 2009 16:06:14 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 29 Apr 2009 09:06:14 -0700
Date: Wed, 29 Apr 2009 09:06:14 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090429160613.GA18788@smtp.west.cox.net>
References: <20090427141943.GG18788@smtp.west.cox.net>
	<be7a9f3d0904270835s32c5adafu9ac11f2dd1b2a81d@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <be7a9f3d0904270835s32c5adafu9ac11f2dd1b2a81d@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: [RFC] Bring PREFERRED_LIBC to all distros
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
X-List-Received-Date: Wed, 29 Apr 2009 16:11:37 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Apr 27, 2009 at 12:35:02PM -0300, Otavio Salvador wrote:
> Hello Tom,
> 
> On Mon, Apr 27, 2009 at 11:19 AM, Tom Rini <trini@embeddedalley.com> wrote:
> > That branch has been tested with bitbake -g meta-toolchain minimal image
> > for every distro for nslu2be nslu2le and beagleboard (arm/armeb/newer
> > arm) before and after, and the only differences are the stuff that now
> > parses thanks to the glibc changes.  I've got a loop going now with
> > qemux86 db1200 and mpc8313e-rdb but don't expect any problems.  I'll be
> > following up with the patches shortly.
> 
> qemux86 raises an alarm from my side ;-)

Sorry?  I just checked my log before and after and I don't see any
change.

-- 
Tom Rini


