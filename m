Received: from jak.nl ([65.204.18.188]) by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <arjan@jak.nl>) id 1ORR8n-0001oy-8w
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 16:41:27 +0200
Received: (qmail 26063 invoked by uid 89); 23 Jun 2010 14:30:07 -0000
Received: from jak.nl (HELO ?128.79.129.1?) (65.204.18.188)
	by jak.nl with SMTP; 23 Jun 2010 14:30:07 -0000
Message-ID: <4C221A64.1020002@jak.nl>
Date: Wed, 23 Jun 2010 16:29:56 +0200
From: Arjan <arjan@jak.nl>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.1.10) Gecko/20100512 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 65.204.18.188
X-SA-Exim-Mail-From: arjan@jak.nl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: DISTRO=Angstrom on i686-generic build failure on base-image
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
X-List-Received-Date: Wed, 23 Jun 2010 14:41:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello all,

I'm new here, so maybe this is a known issue. But I couln't find the 
solution.

Building  the 'base-image' using:

DISTRO   = "angstrom-2008.1"
MACHINE ?= "i686-generic"
this error occurs:

> | checking for cups-config... /usr/bin/cups-config
> | checking cups/cups.h usability... no
> | checking cups/cups.h presence... no
> | checking for cups/cups.h... no
> | configure: error: *** Sorry, cups-config present but cups/cups.h 
> missing.
> | ERROR: Function do_configure failed
> NOTE: package gtk+-native-2.20.0-r8.0: task do_configure: Failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of 
> virtual:native:/media/disk/prj/alcons/angstrom/sources/openembedded/recipes/gtk+/gtk+_2.20.0.bb 
> do_configure failed
> ERROR: Task 2060 
> (virtual:native:/media/disk/prj/alcons/angstrom/sources/openembedded/recipes/gtk+/gtk+_2.20.0.bb, 
> do_configure) failed with 256
> ERROR: 
> 'virtual:native:/media/disk/prj/alcons/angstrom/sources/openembedded/recipes/gtk+/gtk+_2.20.0.bb' 
> failed
>


Anybody any ideas?

Thanks.
Arjan


