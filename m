Return-Path: <jack.mitchell@eumx.net>
X-Greylist: delayed 2319 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 18 May 2016 10:15:08 UTC
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 414646014F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2016 10:15:08 +0000 (UTC)
To: openembedded-devel@lists.openembedded.org
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <d1c192ed-565f-c0f8-fe1d-9be335743e71@eumx.net>
Date: Wed, 18 May 2016 10:36:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
Subject: [meta-virt] google code docker hg dependancies 404
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2016 10:15:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I'm hitting 404 errors with a couple of the docker dependancies. Can we 
host these somewhere or does anyone know of alternative places these can 
be obtained? I looked for the go-sqlite package but it seems to have 
been out of development for some time.

/home/jack/projects/meta-virt.git/recipes-devtools/go/go-net_hg.bb, do_fetch
/home/jack/projects/meta-virt.git/recipes-devtools/go/go-sqlite_hg.bb, 
do_fetch

An alternative would be to possible host someones cached downloads in 
the alternative mirrors?

Cheers,
Jack.

