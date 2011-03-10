Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1Pxi0K-0002VI-4h
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 16:42:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 3F8E92C810
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2011 15:39:07 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K3Ak8SU1KRIi
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2011 15:39:03 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id ACDDF2C7D7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2011 15:39:02 +0000 (UTC)
Message-ID: <4D78F0F4.9000908@gmail.com>
Date: Thu, 10 Mar 2011 16:40:36 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1299768051.3853.21.camel@mattotaupa> <4D78E882.5040307@mentor.com>
In-Reply-To: <4D78E882.5040307@mentor.com>
Subject: Re: help2man-native: task configure fails with `configure: error: perl module Locale::gettext required`
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
X-List-Received-Date: Thu, 10 Mar 2011 15:42:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Tom Rini ha scritto, Il 10/03/2011 16:04:

> 
> Is this a uclibc target perhaps?
> 

Hi Tom,

Not mine, is this

Build Configuration:
BB_VERSION        = "1.10.2"
METADATA_BRANCH   = "master"
METADATA_REVISION = "40a8506"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "ronetix-pm9263"
DISTRO            = "angstrom"
DISTRO_VERSION    = "2010.7-test-20110310"
TARGET_FPU        = "soft"


