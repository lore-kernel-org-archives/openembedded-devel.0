Return-Path: <olof.johansson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 9AA72606A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 16:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id DFB822E621;
	Thu, 16 Mar 2017 17:19:55 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id S55--liB9D32; Thu, 16 Mar 2017 17:19:55 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 005F42E61F;
	Thu, 16 Mar 2017 17:19:55 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E47EE1E0B5;
	Thu, 16 Mar 2017 17:19:54 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D95CC1E0B4;
	Thu, 16 Mar 2017 17:19:54 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 16 Mar 2017 17:19:54 +0100 (CET)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by thoth.se.axis.com (Postfix) with ESMTP id CD32FEBA;
	Thu, 16 Mar 2017 17:19:54 +0100 (CET)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id 4C33E9C09F; Thu, 16 Mar 2017 17:19:56 +0100 (CET)
Date: Thu, 16 Mar 2017 17:19:56 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170316161955.GM1178@axis.com>
References: <1484904671-9257-1-git-send-email-olofjn@axis.com>
	<20170207125411.GQ31993@axis.com>
MIME-Version: 1.0
In-Reply-To: <20170207125411.GQ31993@axis.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
Subject: Re: [meta-webserver][krogoth][PATCH] apache2: always use the archive.apache.org to ensure older releases are always available
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
X-List-Received-Date: Thu, 16 Mar 2017 16:19:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> On 17-01-20 10:31 +0100, Olof Johansson wrote:
> > From: Derek Straka <derek@asterius.io>
> > 
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > Signed-off-by: Olof Johansson <olofjn@axis.com>
> > ---
> >  meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb | 2 +-
> >  meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb        | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)

On 17-02-07 13:54 +0100, Olof Johansson wrote:
> Ping

Ping again? :) Both concering this patch and the corresponding
backport for morty.

-- 
olofjn

