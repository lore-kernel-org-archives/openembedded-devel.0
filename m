Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Kv8pw-0005Zc-2n
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Oct 2008 12:03:40 +0100
Received: from [92.116.133.247] (helo=tamarin.localnet)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Kv8p0-0008O3-Tg
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Oct 2008 12:02:44 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Oct 2008 23:33:46 +0100
User-Agent: KMail/1.10.1 (Linux/2.6.27-7-generic; KDE/4.1.2; i686; ; )
MIME-Version: 1.0
Message-Id: <200810282333.49881.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.116.133.247
Subject: FYI: Openmoko merge status
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
X-List-Received-Date: Wed, 29 Oct 2008 11:03:40 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey,

for the people that wonder how far the Om tree is still away from OE:
	- A couple of misc fixes as not yet merged (tzdata, start scripts, pushd => 
cd, spelling errors, compile fixes....)

	- A couple of changes to not listen to tcp ports

	- Fixing the insanity people did to PV is not merged yet

	- SRCREV => SRCPV needs discussion

	- the package_opk/rootfs_opk are not there

	- Qtopia 4.3 is unlikely to be proposed to be merged, Qtopia4.4 looks more 
promising (in regard to the buildsystem compile options)

I will continue to merge the "no-brainer's", will send patches for the things 
I believe could deserve a discussion.

One funny thing is diverting PRs. In order to merge OE=>OM we need to bump the 
PR/PE of some packages and I would like to do this in the OE tree. I wonder if 
we have some kind of policy for that.

my diff of things to look at is down to 11.000 lines.

z.


