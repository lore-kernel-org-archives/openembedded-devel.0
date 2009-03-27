Received: from [216.145.245.200] (helo=mx04.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LnFkU-0007Qz-8V
	for openembedded-devel@openembedded.org; Fri, 27 Mar 2009 18:21:42 +0100
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx04.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LnFij-0001iu-Ug
	for openembedded-devel@openembedded.org; Fri, 27 Mar 2009 12:19:53 -0500
Message-ID: <49CD0AB7.3010309@dls.net>
Date: Fri, 27 Mar 2009 12:19:51 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1238173051-2118-1-git-send-email-khimov@altell.ru>
In-Reply-To: <1238173051-2118-1-git-send-email-khimov@altell.ru>
Subject: Re: [PATCH] dialog: update version 1.0-20050306 -> 1.1-20080819
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
X-List-Received-Date: Fri, 27 Mar 2009 17:21:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Roman I Khimov wrote:
> Previous version is obsolete and can't be found on official FTP, it is also
> removed from Debian archives so the packages failed to build if not using
> some distro-specific mirror.
> 
> Hence, update version removing the old one along the way.

No comment on this particular patch, just in general I want to note that
one cannot assume that just because the sources for an older version
might be unfetchable on an official download site is insufficient reason
to delete the old recipe.

For example, nslu2-linux.org mirrors all sources used to build SlugOS;
and there are also commonly alternate locations for older sources.

It may be the choice of the distro manager to update the SRC_URI as a
temporary solution until they feel ready to move to the new version.

Let's not be so hasty to delete!

Mike (mwester)


