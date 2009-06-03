Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MBtBe-0002hC-5i
	for openembedded-devel@openembedded.org; Wed, 03 Jun 2009 18:19:34 +0200
Received: (qmail 30746 invoked from network); 3 Jun 2009 16:10:35 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 3 Jun 2009 09:10:35 -0700
Date: Wed, 3 Jun 2009 09:10:35 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090603161035.GL26065@smtp.west.cox.net>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
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
X-List-Received-Date: Wed, 03 Jun 2009 16:19:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 03, 2009 at 06:37:10PM +0300, Ihar Hrachyshka wrote:

> This patchset:
> - adds meta-toolchain-qte.bb to install toolchain with Qt/Embedded and
>   all the needed tools ready to use for qt4-embedded development;
> - adds directfb support for qt4-embedded;
> - includes missing files to qt4 packages;
> - fixes code style, generalize qt4 recipes and classes, reworked directory
>   layout;
> - occasionally ports pkg-config to INC_PR.

What machine / distro combinations have you tested all of this with, and
what recipes (other than meta-toolchain-qte) have you explicitly built
after?  ie have you built / run some QtE images or similar too?  Thanks.

-- 
Tom Rini


