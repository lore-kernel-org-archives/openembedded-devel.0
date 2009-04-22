Received: from [85.199.173.110] (helo=mx51.mymxserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hs4233@mail.mn-solutions.de>) id 1LwWCd-0004Ih-Nj
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 08:45:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by localhost.mx51.mymxserver.com (Postfix) with ESMTP id 9FB443A010;
	Wed, 22 Apr 2009 08:40:34 +0200 (CEST)
X-Virus-Scanned: by Mittwald Mailscanner
Received: from mx51.mymxserver.com ([127.0.0.1])
	by localhost (mx51.mymxserver.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FlzlXdpTEc-Q; Wed, 22 Apr 2009 08:40:34 +0200 (CEST)
Received: from lin01.mn-solutions.de (pD95F9354.dip0.t-ipconnect.de
	[217.95.147.84])
	by mx51.mymxserver.com (Postfix) with ESMTP id 2FCD63A017;
	Wed, 22 Apr 2009 08:40:34 +0200 (CEST)
Received: by lin01.mn-solutions.de (Postfix, from userid 116)
	id A847A1E0036; Wed, 22 Apr 2009 08:40:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb3 (2006-10-05) on 
	lin01.mn-logistik.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb3
Received: from mnz66.mn-solutions.de (mnz66.mn-solutions.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id 563201E0010;
	Wed, 22 Apr 2009 08:40:25 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Apr 2009 08:40:06 +0200
User-Agent: KMail/1.9.7
References: <1238144638-7541-1-git-send-email-khimov@altell.ru>
In-Reply-To: <1238144638-7541-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
Message-Id: <200904220840.06152.hs4233@mail.mn-solutions.de>
Subject: Re: [PATCH] busybox: update appletlib dependency patch
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
X-List-Received-Date: Wed, 22 Apr 2009 06:45:03 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> The reason is that previous version introduced a race between
> applets make processes spawned from top-level Makefile and
> from libbb Makefile.

Just a question: do you (we?) make sure that such patches end up 
upstream?


