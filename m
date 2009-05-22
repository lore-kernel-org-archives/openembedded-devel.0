Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1M7cSz-0002pN-3f
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 May 2009 23:39:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id F33114BC552
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2009 17:32:05 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28170-03 for <openembedded-devel@lists.openembedded.org>; 
	Fri, 22 May 2009 17:32:05 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id CDD974BC430
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2009 17:32:05 -0400 (EDT)
Message-ID: <4A1719D5.40605@cbnco.com>
Date: Fri, 22 May 2009 17:32:05 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <DEB73D04-3490-41E1-8C56-C41822C040D9@mvista.com>	<4A170CA9.10402@cbnco.com>
	<46AB4A4E-10FB-4BD2-8E6B-D6517A502FE8@mvista.com>
In-Reply-To: <46AB4A4E-10FB-4BD2-8E6B-D6517A502FE8@mvista.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: amend-recipes.inc
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
X-List-Received-Date: Fri, 22 May 2009 21:39:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Christopher Larson wrote:

> I expect for now the best bet is to fix those base_set_filespath usages 
> :)  I'll see about fixing some this weekend, if I have the time.

OK, thanks for the explanation. It looks like the default FILESPATHPKG 
already covers most of the cases for recipes that are using 
base_set_filespath(). I guess that's probably by design. :)

Mike


