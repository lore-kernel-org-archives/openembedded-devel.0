Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Lq5st-0005x3-S1
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Apr 2009 15:30:07 +0200
Received: from andromeda.vanille.de (e180129118.adsl.alicedsl.de
	[85.180.129.118])
	by drlauer-research.com (Postfix) with ESMTP id D76605841AA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Apr 2009 15:50:48 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Sat, 4 Apr 2009 15:23:29 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.27-11-generic; KDE/4.2.2; x86_64; ; )
References: <ac9c93b10904030956g2e8a1663g7877947b1a17775c@mail.gmail.com>
	<069B6B31F6201B4389D7EEB9AD827BCA0500604A@otis.burlington.evertz.tv>
	<ac9c93b10904040101p434f67acrd9cc05602b57ec91@mail.gmail.com>
In-Reply-To: <ac9c93b10904040101p434f67acrd9cc05602b57ec91@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200904041523.29738.mickey@vanille-media.de>
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Scanned: No (on linuxtogo.org); SA Timed out after 240 secs
Subject: Re: [STABLE] Where is the python-zopeinterface recipe?
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
X-List-Received-Date: Sat, 04 Apr 2009 13:30:10 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 04 April 2009 10:01:09 Frans Meulenbroeks wrote:
> I think what happened is that when zopeinterface was split off the
> zope recipe, the name got changed. Not sure if that was intentional.
>
> Mickey, as I am not a python wiz: should baking zopeinterface result
> in a python-zopeinterface package or should we change the name in the
> packages that require zopeinterface (like twisted) ?

We should change the name here. 

:M:



