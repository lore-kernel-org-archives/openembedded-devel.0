Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 65C8079022
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 07:47:09 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 52B452E62375;
	Tue, 21 Aug 2018 09:47:09 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D19CE2E62374;
	Tue, 21 Aug 2018 09:47:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.itconsulting-heinold.de (unknown [178.19.210.209])
	by mail.familie-heinold.de (Postfix) with ESMTPSA;
	Tue, 21 Aug 2018 09:47:08 +0200 (CEST)
Date: Tue, 21 Aug 2018 09:47:01 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <20180821074700.GC21359@mail.itconsulting-heinold.de>
References: <20180820211443.32757-1-richard.leitner@skidata.com>
	<20180820211615.404-1-richard.leitner@skidata.com>
MIME-Version: 1.0
In-Reply-To: <20180820211615.404-1-richard.leitner@skidata.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH 5/7] openjdk-7: remove version dependent stuff from openjdk-common
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
X-List-Received-Date: Tue, 21 Aug 2018 07:47:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 20, 2018 at 11:16:13PM +0200, Richard Leitner wrote:
> openjdk-common.inc should not contain any OpenJDK-7 dependet stuff.
> Therefore move it to the openjdk-7-common.inc.

Hi,

besides the typo, how about the following phrase

"Move the OpenJDK-7 specific parts from openjdk-common.inc to
openjdk-7-common.inc."

Bye Henning

