Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M3DhD-0004W1-Nd
	for openembedded-devel@openembedded.org; Sun, 10 May 2009 20:24:20 +0200
Received: (qmail 1727 invoked from network); 10 May 2009 18:17:52 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 10 May 2009 11:17:52 -0700
Date: Sun, 10 May 2009 11:17:51 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090510181751.GY7973@smtp.west.cox.net>
References: <1241977541-6297-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1241977541-6297-1-git-send-email-raj.khem@gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] python-native_2.6.1.bb: Configure with --with-zlib
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
X-List-Received-Date: Sun, 10 May 2009 18:24:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 10, 2009 at 10:45:41AM -0700, Khem Raj wrote:
[snip]
> I built python native with --with-zlib option and it worked fine.
> 
> Is the below patch ok ?

IMHO, you need to add zlib-native to the deps (if it it's not already
there).

-- 
Tom Rini


