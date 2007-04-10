Received: from [212.60.202.195] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1HbDQc-0001hJ-Bb
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2007 12:18:22 +0200
Received: from [212.60.202.194] (helo=[192.168.2.131])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50) id 1HbDjq-00024j-QP
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2007 12:38:14 +0200
Message-ID: <461B645C.5040307@kernelconcepts.de>
Date: Tue, 10 Apr 2007 12:18:04 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <46176E51.2030608@dominion.kabel.utwente.nl>
	<CD2A5546-06FC-414A-9C74-FB640EBFC4A5@selfish.org>
In-Reply-To: <CD2A5546-06FC-414A-9C74-FB640EBFC4A5@selfish.org>
X-Enigmail-Version: 0.94.0.0
Subject: Re: [RFC] rm_work
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
X-List-Received-Date: Tue, 10 Apr 2007 10:18:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Holger Freyther schrieb:
> how many recipes still break with rm_work, is there a documentation  
> which tasks to add and link to unbreak rm_work (if it breaks). I'm  
> still uncertain if the cleaning should be done by bitbake itself.

I'm using it for some time now - the only trouble I ran into were some breaking
kernel packages. But if there are still some broken remaining these would be
easy to fix.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


