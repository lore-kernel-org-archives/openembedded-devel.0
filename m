Received: from leibniz.math.fu-berlin.de ([160.45.40.10]
	helo=mail.math.fu-berlin.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1QeOqo-0006Uo-BS
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 11:56:58 +0200
Received: (qmail 19388 invoked from network); 6 Jul 2011 11:53:09 +0200
Received: from hydra.imp.fu-berlin.de (HELO hydra) (160.45.117.149)
	by leibniz.math.fu-berlin.de with SMTP; 6 Jul 2011 11:53:09 +0200
X-Virus-Scanned: Debian amavisd-new on 'hydra':10024 at mi.fu-berlin.de
Received: from math.fu-berlin.de ([160.45.40.10])
	by hydra (hydra.imp.fu-berlin.de [160.45.117.149]) (amavisd-new,
	port 10024) with SMTP id OxDaGWq19ATE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jul 2011 11:52:59 +0200 (CEST)
Received: (Qmail 19335 invoked from network); 6 Jul 2011 11:52:59 +0200
Received: From andorra.imp.fu-berlin.de (160.45.42.84)
	by leibniz.math.fu-berlin.de with SMTP; 6 Jul 2011 09:52:59 -0000
Received: from heinold by andorra.imp.fu-berlin.de with local (Exim 4.72 #1
	(Debian)) id 1QeOmx-0003kh-25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jul 2011 11:52:59 +0200
Date: Wed, 6 Jul 2011 11:52:59 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110706095258.GA2230@mail.familie-heinold.de>
References: <4E142E2F.6040101@flatfrog.com>
MIME-Version: 1.0
In-Reply-To: <4E142E2F.6040101@flatfrog.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Heinold <heinold@mi.fu-berlin.de>
Subject: Re: Discouraged kernels 2.6.35+?
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
X-List-Received-Date: Wed, 06 Jul 2011 09:56:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

this depends on the features you need.

If you are needed to use the dsp you have to stick to .32
If you need the sgx running, the other kernels should work.

Bye Henning


