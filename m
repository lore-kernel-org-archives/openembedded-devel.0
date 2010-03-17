Received: from honeysuckle.london.02.net ([87.194.255.144])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bluelightning@bluelightning.org>) id 1Ns2uK-0000Vz-Q7
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 00:44:14 +0100
Received: from shodan.localnet (93.96.131.185) by honeysuckle.london.02.net
	(8.5.016.1) id 4A23EDE6083A18CB; Wed, 17 Mar 2010 23:40:04 +0000
From: Paul Eggleton <bluelightning@bluelightning.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Mar 2010 23:40:02 +0000
User-Agent: KMail/1.12.4 (Linux/2.6.31-15-generic; KDE/4.3.4; i686; ; )
References: <f275a9df1003090417s3ea8bcf5y3b547ce7303d5e32@mail.gmail.com>
	<25809.193.195.44.178.1268139137.squirrel@webmail12.pair.com>
	<f275a9df1003090620i4abb58b9ye07151c9b27f5533@mail.gmail.com>
In-Reply-To: <f275a9df1003090620i4abb58b9ye07151c9b27f5533@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201003172340.02795.bluelightning@bluelightning.org>
X-SA-Exim-Connect-IP: 87.194.255.144
X-SA-Exim-Mail-From: bluelightning@bluelightning.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 'bitbake opie-image' problem
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
X-List-Received-Date: Wed, 17 Mar 2010 23:44:14 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi Jaison,

If you update your git tree, opie-packagemanager should now build correctly. I 
didn't have a chance to test if it actually worked at runtime though, please 
let me know (privately) if it does or doesn't.

Cheers,
Paul


