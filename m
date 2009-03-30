Received: from [85.199.173.110] (helo=mx51.mymxserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hs4233@mail.mn-solutions.de>) id 1LoDIC-0008MB-Ap
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 10:56:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by localhost.mx51.mymxserver.com (Postfix) with ESMTP id 7199014800B;
	Mon, 30 Mar 2009 10:54:23 +0200 (CEST)
X-Virus-Scanned: by Mittwald Mailscanner
Received: from mx51.mymxserver.com ([127.0.0.1])
	by localhost (mx51.mymxserver.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KKz93J1zNXha; Mon, 30 Mar 2009 10:54:23 +0200 (CEST)
Received: from lin01.mn-solutions.de (pD95F9863.dip0.t-ipconnect.de
	[217.95.152.99])
	by mx51.mymxserver.com (Postfix) with ESMTP id CC593148075;
	Mon, 30 Mar 2009 10:54:20 +0200 (CEST)
Received: by lin01.mn-solutions.de (Postfix, from userid 116)
	id 466511E0122; Mon, 30 Mar 2009 10:54:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	lin01.mn-logistik.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
Received: from mnz66.mn-solutions.de (mnz66.mn-solutions.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id EF51B1E0100;
	Mon, 30 Mar 2009 10:54:16 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Mar 2009 09:53:34 +0100
User-Agent: KMail/1.9.7
References: <20090328211530.7700adb1@mail.villafam.com>
In-Reply-To: <20090328211530.7700adb1@mail.villafam.com>
MIME-Version: 1.0
Message-Id: <200903301053.34937.hs4233@mail.mn-solutions.de>
Cc: openembedded-devel@openembedded.org
Subject: Re: TinyLogin
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
X-List-Received-Date: Mon, 30 Mar 2009 08:56:28 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> recipes/tinylogin/tinylogin_1.4.bb  needs to be updated.

And maybe it should be deprecated as well. With Busybox 1.13.3 
you won't need TinyLogin at all.


