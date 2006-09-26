Received: from [195.234.128.72] (helo=scotty.chl-informatik.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <christopher.lang@plus.cablesurf.de>)
	id 1GSAdA-0007EP-8y
	for openembedded-devel@openembedded.org; Tue, 26 Sep 2006 12:57:40 +0200
Received: from linux64.chl-informatik.de (linux64.chl-informatik.de
	[192.168.10.17])
	by scotty.chl-informatik.de (8.12.3/8.12.3/SuSE Linux 0.6) with ESMTP
	id k8QA39VR011785; Tue, 26 Sep 2006 12:03:09 +0200
From: Christopher Lang <christopher.lang@plus.cablesurf.de>
To: openembedded-devel@openembedded.org
Date: Tue, 26 Sep 2006 12:58:58 +0200
User-Agent: KMail/1.9.1
References: <45190D58.2020807@adtelecom.es>
In-Reply-To: <45190D58.2020807@adtelecom.es>
MIME-Version: 1.0
Message-Id: <200609261258.59063.christopher.lang@plus.cablesurf.de>
Subject: Re: List of dependent packages
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
X-List-Received-Date: Tue, 26 Sep 2006 10:57:40 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Joaquim,

I find "ipkg list" on the running target device very helpful. It lists all 
packages an image consists of.

Also "ipkg info" on the target device produces some output. Here you can see 
all packages and their dependencies.

This only works if you have an image already running on the target device.

I hope this helps.

Chris
  


Am Dienstag, 26. September 2006 13:22 schrieb Joaquim Duran:
> Dear all,
>
> Is there any way to know the set of packages to be included in an
> image? Or more generally, how can I list the set of packages (with
> recursion) that are needed for one specified package?
>
> This should be done once processed the config file and updated the cache
> and before the compilation of packages.
>
> Thanks and Best Regards,
> Joaquim Duran
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


