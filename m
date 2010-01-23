Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NYfbI-0007EK-PF
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 14:00:31 +0100
Received: from tamarin.localnet (123-192-163-227.dynamic.kbronet.com.tw
	[123.192.163.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 73E881B10C79
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 12:57:01 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2010 13:57:52 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <1263888104.2678.15.camel@ubuntu-desktop>
	<C305642D-75E5-4B97-8A14-65BE8A867E53@mac.com>
	<BD272887-5F72-4B99-B9E9-0C8D1451426F@mac.com>
In-Reply-To: <BD272887-5F72-4B99-B9E9-0C8D1451426F@mac.com>
MIME-Version: 1.0
Message-Id: <201001231357.53005.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Bitbake build error on Fedora 12 x86 64-bit
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
X-List-Received-Date: Sat, 23 Jan 2010 13:00:31 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 23 January 2010 13:38:08 Elvis Dowson wrote:
> Hi,
>        I found the solution for this. I was using the older svn repository,
>  and bitbake is now being maintained using the git repository, which has
>  the latest updates.
> 
> Switching to the git version of the bitbake repository helped remove the
>  error, and the build has now commenced! :-)

And in general we encourage users to use the release tarballs of Bitbake. This 
is why you should not be able to find your git commands in the documentation on 
OpenEmbedded.org


