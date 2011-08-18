Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <fabian-buettner@gmx.de>) id 1Qu2Ki-0005Ob-K3
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 15:08:28 +0200
Received: (qmail invoked by alias); 18 Aug 2011 12:57:09 -0000
Received: from lak-31-116.wohnheime.ruhr-uni-bochum.de (EHLO localhost)
	[134.147.31.116]
	by mail.gmx.net (mp012) with SMTP; 18 Aug 2011 14:57:09 +0200
X-Authenticated: #4787129
X-Provags-ID: V01U2FsdGVkX195uvAhCOp5BtLUta/MnlBXu9aRL9nj4RQDCW3kTk
	k/n6Tb22mf+dxt
Date: Thu, 18 Aug 2011 14:57:08 +0200
From: fabian =?iso-8859-15?Q?b=FCttner?= <fabian-buettner@gmx.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110818125708.GB26690@golden>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Y-GMX-Trusted: 0
Subject: [beagleboard] Unable to build Angstrom meta-toolchain
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
X-List-Received-Date: Thu, 18 Aug 2011 13:08:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I am having troubles compiling the Angstrom SDK.

I used the angstrom-setup-scripts to configure OE, sourced the
environment
settings and built the base-image with bitbake.

While trying to compile the meta-toolchain, I am always getting this error 
when bitmake finishes downloading task-sdk-bare_1.0-r2.6_armv7a.ipk.
...
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies
for task-sdk-bare:
|  *    libstdc++-dev *
|  * opkg_install_cmd: Cannot install package task-sdk-bare.
NOTE: package meta-toolchain-1.0-r0: task do_populate_sdk: Failed

Any clues how to fix this?

regards,
fabian


