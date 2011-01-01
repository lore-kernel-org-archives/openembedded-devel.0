Received: from host4.kei.pl ([94.152.8.4] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1PZ6mH-0003rg-0g
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Jan 2011 20:06:09 +0100
Received: (qmail 20888 invoked by uid 2404007); 1 Jan 2011 19:05:48 -0000
X-clamdmail: clamdmail 0.18a
Received: from apn-77-112-174-6.dynamic.gprs.plus.pl (HELO ?77.112.174.6?)
	(marcin@juszkiewicz.com.pl@77.112.174.6)
	by host4.kei.pl with ESMTPA; 1 Jan 2011 19:05:46 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: bitbake-dev <bitbake-dev@lists.berlios.de>
X-Mailer: Modest 3.2
References: <1293763348.17519.11220.camel@rex>
In-Reply-To: <1293763348.17519.11220.camel@rex>
Date: Sat, 01 Jan 2011 20:05:49 +0100
Message-Id: <1293908749.2293.6.camel@n900>
Mime-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [Bitbake-dev] Bitbake Architecture, Roadmap, Maintainers and	the future
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
X-List-Received-Date: Sat, 01 Jan 2011 19:06:09 -0000
Content-Type: text/plain; charset=utf-8
Content-ID: <1293908749.2293.5.camel@n900>
Content-Transfer-Encoding: 7bit


> There is a little friction around bitbake at the moment. I think after a
> discussion I had with Chris earlier on some things are clearer and its
> probably good to summarise how things stand.

Thank You Richard for mail.
 
> Rightly or wrongly, maintainership of a project like bitbake is as much
> about socialising changes and getting discussion and agreement on them
> as it is about developing code. It eats a lot of time, you don't get
> much thanks for it but it does make life smoother in the long run. 

> I consider myself a maintainer of bitbake

So do I - for me you are Bitbake maintainer. And I am fine with having Chris and you as maintainers.

> So, bitbake in the future? At present it has bits on berlios (releases,
> mailing list and a web manpage) and the git source SCM on
> git.openembedded.org. Are we happy with those locations? I find it a bit
> confusing...

I think that we should replace berlios with redirects to OE infrastructure. Tarballs should be available for download for any 1.8.0+ releases (older ones should not be in use now and can be generated from cgit). Manual available as separate website. I prefer to not host it at Yocto.
 
> There are a bunch of people who can commit to bitbake, some inactive,
> some active in different areas with different priorities. I think mine
> are clear above, I'd appreciate others to make their objectives clear so
> everyone understand people's positions and what people plan and don't
> plan to do.

I still have r/w to bitbake svn, no idea about git tree. There is no need for it so please remove my write access. If there will be a need for it I will send patches + pull request to proper mailing list.


