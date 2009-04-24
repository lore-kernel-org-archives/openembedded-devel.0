Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1LxQDK-0005sq-JF
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 20:33:30 +0200
Received: (qmail 31361 invoked from network); 24 Apr 2009 18:28:44 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by  with SMTP; 24 Apr 2009 11:28:44 -0700
Date: Fri, 24 Apr 2009 11:28:43 -0700
From: Tom Rini <trini@embeddedalley.com>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090424182843.GA15489@smtp.west.cox.net>
References: <1240589520-1104-1-git-send-email-trini@kernel.crashing.org>
MIME-Version: 1.0
In-Reply-To: <1240589520-1104-1-git-send-email-trini@kernel.crashing.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH][STABLE] Various SDK-related updates
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
X-List-Received-Date: Fri, 24 Apr 2009 18:33:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 24, 2009 at 09:11:48AM -0700, Tom Rini wrote:
> The following series brings stable up to date with dev, with respect to
> SDK and Canadian SDK changes.  The only not directly SDK related change
> is the bugfix to wireless-tools so that libiw can be used.  mwester said
> I should pull the SlugOS-related fix in myself rather than wait for him
> to update SlugOS stuff in stable.  These changes have been build-tested
> for gcc 4.1.2/4.2.4/4.3.3 and at91sam9263ek qemuarm omap5912osk
> beagleboard vortex86sx qemux86 mpc8313e-rdb with DISTRO=angstrom-2008.1
> in both dev and stable with identical results.  These changes are also
> in the trini/stable/2009/sdk-updates branch.

Also now in
http://patchwork.openembedded.org/bundle/trini/trini-stable-2009-sdk-updates/

-- 
Tom Rini


