Received: from smtpauth21.prod.mesa1.secureserver.net ([64.202.165.38])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1NGYz0-0007mc-83
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 15:18:09 +0100
Received: (qmail 25767 invoked from network); 4 Dec 2009 14:09:48 -0000
Received: from unknown (209.242.7.187)
	by smtpauth21.prod.mesa1.secureserver.net (64.202.165.38) with ESMTP;
	04 Dec 2009 14:09:48 -0000
Message-ID: <4B191830.9010603@mwester.net>
Date: Fri, 04 Dec 2009 08:09:52 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B18811D.8020206@mwester.net>	<6ec4247d0912032053g5f4963a7t6280f5341cce12e8@mail.gmail.com>
	<d1b08f940912040040v3289f021k4e7877e4c5f46777@mail.gmail.com>
In-Reply-To: <d1b08f940912040040v3289f021k4e7877e4c5f46777@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.202.165.38
X-SA-Exim-Mail-From: mike@mwester.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Commit 2fdf1aa1c869ea9deecee86206f49a2eca9d7c00 breaks opkg
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
X-List-Received-Date: Fri, 04 Dec 2009 14:18:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Andrea Adami wrote:
> FYI,
> 
> I had similar issues with opkg-cl (was linked with libldap of my
> buildhost...[1]).
> 
> I thouht it was originated by bump to SRCREV to 413 but a rebuild from
> scratch fixed all.
> 
> Please retry the hard way...

This is on a clean build :)

-Mike (mwester)


