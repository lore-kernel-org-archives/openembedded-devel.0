Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1L0Bjq-00016m-M5
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Nov 2008 10:10:16 +0100
Received: from 89-168-188-212.dynamic.dsl.as9105.com ([89.168.188.212]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1L0Bhv-0000ox-Sb
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Nov 2008 09:08:16 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1226478974.7474.1.camel@aquilonia>
References: <1226054458.7175.3.camel@aquilonia>
	<87mygarid7.fsf@neumann.lab.ossystems.com.br>
	<1226256825.6785.0.camel@aquilonia>
	<874p2d93tg.fsf@neumann.lab.ossystems.com.br>
	<1226478974.7474.1.camel@aquilonia>
Date: Wed, 12 Nov 2008 09:08:14 +0000
Message-Id: <1226480894.4235.747.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: Xorg X11R7.4 updates
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
X-List-Received-Date: Wed, 12 Nov 2008 09:10:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-11-12 at 08:36 +0000, Graeme Gregory wrote:
> Ah excellent, but I'm not sure about your patch, I was trying to keep
> the pref-xorg-7.4 file to only list 7.4 release components which mesa is
> not one of.

Sounds like you should fix support for versioned DEPENDS in bitbake. :-}

p.




