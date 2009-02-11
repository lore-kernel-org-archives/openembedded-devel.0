Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LXOcC-0007E4-Ke
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 00:35:36 +0100
Received: from andromeda.vanille.de (e180174088.adsl.alicedsl.de
	[85.180.174.88])
	by drlauer-research.com (Postfix) with ESMTP id 967BA5843DC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2009 00:57:22 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2009 00:34:23 +0100
User-Agent: KMail/1.9.10
References: <1234393426.16455.67.camel@alap>
In-Reply-To: <1234393426.16455.67.camel@alap>
MIME-Version: 1.0
Message-Id: <200902120034.24306.mickey@vanille-media.de>
Subject: Re: [patch] new gta01_config file to build devel kernels on fso milestone5 branch
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
X-List-Received-Date: Wed, 11 Feb 2009 23:35:36 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

The patch looks good, but we did quite some things to be able to use upstream 
defconfigs which we just slightly preprocess and I'd rather not start with 
own defconfigs again for such a moving target. Can't we do the same as we do 
with the 02 config?

:M:


