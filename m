Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1H9JaX-0002yO-Cz
	for openembedded-devel@openembedded.org; Tue, 23 Jan 2007 12:13:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l0NBDGNs008500
	for <openembedded-devel@openembedded.org>; Tue, 23 Jan 2007 11:13:16 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08131-05 for <openembedded-devel@openembedded.org>;
	Tue, 23 Jan 2007 11:13:13 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l0NBDCKS008484
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 23 Jan 2007 11:13:12 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <45B5528F.3050108@whitby.id.au>
References: <45B40165.6000506@whitby.id.au>
	<45B4EDCD.1060609@dominion.kabel.utwente.nl>
	<45B50D16.8060001@whitby.id.au>
	<45B518A5.8000500@dominion.kabel.utwente.nl>
	<45B5528F.3050108@whitby.id.au>
Date: Tue, 23 Jan 2007 11:13:12 +0000
Message-Id: <1169550792.5845.8.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Deprecating ixp4xx, nslu2 in favour of endian-specific	machine settings (Was: RFC on MACHINE_ENDIAN)
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
X-List-Received-Date: Tue, 23 Jan 2007 11:13:18 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-01-23 at 10:40 +1030, Rod Whitby wrote:
> Last chance for objections .... commits will start in 6 hours.

For the record, no objections from me. After consideration, I think Koen
is right and two machines make sense in this case. Koen has had the
experience of trying this in practise which often helps! :)

Where possible I would like to see it using the siteinfo check so the
metadata is generic.

Cheers,

Richard



