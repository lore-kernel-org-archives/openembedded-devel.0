Received: from [209.59.181.203] (helo=host2.dedicated4less.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <b@bigbob.org.uk>) id 1GlP3g-0001PF-Vj
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Nov 2006 13:12:33 +0100
Received: from cpanel by host2.dedicated4less.com with local (Exim 4.52)
	id 1GlP1I-0002bk-75 for openembedded-devel@lists.openembedded.org;
	Sat, 18 Nov 2006 07:09:41 -0500
Received: from 84.12.180.149 ([84.12.180.149]) by bigbob.org.uk (Horde MIME
	library) with HTTP; Sat, 18 Nov 2006 07:09:41 -0500
Message-ID: <20061118070941.lg9b2be6g13484w4@bigbob.org.uk>
Date: Sat, 18 Nov 2006 07:09:41 -0500
From: Rob Neild <b@bigbob.org.uk>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.1.3)
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - host2.dedicated4less.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [32001 501] / [47 12]
X-AntiAbuse: Sender Address Domain - bigbob.org.uk
X-Source: /usr/local/cpanel/3rdparty/bin/php
X-Source-Args: /usr/local/cpanel/3rdparty/bin/php
	/usr/local/cpanel/base/horde/imp/compose.php 
X-Source-Dir: :/base/horde/imp
Subject: Which head ?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Nov 2006 12:12:33 -0000
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit



rob@rob-server:~/openembedded$ ../monotone-0.31/mtn --db=OE.mtn pull  
monotone.openembedded.org org.openembedded.dev
mtn: doing anonymous pull; use -kKEYNAME if you need authentication
mtn: connecting to monotone.openembedded.org
mtn: finding items to synchronize:
mtn: certificates | keys | revisions
mtn:       30,065 |   38 |     9,918
mtn:  bytes in | bytes out | certs in | revs in
mtn:     1.3 k |     1.4 k |      0/0 |     0/0
mtn: successful exchange with monotone.openembedded.org


rob@rob-server:~/openembedded$ ../monotone-0.31/mtn --db=OE.mtn  
checkout --branch=org.openembedded.dev
mtn: branch org.openembedded.dev has multiple heads:
mtn:   0c958ec238b24c796d57fb29b8683551a9ed05a5 hrw@openembedded.org  
2006-11-18T09:48:40
mtn:   dcbd942b827e66bb27a6282eae5ee1e2f4c927e3 koen@openembedded.org  
2006-11-18T10:10:57
mtn: choose one with 'mtn checkout -r<id>'
mtn: error: branch org.openembedded.dev has multiple heads
rob@rob-server:~/openembedded$

Rob



