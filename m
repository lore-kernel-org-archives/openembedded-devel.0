Return-Path: <wbx@uclibc-ng.org>
X-Greylist: delayed 354 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 20 Jul 2014 19:19:21 UTC
Received: from helium.waldemar-brodkorb.de (helium.waldemar-brodkorb.de
	[89.238.66.15])
	by mail.openembedded.org (Postfix) with ESMTP id 0C7D36AC93
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 19:19:21 +0000 (UTC)
Received: by helium.waldemar-brodkorb.de (Postfix, from userid 1000)
	id 8026B104CA; Sun, 20 Jul 2014 21:13:27 +0200 (CEST)
Date: Sun, 20 Jul 2014 21:13:27 +0200
From: Waldemar Brodkorb <wbx@uclibc-ng.org>
To: buildroot@buildroot.org
Message-ID: <20140720191326.GD4431@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Operating-System: Linux 3.2.0-4-amd64 x86_64
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openwrt-devel@openwrt.org, openembedded-devel@lists.openembedded.org
Subject: uClibc-ng
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Jul 2014 19:19:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello Embedded Linux Hackers,

it seems there is no plan to release a new uClibc version.
The current maintainer does not response on any public or private mails
about a plan to do a needed release. Therefore most of you carrying a lot
of patches against uClibc 0.9.33.2 to make it work in your project.
A really ugly situation. 

To get out of this situation I started a spin-off called uClibc-ng.
The website for the project is here: http://www.uclibc-ng.org
Beta 3 is tagged and downloadable via 
http://downloads.uclibc-ng.org/uClibc-ng-1.0.0beta3.tar.xz

If you want a 1.0 in the near future please test and report back any
issues. You can use the bug tracker, the mailing list or dicussion forum
to report back. To prevent spam you need to be subscribed or registered.

I have added most of the patches from your projects on top of uClibc
master.

Thanks
 Waldemar


