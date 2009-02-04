Received: from [212.27.42.5] (helo=smtp5-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ebenard@free.fr>) id 1LUioD-0004yC-48
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Feb 2009 15:32:57 +0100
Received: from smtp5-g21.free.fr (localhost [127.0.0.1])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 6D355D481D9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2009 15:32:47 +0100 (CET)
Received: from [192.168.1.15] (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 7E0C8D481D4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2009 15:32:45 +0100 (CET)
Message-ID: <4989A70D.8010009@free.fr>
Date: Wed, 04 Feb 2009 15:32:45 +0100
From: Eric BENARD <ebenard@free.fr>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49899FCE.3020900@free.fr> <gmc7qq$gim$1@ger.gmane.org>
In-Reply-To: <gmc7qq$gim$1@ger.gmane.org>
Subject: Re: gnutls-2.4.2 & automake 1.10
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
X-List-Received-Date: Wed, 04 Feb 2009 14:32:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Koen,

Koen Kooi wrote :
> use DISTRO=angstrom-2008.1 and define your own minimal image.
> 
OK, thanks.
Is the minimal image I can build minimal-image.bb ? (excluding the 
helloworld-image of course ;-)

BTW : minimal distro build failed later on gnome-vfs-2.22.0-r0 which 
needs fetching fakeroot_1.9.6.tar.gz manually and running "bitbake 
dbus-glib" in order to build.

Thanks,
Eric


