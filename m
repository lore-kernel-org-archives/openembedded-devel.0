Return-Path: <cshored@cshore.thecshore.com>
Received: from s2.neomailbox.net (s2.neomailbox.net [5.148.176.60])
	by mail.openembedded.org (Postfix) with ESMTP id E187F6E5FC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 16:04:24 +0000 (UTC)
Date: Sun, 19 Mar 2017 12:04:16 -0400
From: Daniel Dickinson <cshored@cshore.thecshore.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20170319120416.6afeafc5@danielf.thecshore.com>
In-Reply-To: <1b018e93-114d-8d5c-2b94-efd692faa8a3@mlbassoc.com>
References: <20170319002834.17953566@danielf.thecshore.com>
	<1489915859.2234.8.camel@gmail.com>
	<1b018e93-114d-8d5c-2b94-efd692faa8a3@mlbassoc.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: OpenEmbedded Layer Index autobuild errors
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Mar 2017 16:04:25 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 19 Mar 2017 15:39:38 +0100
Gary Thomas <gary@mlbassoc.com> wrote:

> >
> > With that change all tools which must be installed on the host need
> > to be present, even if in your use case some of them might not be
> > used. Did you install the prerequisites?
> > http://www.yoctoproject.org/docs/2.2.1/ref-manual/ref-manual.html#required-packages-for-the-host-dev
> > elopment-system  
> 
> The real point is that it's not his host - it's the [remote]
> autobuilder tool for OpenEmbedded (IIRC)
> 

Yes, thank you.  I'm not sure it's a full autobuilder or just parses
recipes for generating the web pages, but either way it's not my host,
it's an openembedded.org host.  Apparently I'm not good at explaining
that...

Regards,

Daniel

