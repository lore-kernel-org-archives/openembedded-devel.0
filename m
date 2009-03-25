Received: from [85.199.173.110] (helo=mx51.mymxserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hs4233@mail.mn-solutions.de>) id 1LmV7N-0000Nh-8v
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 16:34:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by localhost.mx51.mymxserver.com (Postfix) with ESMTP id 7A3274B004
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 16:32:38 +0100 (CET)
X-Virus-Scanned: by Mittwald Mailscanner
Received: from mx51.mymxserver.com ([127.0.0.1])
	by localhost (mx51.mymxserver.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b2Gp8sKW5i2M
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 16:32:38 +0100 (CET)
Received: from lin01.mn-solutions.de (pD95F9E0B.dip0.t-ipconnect.de
	[217.95.158.11])
	by mx51.mymxserver.com (Postfix) with ESMTP id 0D3394B010
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 16:32:37 +0100 (CET)
Received: by lin01.mn-solutions.de (Postfix, from userid 116)
	id 5B9231E0125; Wed, 25 Mar 2009 16:32:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	lin01.mn-logistik.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
Received: from mnz66.mn-solutions.de (mnz66.mn-solutions.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id 73F2F1E0124
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 16:32:32 +0100 (CET)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Mar 2009 16:32:18 +0100
User-Agent: KMail/1.9.7
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
	<1237988215.5328.40.camel@dax.rpnet.com>
	<200903251516.44480.hs4233@mail.mn-solutions.de>
In-Reply-To: <200903251516.44480.hs4233@mail.mn-solutions.de>
MIME-Version: 1.0
Message-Id: <200903251632.18345.hs4233@mail.mn-solutions.de>
Subject: Re: Package Maintenance
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
X-List-Received-Date: Wed, 25 Mar 2009 15:34:13 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Uhh, I forgot to write that as an add-on I'd like to see the 
recipes for a category moved into it's own subdirectory.

That would make it easy to weed out lot's of uninteresting bb 
files by using a properly crafted BBFILES.


