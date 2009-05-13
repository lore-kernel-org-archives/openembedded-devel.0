Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M4LsP-0007ZM-EC
	for openembedded-devel@openembedded.org; Wed, 13 May 2009 23:20:33 +0200
Received: (qmail 8388 invoked from network); 13 May 2009 21:13:46 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 13 May 2009 14:13:46 -0700
Date: Wed, 13 May 2009 14:13:42 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090513211342.GN7973@smtp.west.cox.net>
References: <20090513205603.AAC121893A7@amethyst.openembedded.net>
MIME-Version: 1.0
In-Reply-To: <20090513205603.AAC121893A7@amethyst.openembedded.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [oe-commits] Koen Kooi : gcc 4.3.3: fix regression from 4.3. 1	that caused fortran to get disabled for linux-gnueabi
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
X-List-Received-Date: Wed, 13 May 2009 21:20:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 13, 2009 at 10:56:03PM +0200, GIT User account wrote:

> Author: Koen Kooi <koen@openembedded.org>
> Date:   Wed May 13 22:49:19 2009 +0200
> 
> gcc 4.3.3: fix regression from 4.3.1 that caused fortran to get disabled for linux-gnueabi

This came up on IRC today for something else.  Why do we only build a
fortran compiler on ARM (EABI)?  Should it just be disabled on a few
platforms perhaps?

-- 
Tom Rini


