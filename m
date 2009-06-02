Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1MBTp3-0007iM-C5
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Jun 2009 15:14:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id A2A252C818
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jun 2009 13:04:30 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y1LpW7bh-fdv
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jun 2009 13:04:28 +0000 (UTC)
Received: from [10.1.10.2] (host61-87-static.14-79-b.business.telecomitalia.it
	[79.14.87.61]) by wiki.koala.it (Postfix) with ESMTP id 571CD2C814
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jun 2009 13:04:28 +0000 (UTC)
Message-ID: <4A25238D.1050005@gmail.com>
Date: Tue, 02 Jun 2009 15:05:17 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1243947084-813-1-git-send-email-k.kooi@student.utwente.nl>
In-Reply-To: <1243947084-813-1-git-send-email-k.kooi@student.utwente.nl>
Subject: Re: [STABLE][PATCH] Angstrom 2009.X: set version to 'stable'
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
X-List-Received-Date: Tue, 02 Jun 2009 13:14:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi ha scritto:
> From: Koen Kooi <koen@openembedded.org>
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  conf/distro/angstrom-2008.1.conf     |    2 +-
>  recipes/angstrom/angstrom-version.bb |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
> index 5c7d0c4..203e01d 100644
> --- a/conf/distro/angstrom-2008.1.conf
> +++ b/conf/distro/angstrom-2008.1.conf
> @@ -16,7 +16,7 @@
>  # org.openembedded.angstrom-2007.12-stable branch
>  
>  #DISTRO_VERSION = "2009.X"
> -DISTRO_VERSION = "2009.X-test-${DATE}"
> +DISTRO_VERSION = "2009.X-stable"
>  DISTRO_REVISION = "1"
>  DISTRO_PR = ".1"
>  
> diff --git a/recipes/angstrom/angstrom-version.bb b/recipes/angstrom/angstrom-version.bb
> index 6f1043c..4902ae7 100644
> --- a/recipes/angstrom/angstrom-version.bb
> +++ b/recipes/angstrom/angstrom-version.bb
> @@ -2,7 +2,7 @@ LICENSE = "MIT"
>  
>  PV = "${DISTRO_VERSION}"
>  PR = "r2"
> -PE = "1"
> +PE = "2"
>  
>  PACKAGES = "${PN}"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"

ACK

/marco


