Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MH2Ul-0005Hl-0a
	for openembedded-devel@openembedded.org; Wed, 17 Jun 2009 23:16:35 +0200
Received: (qmail 29282 invoked from network); 17 Jun 2009 21:06:06 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 17 Jun 2009 14:06:06 -0700
Date: Wed, 17 Jun 2009 14:06:06 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090617210606.GI15477@smtp.west.cox.net>
References: <1245267720-13612-1-git-send-email-khimov@altell.ru>
	<1245267720-13612-2-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1245267720-13612-2-git-send-email-khimov@altell.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 2/3] package_ipk: optimize	do_package_update_index_ipk
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
X-List-Received-Date: Wed, 17 Jun 2009 21:16:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 17, 2009 at 11:41:59PM +0400, Roman I Khimov wrote:

> If there are no package updates since last index update, don't re-create
> indexes. Really helps when building something like 10 images.
> 
> Remove code duplication along the way.

Acked-by: Tom Rini <trini@embeddedalley.com>

-- 
Tom Rini


