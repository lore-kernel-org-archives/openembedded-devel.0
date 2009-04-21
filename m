Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LwIvI-000782-2Z
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 18:34:16 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090421162948.PVQS6112.fed1rmmtao102.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 12:29:48 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id iGVl1b00N4dMFYL04GVlUe; Tue, 21 Apr 2009 12:29:47 -0400
X-Authority-Analysis: v=1.0 c=1 a=JW5XH6fX0PUupc9VQSQA:9
	a=lQXxxL2nLg1oEe4_8j0A:7 a=pySwZQy97SKo-bJi68oVZqg1fSEA:4
X-CM-Score: 0.00
Date: Tue, 21 Apr 2009 09:29:45 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090421162945.GK17629@smtp.west.cox.net>
References: <20090421161342.GA5630@rhein.zuhause.netz>
MIME-Version: 1.0
In-Reply-To: <20090421161342.GA5630@rhein.zuhause.netz>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Ack for ffmpeg patch
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
X-List-Received-Date: Tue, 21 Apr 2009 16:34:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 21, 2009 at 06:13:42PM +0200, Henning Heinold wrote:

> Hi,
> 
> is the attached patch okay for dev. The patch removes the install
> of the headers to the legacy directories. Without the patch it is very complicated
> to compile xine 1.1.16.3.

Did you mean "adds the install of the headers ..." ?  If so, yes, this
looks good.

-- 
Tom Rini


