Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1NUkXq-000344-78
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 18:28:45 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 59F1F11000E9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 18:26:29 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id A17A91100096
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 18:26:28 +0100 (CET)
Received: from rhein.familie-heinold.de (f052064053.adsl.alicedsl.de
	[78.52.64.53]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 18:26:28 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id B11D73C11F; Tue, 12 Jan 2010 18:26:27 +0100 (CET)
Date: Tue, 12 Jan 2010 18:26:27 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100112172626.GA3850@rhein.zuhause.netz>
References: <1263304959.18954.38.camel@balakrishnan-desktop>
MIME-Version: 1.0
In-Reply-To: <1263304959.18954.38.camel@balakrishnan-desktop>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Adding PXA270 based Machine....
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
X-List-Received-Date: Tue, 12 Jan 2010 17:28:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 12, 2010 at 07:32:39PM +0530, balakrishnan wrote:
>          I going to add pxa270 based machine with Angstrom distribution
> to OE, regarding this can I have answer of list of my doubts...   
> 
> 1.Whether I can send machine conf ,linux recipes, U-Boot recipes and
> Image recipes are in single patch or separated patch?  

seperated patches please

> 2.If OE-Dev mailing list accepted my patches then, what is my next step?
oe-dev list is good

> 3.If it commited by myself then, what commit rights I have?
If you work hard and provide us patches and apply for write
access you can do it in the end your self if you want.

> 4.Can I commit with out "Signed-off-by" line?
If you have write access Signed-off is not needed,
If you dont have it sign your patches

> 
> Thank You

Bye Henning


