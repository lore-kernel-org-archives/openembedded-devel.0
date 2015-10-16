Return-Path: <mail@webthatworks.it>
X-Greylist: delayed 351 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 16 Oct 2015 21:24:56 UTC
Received: from smtp206.alice.it (smtp206.alice.it [82.57.200.102])
	by mail.openembedded.org (Postfix) with ESMTP id 72F0B77163
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 21:24:56 +0000 (UTC)
Received: from caronte.home.webthatworks.it (87.8.144.45) by smtp206.alice.it
	(8.6.060.28)
	id 56139B8301E40DED for openembedded-devel@lists.openembedded.org;
	Fri, 16 Oct 2015 23:19:04 +0200
Received: from gloom.home.webthatworks.it (gloom.home.webthatworks.it
	[192.168.1.14])
	by caronte.home.webthatworks.it (Postfix) with ESMTP id 92EBA6FE0061
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 23:19:03 +0200 (CEST)
Received: from [IPv6:::1] (localhost [IPv6:::1])
	by gloom.home.webthatworks.it (Postfix) with ESMTP id 7CB4E5E0155
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 23:18:02 +0200 (CEST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: Ivan Sergio Borgonovo <mail@webthatworks.it>
Organization: http://www.WebThatWorks.it
Message-ID: <5621698A.9000504@webthatworks.it>
Date: Fri, 16 Oct 2015 23:18:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.3.0
MIME-Version: 1.0
Subject: making possible to bake meta-toolchain-qt5 without opengl
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
X-List-Received-Date: Fri, 16 Oct 2015 21:24:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I'm going to send my first patch to oe.
It will be mostly a request for comments.

I think I could "skip" less packages in RDEPENDS_${PN} but probably some 
dependencies in qt5 should be improved.

patch hopefully coming to the list soon... If I make no further mistakes 
with git.

thanks

-- 
Ivan Sergio Borgonovo
http://www.webthatworks.it


