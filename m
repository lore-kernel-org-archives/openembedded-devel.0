Return-Path: <stevend@limotec.be>
Received: from mailrelay112.isp.belgacom.be (mailrelay112.isp.belgacom.be
	[195.238.20.139])
	by mail.openembedded.org (Postfix) with ESMTP id A4CBF72207
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 May 2015 14:39:36 +0000 (UTC)
X-Cloudmark-SP-Filtered: true
X-Cloudmark-SP-Result: v=1.1 cv=U3bOsIs4jTLKnNjizNqmwgH4x/ZVWD6r1e7q5IgUJPc=
	c=1 sm=2
	a=IkcTkHD0fZMA:10 a=VAS9EktPU-wGvt9GZ4QA:9 a=QEXdDO2ut3YA:10
	a=DYtS7lmHX44A:10 a=_qu8OrzqZu8A:10
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2BSCwD++FlV/3wytdVcgj+FIcsrAQEBAQEBhVeBCwImAokdBqRDj1ekSoEhjzuCUoFFBbRrI2FmDIIngzMBAQE
Received: from 124.50-181-213.adsl-static.isp.belgacom.be (HELO
	[123.123.100.26]) ([213.181.50.124])
	by relay.skynet.be with ESMTP; 18 May 2015 16:39:36 +0200
Message-ID: <1431959981.7345.2.camel@pco026>
From: Steven Descheemaeker <stevend@limotec.be>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 May 2015 16:39:41 +0200
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
Subject: CUPS ppd drivers
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
X-List-Received-Date: Mon, 18 May 2015 14:39:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello,

I'm trying to add printer support to my embedded board. I'm able to
build cups but there aren't any driver packages. 

Are there any recent packages for printer drivers? I already tried to
build gutenprint/foomatic myself but I'm relatively new to yocto so I'm
not that good in writing recipes my own. 

Anyone can help me out with this ?
-- 
Steven Descheemaeker
Software developer
Limotec BVBA
Bosstraat 21
8570 Vichte


