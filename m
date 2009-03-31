Received: from [85.199.173.110] (helo=mx51.mymxserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hs4233@mail.mn-solutions.de>) id 1LoeBq-000093-VL
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Mar 2009 15:39:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by localhost.mx51.mymxserver.com (Postfix) with ESMTP id D877E3A010;
	Tue, 31 Mar 2009 15:37:30 +0200 (CEST)
X-Virus-Scanned: by Mittwald Mailscanner
Received: from mx51.mymxserver.com ([127.0.0.1])
	by localhost (mx51.mymxserver.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74iCuHhV0gPn; Tue, 31 Mar 2009 15:37:30 +0200 (CEST)
Received: from lin01.mn-solutions.de (pD95F9924.dip0.t-ipconnect.de
	[217.95.153.36])
	by mx51.mymxserver.com (Postfix) with ESMTP id 6C1543A006;
	Tue, 31 Mar 2009 15:37:30 +0200 (CEST)
Received: by lin01.mn-solutions.de (Postfix, from userid 116)
	id 0464D1E0122; Tue, 31 Mar 2009 15:37:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	lin01.mn-logistik.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
Received: from mnz66.mn-solutions.de (mnz66.mn-solutions.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id 96DB21E0100;
	Tue, 31 Mar 2009 15:37:26 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Mar 2009 15:36:37 +0200
User-Agent: KMail/1.9.7
References: <49D21128.30201@gmx.net>
In-Reply-To: <49D21128.30201@gmx.net>
MIME-Version: 1.0
Message-Id: <200903311536.37486.hs4233@mail.mn-solutions.de>
Subject: Re: ugly OE issue with RDEPENDS
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
X-List-Received-Date: Tue, 31 Mar 2009 13:39:43 -0000
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> RDEPENDS_classpath-tools = "java2-runtime".

One more comment after reading Koen's reply: maybe you name 
this "virtual/java2-runtime" ?

This has nothing to do with your problem, but just brings in some 
consistency. And maybe, if bitbake ever considers virtual 
packages different when it comes to runtime-dependencies, your 
problem might go away :-)


