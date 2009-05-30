Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MASYj-0000EX-0i
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 19:41:29 +0200
Received: (qmail 27582 invoked from network); 30 May 2009 17:32:55 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 30 May 2009 10:32:55 -0700
Date: Sat, 30 May 2009 10:32:55 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090530173254.GI23842@smtp.west.cox.net>
References: <1243319696-16223-1-git-send-email-msmith@cbnco.com>
	<loom.20090530T004559-114@post.gmane.org>
	<b6ebd0a50905292229o2eb248f0le26870ccca102657@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <b6ebd0a50905292229o2eb248f0le26870ccca102657@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 1/4] Remove references to base_set_filespath()from	recipes that don't need it.
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
X-List-Received-Date: Sat, 30 May 2009 17:41:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 29, 2009 at 10:29:56PM -0700, Chris Larson wrote:
> On Fri, May 29, 2009 at 5:48 PM, Michael Smith <msmith@cbnco.com> wrote:
> > Michael Smith <msmith <at> cbnco.com> writes:
> >
> >>
> >> These recipes are covered by the default FILESPATHPKG setting.
> >>
> >> Signed-off-by: Michael Smith <msmith <at> cbnco.com>
> >> ---
> >
> > ping
> >
> > (patchbundle here:
> > http://patchwork.openembedded.org/bundle/msmith%40cbnco.com/nuke_base_set_filespath_usage/ )
> 
> Looks fine to me.

I've ack'd them all too, pushed.

-- 
Tom Rini


