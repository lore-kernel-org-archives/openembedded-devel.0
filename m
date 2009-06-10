Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MEDsl-00086x-9o
	for openembedded-devel@openembedded.org; Wed, 10 Jun 2009 04:49:43 +0200
Received: (qmail 22780 invoked from network); 10 Jun 2009 02:40:03 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 9 Jun 2009 19:40:03 -0700
Date: Tue, 9 Jun 2009 19:40:03 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090610024002.GR26065@smtp.west.cox.net>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
	<20090603161035.GL26065@smtp.west.cox.net>
	<fce2a370906031027y1e28cc6cre5aad0a1465c806b@mail.gmail.com>
	<fce2a370906070940i3f5d7faud81d010af727b66a@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <fce2a370906070940i3f5d7faud81d010af727b66a@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 00/12] different qt4 related patches
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
X-List-Received-Date: Wed, 10 Jun 2009 02:49:44 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Jun 07, 2009 at 07:40:52PM +0300, Ihar Hrachyshka wrote:
> On Wed, Jun 3, 2009 at 8:27 PM, Ihar
> Hrachyshka<ihar.hrachyshka@gmail.com> wrote:
> > On Wed, Jun 3, 2009 at 7:10 PM, Tom Rini <trini@embeddedalley.com> wrote:
> >> On Wed, Jun 03, 2009 at 06:37:10PM +0300, Ihar Hrachyshka wrote:
> >>
> >>> This patchset:
> >>> - adds meta-toolchain-qte.bb to install toolchain with Qt/Embedded and
> >>>   all the needed tools ready to use for qt4-embedded development;
> >>> - adds directfb support for qt4-embedded;
> >>> - includes missing files to qt4 packages;
> >>> - fixes code style, generalize qt4 recipes and classes, reworked directory
> >>>   layout;
> >>> - occasionally ports pkg-config to INC_PR.
> >>
> >> What machine / distro combinations have you tested all of this with, and
> >> what recipes (other than meta-toolchain-qte) have you explicitly built
> >> after?  ie have you built / run some QtE images or similar too?  Thanks.
> >
> > I built and tested qt4-embedded (with directfb and linuxfb), meta-toolchain-qte.
> > I also built (but not tested) qt4-x11-free.
> > My machine is beagleboard.
> 
> What's the status of the patchset? Is there any problems pending before commit?

I have no problem and Acked-by the whole series.  I do not however, have
time to commit this right now, sorry.  But anyone else, please feel free
to add:
Acked-by: Tom Rini <trini@embeddedalley.com>

And push.

-- 
Tom Rini


