Received: from [137.79.94.127] (helo=s383.jpl.nasa.gov)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <ehovland@s383.jpl.nasa.gov>) id 1GYR2B-0001A2-UK
	for openembedded-devel@openembedded.org; Fri, 13 Oct 2006 19:41:24 +0200
Received: from mage.jpl.nasa.gov (mage [137.78.15.62])
	by s383.jpl.nasa.gov (8.12.10/8.12.10) with ESMTP id k9DHYswg012844
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2006 10:34:54 -0700 (PDT)
Received: by mage.jpl.nasa.gov (Postfix, from userid 4960)
	id 62EEE300100C; Fri, 13 Oct 2006 10:34:54 -0700 (PDT)
Date: Fri, 13 Oct 2006 10:34:54 -0700
From: Erik Hovland <erik@hovland.org>
To: openembedded-devel@openembedded.org
Message-ID: <20061013173454.GA25324@mage.jpl.nasa.gov>
References: <698474498.20061013195107@gmail.com>
Mime-Version: 1.0
In-Reply-To: <698474498.20061013195107@gmail.com>
User-Agent: Mutt/1.5.9i
Subject: Re: [RFC] handhelds-pxa-2.6 -> linux-handhelds-2.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Oct 2006 17:41:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 13, 2006 at 07:51:07PM +0300, Paul Sokolovsky wrote:
> 2. "pxa" there is misleading, as 2.6 tree supports different
> architectures. Handhelds.org tree as of now supports PXA, SA, and S3
> (Samsung) devices. To the various degrees, but that's improving.

Technically, the pxa is not misleading per se. That recipe only builds a
kernel for pxa devices. But since we are not really targeting one kernel
for several handhelds, I don't see a problem with what you propose.

E

-- 
Erik Hovland
mail: erik AT hovland DOT org
web: http://hovland.org/
PGP/GPG public key available on request


