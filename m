Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1L5427-0003NK-D8
	for openembedded-devel@openembedded.org; Tue, 25 Nov 2008 20:57:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id mAPJsHt7024079
	for <openembedded-devel@openembedded.org>; Tue, 25 Nov 2008 19:54:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23727-10 for <openembedded-devel@openembedded.org>;
	Tue, 25 Nov 2008 19:54:13 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id mAPJsDS5024073
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 25 Nov 2008 19:54:13 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <gghjh1$dg1$1@ger.gmane.org>
References: <gghjh1$dg1$1@ger.gmane.org>
Date: Tue, 25 Nov 2008 19:54:14 +0000
Message-Id: <1227642854.5377.17.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] LICENSE fields and packages
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
X-List-Received-Date: Tue, 25 Nov 2008 19:57:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Tue, 2008-11-25 at 20:26 +0100, Koen Kooi wrote:
> Jason Kridner pointed out that we don't actually put the license in the 
> resulting packages, making it hard for finding the license if you only 
> have a bunch or packages.
> 
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=e35d1ffad1553f259b084578992f15d10f590f98
> 
> Now the RFC part:
> 
> Allow URLs in the LICENSE field for lesser know licenses and/or 
> click-through licenses.
> 
> Related to that: a class that would take a text file and generate a 
> preinsts that shows the textfile and prompts to accept it (or not) would 
> be awesome as well.
> 
> Back to the point: what do you think of allowing URLs in the LICENSE field?

I don't like the idea of urls in the field itself. I would however love
to see a class file with a list of valid field entries and corresponding
urls to the appropriate licence along with other information like
distributability. In due course I'd like to see that being mandatory for
new .bb files.

Cheers,

Richard



