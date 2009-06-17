Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MGz6k-0007IX-4w
	for openembedded-devel@openembedded.org; Wed, 17 Jun 2009 19:39:34 +0200
Received: (qmail 28510 invoked from network); 17 Jun 2009 17:29:06 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 17 Jun 2009 10:29:06 -0700
Date: Wed, 17 Jun 2009 10:29:05 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090617172905.GE15477@smtp.west.cox.net>
References: <1245258640-1623-1-git-send-email-clarson@mvista.com>
MIME-Version: 1.0
In-Reply-To: <1245258640-1623-1-git-send-email-clarson@mvista.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] image.bbclass: remove tmp/rootfs after image	creation unless you set a variable
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
X-List-Received-Date: Wed, 17 Jun 2009 17:39:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 17, 2009 at 10:10:40AM -0700, Chris Larson wrote:

> Set IMAGE_KEEPROOTFS to something other than the empty string to keep
> tmp/rootfs around after image creation, otherwise it will be removed, as it's
> not a fully functional filesystem, and causes much confusion among users as a
> result.
> 
> Signed-off-by: Chris Larson <clarson@mvista.com>

Acked-by: Tom Rini <trini@embeddedalley.com>

-- 
Tom Rini


