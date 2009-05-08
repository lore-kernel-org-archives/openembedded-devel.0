Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <g.eismann@gmx.net>) id 1M2QtH-0000Kl-Qo
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 May 2009 16:17:31 +0200
Received: (qmail invoked by alias); 08 May 2009 14:11:16 -0000
Received: from 247.70.222.87.dynamic.jazztel.es (EHLO inferno.localnet)
	[87.222.70.247]
	by mail.gmx.net (mp062) with SMTP; 08 May 2009 16:11:16 +0200
X-Authenticated: #21729387
X-Provags-ID: V01U2FsdGVkX1+kikhqM5akIhIoxJi/WIdSO0cGb4C6Ys0HTgOU8y
	R7/YFXMD00+6Qn
From: "G. Eismann" <g.eismann@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 8 May 2009 16:11:14 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.28-11-generic; KDE/4.2.2; i686; ; )
References: <200905081536.58988.g.eismann@gmx.net>
In-Reply-To: <200905081536.58988.g.eismann@gmx.net>
MIME-Version: 1.0
Message-Id: <200905081611.14943.g.eismann@gmx.net>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.82,0.82
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: micro image with ssh server
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
X-List-Received-Date: Fri, 08 May 2009 14:17:31 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit


I have disabled udev so I can login via serial port.
Creating /dev/pts and mounting it ssh server works.

So I think is an udev problem. Running /etc/init.d/udev start does nothing.

Is udev working properly with micro dist or is it only my problem?


-- 
  - Eismann -

