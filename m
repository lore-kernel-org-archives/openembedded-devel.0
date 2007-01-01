Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1H1Pso-0005MV-Ax
	for openembedded-devel@openembedded.org; Mon, 01 Jan 2007 17:19:30 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l01GIVJo008013
	for <openembedded-devel@openembedded.org>; Mon, 1 Jan 2007 16:18:31 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07967-01 for <openembedded-devel@openembedded.org>;
	Mon,  1 Jan 2007 16:18:29 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l01GISA8008006
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 1 Jan 2007 16:18:29 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <enba1v$ldr$1@sea.gmane.org>
References: <enba1v$ldr$1@sea.gmane.org>
Date: Mon, 01 Jan 2007 16:18:29 +0000
Message-Id: <1167668309.5601.31.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Reverse-engineering SD specs for collie
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
X-List-Received-Date: Mon, 01 Jan 2007 16:19:30 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Mon, 2007-01-01 at 16:40 +0100, Rolf Leggewie wrote:
> I just stumbled across 
> http://cambuca.ldhs.cetuc.puc-rio.br/~miguel/zaurus/ (found it mentioned 
> in the OZ wiki) and http://josejx.net/collie/.  They are dealing with 
> reverse-engineering the SD slot on the collie.  I was wondering if 
> developpers are aware of this and if this could potentially mean that 
> collie has a future in angstrom as well.

It is known about. We need someone with the time to develop a 2.6 driver
based on this information and asking appropriate questions. Its a time
problem :-/.

Cheers,

Richard



