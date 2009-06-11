Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1MEnGq-0005hJ-1Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jun 2009 18:36:56 +0200
Received: from andromeda.vanille.de (e180155211.adsl.alicedsl.de
	[85.180.155.211])
	by drlauer-research.com (Postfix) with ESMTP id 90737584AE9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2009 19:00:09 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Jun 2009 18:27:06 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.28-11-generic; KDE/4.2.2; x86_64; ; )
References: <1244733177.6018.35.camel@dax.rpnet.com>
In-Reply-To: <1244733177.6018.35.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200906111827.06763.mickey@vanille-media.de>
Subject: Re: [Fwd: [poky] Packaged Staging Improvements]
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
X-List-Received-Date: Thu, 11 Jun 2009 16:36:56 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 11 June 2009 17:12:56 Richard Purdie wrote:
> Forwarding this as there is problem some interest here too...

Sounds cool, will any of this also fix the deploy-area-out-of-tmpdir issue 
which makes packaged staging completely not working for the typical usecase of 
removing tmpdir and then expecting packages to be filled up from staging area 
on rebuild?

:M:



