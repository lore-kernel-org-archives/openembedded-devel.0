Received: from cheddar.halon.org.uk ([217.10.144.130])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve.mcintyre+caf_=stevelinaro=einval.com@linaro.org>)
	id 1QipD4-0003RL-0e for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2011 16:54:14 +0200
Received: from bsmtp by cheddar.halon.org.uk with local-bsmtp (Exim 4.72)
	(envelope-from <steve.mcintyre+caf_=stevelinaro=einval.com@linaro.org>)
	id 1QiorZ-0001sY-Is for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2011 15:32:01 +0100
Received: from stemci01 by e102122-lin with local (Exim 4.72)
	(envelope-from <steve.mcintyre+caf_=stevelinaro=einval.com@linaro.org>)
	id 1Qioqu-0005fL-W8 for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2011 15:31:21 +0100
Resent-From: Steve McIntyre <steve.mcintyre@linaro.org>
Resent-Date: Mon, 18 Jul 2011 15:31:20 +0100
Resent-Message-ID: <20110718143120.GF8763@linaro.org>
Resent-To: openembedded-devel@lists.openembedded.org
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on cheddar.halon.org.uk
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SUSPICIOUS_RECIPS autolearn=no version=3.3.1
Received: from mail-vw0-f53.google.com ([209.85.212.53])
	by cheddar.halon.org.uk with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16)
	(Exim 4.72)
	(envelope-from <steve.mcintyre+caf_=stevelinaro=einval.com@linaro.org>)
	id 1Qio8V-0008PY-Jg
	for stevelinaro@einval.com; Mon, 18 Jul 2011 14:45:27 +0100
Received: by vws13 with SMTP id 13so2513535vws.12
	for <stevelinaro@einval.com>; Mon, 18 Jul 2011 06:45:21 -0700 (PDT)
Received: by 10.52.22.235 with SMTP id h11mr6268531vdf.468.1310996721474;
	Mon, 18 Jul 2011 06:45:21 -0700 (PDT)
X-Forwarded-To: stevelinaro@einval.com
X-Forwarded-For: steve.mcintyre@linaro.org stevelinaro@einval.com
Received: by 10.52.108.37 with SMTP id hh5cs82029vdb;
	Mon, 18 Jul 2011 06:45:21 -0700 (PDT)
Received: by 10.227.10.31 with SMTP id n31mr5514550wbn.97.1310996719777;
	Mon, 18 Jul 2011 06:45:19 -0700 (PDT)
Received: from mombin.canonical.com (mombin.canonical.com [91.189.95.16])
	by mx.google.com with ESMTP id ei15si7824186wbb.98.2011.07.18.06.45.19; 
	Mon, 18 Jul 2011 06:45:19 -0700 (PDT)
Received-SPF: neutral (google.com: 91.189.95.16 is neither permitted nor
	denied by best guess record for domain of
	cross-distro-bounces@lists.linaro.org) client-ip=91.189.95.16; 
Authentication-Results: mx.google.com;
	spf=neutral (google.com: 91.189.95.16 is neither
	permitted nor denied by best guess record for domain of
	cross-distro-bounces@lists.linaro.org)
	smtp.mail=cross-distro-bounces@lists.linaro.org
Received: from localhost ([127.0.0.1] helo=mombin.canonical.com)
	by mombin.canonical.com with esmtp (Exim 4.71)
	(envelope-from <cross-distro-bounces@lists.linaro.org>)
	id 1Qio8M-0000Ky-Na; Mon, 18 Jul 2011 13:45:18 +0000
Received: from cheddar.halon.org.uk ([217.10.144.130])
	by mombin.canonical.com with esmtp (Exim 4.71)
	(envelope-from <steve.mcintyre@linaro.org>)
	id 1Qio8L-0000Ke-1W; Mon, 18 Jul 2011 13:45:17 +0000
Received: from bsmtp by cheddar.halon.org.uk with local-bsmtp (Exim 4.72)
	(envelope-from <steve.mcintyre@linaro.org>)
	id 1Qio86-0008Gy-LR; Mon, 18 Jul 2011 14:45:02 +0100
Received: from stemci01 by e102122-lin with local (Exim 4.72)
	(envelope-from <steve.mcintyre@linaro.org>)
	id 1Qio7k-0002vl-6G; Mon, 18 Jul 2011 14:44:40 +0100
Date: Mon, 18 Jul 2011 14:44:40 +0100
From: Steve McIntyre <steve.mcintyre@linaro.org>
To: Fedora ARM <arm@lists.fedoraproject.org>,
	Debian ARM <debian-arm@lists.debian.org>, MeeGo Dev <meego-dev@meego.com>, 
	Gentoo Dev <gentoo-embedded@lists.gentoo.org>,
	OpenEmbedded Devel <openembedded-devel@lists.openembedded.org>,
	Ubuntu Devel <ubuntu-devel@lists.ubuntu.com>
Message-ID: <20110718134440.GB23466@linaro.org>
MIME-Version: 1.0
X-attached: unknown
User-Agent: Mutt/1.5.20 (2009-06-14)
X-BeenThere: cross-distro@lists.linaro.org
X-Mailman-Version: 2.1.13
Precedence: list
Sender: cross-distro-bounces@lists.linaro.org
Errors-To: cross-distro-bounces@lists.linaro.org
Cc: cross-distro@lists.linaro.org, linaro-dev@lists.linaro.org
Subject: ARM: new cross-distro@ list
X-BeenThere: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 18 Jul 2011 14:54:14 -0000
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi folks,

Many GNU/Linux distributions are doing some ARM porting; this tends to
result in work duplication, and there doesn't seem to be a general
purpose forum to bring ARM porters together.

We're inviting developers of GNU/Linux distributions with an interest
in ARM to join a new "cross-distro" list, hosted at Linaro:

   http://lists.linaro.org/mailman/listinfo/cross-distro

Any ARM Linux / Free Software discussion is welcome on the list, for
instance porting software to build on ARM, toolchain problems, dealing
with new ABIs, Thumb-2, NEON, kernel problems, announcement of new
tools etc.

Cheers,
-- 
Steve McIntyre                                steve.mcintyre@linaro.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs


_______________________________________________
cross-distro mailing list
cross-distro@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/cross-distro



