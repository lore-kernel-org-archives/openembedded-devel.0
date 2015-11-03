Return-Path: <henning@itconsulting-heinold.de>
X-Greylist: delayed 440 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 03 Nov 2015 12:30:49 UTC
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id CBFE975E2D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Nov 2015 12:30:49 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 4744AD4114D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Nov 2015 13:23:27 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 8E087D40375
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Nov 2015 13:23:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Nov 2015 13:23:26 +0100 (CET)
Date: Tue, 3 Nov 2015 13:23:21 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151103122312.GA18881@mail.itconsulting-heinold.de>
References: <AE55B37B-BC8F-4516-82BC-B2B1DE341859@gmail.com>
MIME-Version: 1.0
In-Reply-To: <AE55B37B-BC8F-4516-82BC-B2B1DE341859@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [meta-java][PATCH] openjdk-8: add recipes for openjdk-8 and openjre-8
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
X-List-Received-Date: Tue, 03 Nov 2015 12:30:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

does the java8-native build do not need any javac? One goal was to build
all the stuff from scratch without the need to install any java compiler on
the host.

Bye Henning

