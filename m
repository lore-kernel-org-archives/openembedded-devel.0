Received: from [74.125.78.145] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1MB46K-0007di-HM
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Jun 2009 11:46:40 +0200
Received: by ey-out-1920.google.com with SMTP id 26so3615084eyw.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Jun 2009 02:37:57 -0700 (PDT)
Received: by 10.210.89.4 with SMTP id m4mr344346ebb.54.1243849076975;
	Mon, 01 Jun 2009 02:37:56 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 10sm6730141ewy.60.2009.06.01.02.37.53
	(version=SSLv3 cipher=RC4-MD5); Mon, 01 Jun 2009 02:37:54 -0700 (PDT)
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1MB0v2-0003dQ-Mk@melo.nslu2-linux.org>
References: <E1MB0v2-0003dQ-Mk@melo.nslu2-linux.org>
Date: Mon, 01 Jun 2009 10:37:52 +0100
Message-Id: <1243849072.2828.1.camel@xora-desktop.xora.org.uk>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 (2.26.1-2.fc11) 
Subject: Re: [oe-commits] Mike Westerhof : SHR: linux kernel - add linux-openmoko-shr-devel kernel recipe.
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
X-List-Received-Date: Mon, 01 Jun 2009 09:46:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-06-01 at 06:22 +0000, git version control wrote:
> Module: openembedded.git
> Branch: shr/import
> Commit: f1fa5981d57286c49fd5191d37538680f7835efd
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=f1fa5981d57286c49fd5191d37538680f7835efd
> 
> Author: Mike Westerhof <mwester@dls.net>
> Date:   Mon Jun  1 01:21:06 2009 -0500
> 
> SHR: linux kernel - add linux-openmoko-shr-devel kernel recipe.
> This obsoletes the patches in the SHR overlay.

>  .../linux-openmoko-shr-devel/fix-install.patch     |   23 ++++++++++++++++++

Just a small note, in core OE these sort of patches should no longer be
required. install-native was obsoleted in favor of real install in
coreutils.

Graeme




