Received: from [62.169.194.2] (helo=fesscrpp1.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <skoroneos@digital-opsis.com>) id 1HEKvk-00036j-Ob
	for openembedded-devel@openembedded.org; Tue, 06 Feb 2007 08:39:58 +0100
Received: from dias (62.169.211.226) by fesscrpp1.tellas.gr (7.3.117)
	id 4526170101D6874F for openembedded-devel@openembedded.org;
	Tue, 6 Feb 2007 09:39:09 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Tue, 6 Feb 2007 09:39:54 +0200
Message-ID: <HOECLKEKOHLAMMGDLLBHOEHNKAAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3028
In-Reply-To: <45C71BD0.9060509@dominion.kabel.utwente.nl>
Importance: Normal
Subject: Re: Steps to Build a kernel
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
X-List-Received-Date: Tue, 06 Feb 2007 07:39:59 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

>
> > Now when I tried to run bitbake bootstrap-image from huild it
> always giving
> > ERROR:unable to open /bitbake/conf/bitbake.conf files.
>

Most probable cause is that one of your config files has tabs/whitespaces
mixed

Stelios




