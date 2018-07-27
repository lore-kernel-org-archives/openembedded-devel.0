Return-Path: <prvs=7398ca745=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id DDE2F78CAB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 07:31:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,408,1526335200"; d="scan'208";a="11550734"
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <6fd9a66d-8da9-0a82-aee8-0f1b0589e974@skidata.com>
Date: Fri, 27 Jul 2018 09:31:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java] merged master-next to master
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
X-List-Received-Date: Fri, 27 Jul 2018 07:31:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: de-AT
Content-Transfer-Encoding: 8bit

Hi,
this is a note to let you know that I've just merged the following 
patches from master-next to the master branch of the meta-java 
repository at git://git.yoctoproject.org/meta-java.

If any of them should be backported to any stable branches please get in
contact with us by replying to this email. Thanks.


André Draszik (7):
       layer.conf: add ca-certificates-java to SIGGEN_EXCLUDERECIPES_A...
       ca-certificates-java: add recipe to generate trustStore
       openjdk-8: give downloaded files a more descriptive name
       docs: add bootstrap-flow.txt
       libecj-bootstrap-native: simplify build
       set SUMMARY instead of DESCRIPTION
       classpath: harmonise -native and -initial-native recipes

Mike Crowe (1):
       jdepend: Retrieve source from Git rather than tarball

Richard Leitner (5):
       openjdk-8: fix build for gcc8.x
       ca-certificates-java: update SRC_URI
       oeqa: runtime: add java & javac testcases
       images/classes: add open{jdk,jre}-{7,8} test
       README: add "Testing" section

Wenlin Kang (2):
       openjdk-8: remove debuglink
       openjdk-8: remove redunant FILES_${PN}-dbg

fan.xin (1):
       openjdk-8: correct the typo mistake


If you have any questions, please let me know.
regards;Richard.L

