Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dp@xora.org.uk>) id 1IT2FO-0003st-80
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2007 23:17:14 +0200
Received: from xora.org.uk ([::ffff:85.210.12.205])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,128bits,AES128-SHA)
	by xora.org.uk with esmtp; Wed, 05 Sep 2007 22:14:43 +0100
	id 0006400A.46DF1C44.0000043D
Date: Wed, 5 Sep 2007 22:14:37 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070905211437.GA10460@cimmeria>
References: <20070904202957.GD1429@dodger.lab.datenfreihafen.org>
	<1189011486.7849.35.camel@localhost.localdomain>
	<46DEE9E3.4080206@student.utwente.nl>
	<1434447296.20070905205215@vanille-media.de>
	<1189021941.7849.46.camel@localhost.localdomain>
Mime-Version: 1.0
In-Reply-To: <1189021941.7849.46.camel@localhost.localdomain>
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: Re: [RFC] How to handle external kernel patches in oe the	right way?
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
X-List-Received-Date: Wed, 05 Sep 2007 21:17:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 05, 2007 at 08:52:21PM +0100, Richard Purdie wrote:
> I'm afraid I'm with Mickey here. I don't like the way this "prepatching"
> works and I think its pretty ugly but I can understand why people are
> doing it. I'd like to see a better solution but until then what they're
> doing allows them to develop effectively which is what we're supposed to
> be about.
> 
Maybe if I get some free time around october I might suggest enhancing
the fetcher/patcher so that any URL can have a

http://blah.com/patches.gz;patchseries=1
svn://wibble.com/branchs/smoo/;patchseries=1

And it does the right thing.

Or am I going backwards?

Graeme



