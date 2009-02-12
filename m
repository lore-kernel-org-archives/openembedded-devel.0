Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1LXkMe-0006ZD-JO; Thu, 12 Feb 2009 23:49:00 +0100
Received: from 79-79-208-205.dynamic.dsl.as9105.com ([79.79.208.205]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1LXkLG-0004Ln-C4; Thu, 12 Feb 2009 22:47:36 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gn24o9$s96$1@ger.gmane.org>
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-4-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-5-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-6-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-7-git-send-email-otavio@ossystems.com.br>
	<1234470448.4890.379.camel@lenovo.internal.reciva.com>
	<gn24o9$s96$1@ger.gmane.org>
Date: Thu, 12 Feb 2009 22:47:26 +0000
Message-Id: <1234478846.4890.409.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 6/6] flash-plugin: add 10.0.12.36
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
X-List-Received-Date: Thu, 12 Feb 2009 22:49:01 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-02-12 at 22:36 +0100, Koen Kooi wrote:
> On 12-02-09 21:27, Phil Blundell wrote:
> > I guess there might be an argument for distributing a
> > dummy-server-fonts package that just ships one font and aliases
> > everything else to it for the purpose of keeping legacy applications
> > happy.
> 
> The xorg-minimal-fonts tries to do that.

Yeah, sort of like xorg-minimal-fonts but more so.  That package seems
to ship rather more than one font, including some slightly
fringe-looking ISO8859-xx encoding variants, giving you about 500k of
data which seems like rather a lot if it's just going to be a
placeholder.  Also, its fonts.alias file is rather more selective than I
was thinking of and I'm not sure it would handle the specific cases that
are mentioned in the flash-plugin package.

p.




