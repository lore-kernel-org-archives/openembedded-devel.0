Return-Path: <romain.bazile@ubiant.com>
X-Greylist: delayed 4715 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 19 May 2017 16:26:06 UTC
Received: from 9.mo177.mail-out.ovh.net (9.mo177.mail-out.ovh.net
	[46.105.72.238])
	by mail.openembedded.org (Postfix) with ESMTP id E3EC9780BA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 16:26:06 +0000 (UTC)
Received: from player779.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id 8B67E56ECF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 17:07:31 +0200 (CEST)
Received: from [192.168.101.3] (LMontsouris-657-1-193-111.w90-63.abo.wanadoo.fr
	[90.63.225.111]) (Authenticated sender: romain.bazile@ubiant.com)
	by player779.ha.ovh.net (Postfix) with ESMTPSA id 456117C0079
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 17:07:31 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
From: Romain Bazile <romain.bazile@ubiant.com>
Organization: Ubiant
Message-ID: <6b90bfd5-3dd1-572c-9a63-2f9399737824@ubiant.com>
Date: Fri, 19 May 2017 17:07:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 734931164952091464
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 50
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrvddugdekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecuogetfeejfedqtdegucdlhedtmd
Subject: [meta-java] rxtx fails to build because of upstream website dead
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
X-List-Received-Date: Fri, 19 May 2017 16:26:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB-large

Hello everyone,


The source website ( http://rxtx.qbang.org/pub/rxtx/rxtx-2.2pre2.zip ) 
for librxtx (in recipes-extended/rxtx/rxtx_2.2.0.bb ) is down. Again.

Due to the chronic instability of this website, would it make sense to 
include the source file directly into the meta-java layer as a zip file?

I don't know about best practices surrounding this, I kindly apologize 
if it's strictly forbidden! Otherwise, I'm happy to submit a PR 
including the file and the necessary changes to the recipes (in 
concerned branches).


Sincerely,

-- 

Romain Bazile
Hardware R&D Engineer
www.ubiant.com


