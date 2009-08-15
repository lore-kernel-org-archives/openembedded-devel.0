Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1Mc9FC-0006Ac-8A
	for openembedded-devel@openembedded.org; Sat, 15 Aug 2009 04:43:46 +0200
Received: (qmail 3558 invoked from network); 15 Aug 2009 02:27:04 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 14 Aug 2009 19:27:04 -0700
Date: Fri, 14 Aug 2009 19:27:03 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090815022703.GH14883@smtp.west.cox.net>
References: <20090814215138.GB31011@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20090814215138.GB31011@gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [RFC] Adding eglibc versions of minimal and micro distro
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
X-List-Received-Date: Sat, 15 Aug 2009 02:43:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 14, 2009 at 02:51:38PM -0700, Khem Raj wrote:

> Hi
> 
> I would like to add minimal-eglibc and micro-eglibc distros on same
> lines as -uclibc one's
> 
> Any objections ?

minimal-uclibc and micro-uclibc should go away and just pickup from LIBC
being passed in / set.

-- 
Tom Rini


