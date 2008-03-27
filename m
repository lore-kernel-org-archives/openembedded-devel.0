Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Jf01l-0005aW-LX
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Mar 2008 22:52:53 +0100
Received: from andromeda (e180155079.adsl.alicedsl.de [85.180.155.79])
	by drlauer-research.com (Postfix) with ESMTP id CC77F584C61
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2008 23:01:30 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Mar 2008 22:53:37 +0100
User-Agent: KMail/1.9.9
References: <1d6c95c90803270737w7125208aia886a185e00df781@mail.gmail.com>
In-Reply-To: <1d6c95c90803270737w7125208aia886a185e00df781@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200803272253.37796.mickey@vanille-media.de>
Subject: Re: Send specific patches to upstream
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Mar 2008 21:52:53 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 27 March 2008 15:37:37 Aloisio Almeida wrote:
> Mamona project has 3 patches (2 for epsilon and 1 for python-epsilon)
> that are specific to our distribution. As specif, these patches won't
> be sent to upstream.
> I added these patches using
>
> SRC_URI_append_mamona = "file://<patch>;patch=1"
>
> What about upload these patches, as they won't affect other projects?

Sounds good. Please make a files/ directory and upload them as 
mamona-<description>. I'll take a look at what these are doing and if there 
are perhaps even more useful for others than you think ;)

:M:
-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de


