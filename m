Received: from hd5b91d02.k46641.sta.perspektivbredband.net ([213.185.29.2]
	helo=fg-dc1.flatfrog.local) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <orjan.friberg@flatfrog.com>) id 1QeOiq-0006JI-Ls
	for Openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 11:48:44 +0200
Received: from [192.168.123.162] (192.168.123.162) by fg-dc1.flatfrog.local
	(192.168.123.3) with Microsoft SMTP Server id 8.3.83.0; Wed, 6 Jul 2011
	11:43:47 +0200
Message-ID: <4E142E2F.6040101@flatfrog.com>
Date: Wed, 6 Jul 2011 11:43:11 +0200
From: Orjan Friberg <of@flatfrog.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.18) Gecko/20110616 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <Openembedded-devel@lists.openembedded.org>
Received-SPF: None (fg-dc1.flatfrog.local: of@flatfrog.com does not
	designate permitted sender hosts)
X-TM-AS-Product-Ver: SMEX-8.6.0.1168-6.500.1024-18242.004
X-TM-AS-Result: No-5.593500-8.000000-31
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
Subject: Discouraged kernels 2.6.35+?
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
X-List-Received-Date: Wed, 06 Jul 2011 09:48:44 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

We're looking at upgrading our BeagleBoard-derived board to 2.6.35+. 
Out of the kernels available where COMPATIBLE_MACHINE=beagleboard, is 
there any we should avoid?  (The ones available are .35, .37, .38, and .39.)

I'm thinking if there was an aborted porting attempt at some stage, or 
if a kernel was ported but never saw any actual use.


Also, on the 2011.03-maintenance branch, are all kernels valid or should 
we stick to the default kernel (.32)?

Thanks,
Orjan

-- 
Orjan Friberg
FlatFrog Laboratories AB


