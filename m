Received: from [138.38.0.38] (helo=senna.bath.ac.uk)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <S.G.Pickering@bath.ac.uk>) id 1JKL8W-0002sl-Tl
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2008 23:10:29 +0100
Received: from leatherhead.bath.ac.uk ([138.38.0.98])
	by senna.bath.ac.uk with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)
	(envelope-from <S.G.Pickering@bath.ac.uk>) id 1JKL8f-000306-E1
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2008 22:10:37 +0000
Received: from www by leatherhead.bath.ac.uk with local id 1JKL8d-0006zS-Lh
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2008 22:10:35 +0000
Received: from host-84-13-249-232.opaltelecom.net.249.13.84.in-addr.arpa
	(host-84-13-249-232.opaltelecom.net.249.13.84.in-addr.arpa
	[84.13.249.232])
	by webmail.bath.ac.uk (Horde MIME library) with HTTP; Wed, 30 Jan 2008
	22:10:35 +0000
Message-ID: <20080130221035.4a4dh8n7dwk88gwc@webmail.bath.ac.uk>
Date: Wed, 30 Jan 2008 22:10:35 +0000
From: Simon Pickering <S.G.Pickering@bath.ac.uk>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.1.5)
X-BUCS: enpsgp
X-Scanner: 734e1550494ffbeeacd25fa63017588e02a05319
Subject: Missing OE.mtn snapshots and old Monotone version recommended in	wiki
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
X-List-Received-Date: Wed, 30 Jan 2008 22:10:29 -0000
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

I was just looking for a Monotone 0.32 snapshot and note that the wiki  
(http://www.openembedded.org/wiki/GettingStarted) still lists 0.32 as  
the minimum version to have (but the snapshot also listed in the wiki   
http://www.openembedded.org/snapshots/OE.mtn.bz2 is for a later  
version of monotone).

Looking on the http://openembedded.org/snapshots/ page there are a few  
0-byte sized snapshots, one of which is for Monotone 0.32. Not sure if  
this is the desired result.

In any case I'm going to update Monotone, but hrw suggested I point it  
out to the list.

Cheers,


Simon


