Received: from [194.158.229.47] (helo=smtp-be-02.be08.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dv@vollmann.ch>) id 1N8Miu-0005SL-5W
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 00:35:39 +0100
Received: from [192.168.26.14] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by smtp-be-02.be08.sunrise.ch (8.13.1/8.12.10) with ESMTP id
	nABNJM8f023804; Thu, 12 Nov 2009 00:19:23 +0100
Message-ID: <4AFB46E5.10700@vollmann.ch>
Date: Thu, 12 Nov 2009 00:21:09 +0100
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1257957370.25369.356.camel@lenovo.internal.reciva.com>
In-Reply-To: <1257957370.25369.356.camel@lenovo.internal.reciva.com>
X-SA-Exim-Connect-IP: 194.158.229.47
X-SA-Exim-Mail-From: dv@vollmann.ch
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM 2009 summary: DISTROs and FEATURES
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
X-List-Received-Date: Wed, 11 Nov 2009 23:35:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/09 17:36, Phil Blundell wrote:
> e) DISTROs should be encouraged to minimize the number of unbound
> variables which the user is expected to set in local.conf.  As a general
> principle, the tuple of (MACHINE, DISTRO) should be enough to completely
> determine the build environment.  Extra user-frobbable switches will
> undermine the coherence of the DISTRO.
This ('build environment') could be misleading.
I'd say it this way:
  DISTRO defines what to build
  local.conf defines, how to build (directory paths, parallelism, ...)

   Detlef



