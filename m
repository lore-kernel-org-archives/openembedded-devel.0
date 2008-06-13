Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1K7IT8-0004OC-HV
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Jun 2008 01:14:06 +0200
Received: from xora.org.uk ([::ffff:78.86.128.56])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,128bits,AES128-SHA)
	by xora.org.uk with esmtp; Sat, 14 Jun 2008 00:13:51 +0100
	id 00071111.4852FF2F.00002C62
Date: Sat, 14 Jun 2008 00:17:09 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080613231709.GB3606@cimmeria.hyboria>
References: <20080613225643.86B4D1881B6@amethyst.openembedded.net>
Mime-Version: 1.0
In-Reply-To: <20080613225643.86B4D1881B6@amethyst.openembedded.net>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [oe-commits] org.oe.dev udev-118: go back in time to udev-115	which seems to work slightly better on some Zaurus models
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 13 Jun 2008 23:14:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Jun 14, 2008 at 12:56:43AM +0200, mickeyl commit wrote:
> udev-118: go back in time to udev-115 which seems to work slightly better on some Zaurus models
> Zaurus models: need to force downgrade, I don't want to raise PE here.
> 
> # rename "packages/udev/udev-118"
> #     to "packages/udev/udev-115"
> # 
> # rename "packages/udev/udev_118.bb"
> #     to "packages/udev/udev_115.bb"
> # 

Im sorry I have to call for a dissaprove on this one, there is no way
in hell this is the correct way to deal with a small problem on a couple
of machines.

Graeme



