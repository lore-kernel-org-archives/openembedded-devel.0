Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MdROf-0007z5-5S
	for openembedded-devel@openembedded.org; Tue, 18 Aug 2009 18:18:55 +0200
Received: (qmail 20517 invoked from network); 18 Aug 2009 16:01:47 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 18 Aug 2009 09:01:47 -0700
Date: Tue, 18 Aug 2009 09:01:47 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090818160147.GR2227@smtp.west.cox.net>
References: <d1b08f940908151458q6402d54akc9b00f6687261f19@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <d1b08f940908151458q6402d54akc9b00f6687261f19@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Rebuild from packaged staging: issues with	do_package_update_index_ipk
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
X-List-Received-Date: Tue, 18 Aug 2009 16:19:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 15, 2009 at 11:58:42PM +0200, Andrea Adami wrote:

> I'm testing rebuild from packaged staging (cleaning all in /tmp but
> /pstage) and I was stopped by a new issue with package_ipk.bbclass:

I'm a tiny bit rusty here, if you clear everything but pstage, how do
recipes get their packages re-created?  Do we stage those contents too?
I would have assumed that you also need to keep your packages dir around
too.

-- 
Tom Rini


