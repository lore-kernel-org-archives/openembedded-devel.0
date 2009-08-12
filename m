Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MbAjC-0002lS-Oj for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 12:06:45 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MbATJ-00044H-K8 for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 09:50:17 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2009 09:50:17 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2009 09:50:17 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 12 Aug 2009 11:50:02 +0200
Message-ID: <h5u38c$htr$1@ger.gmane.org>
References: <4A826FF3.9030501@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.3pre) Gecko/20090730 Shredder/3.0b4pre
In-Reply-To: <4A826FF3.9030501@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: why does glibc_2.9.bb use glibc-ports-2.7?
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
X-List-Received-Date: Wed, 12 Aug 2009 10:06:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12-08-09 09:32, Graham Gower wrote:
> This combination of glibc-2.9 with glibc-ports-2.7 fails to build on
> mipsel.
>
> I assume there is either a problem with the glibc-ports-2.9 on arm, or the
> recipe was simply copied from glibc_2.7.bb without noticing that the ports
> version was hardcoded.

Actually there was no 2.9 ports release on the gnu mirror when I did 
that recipe. Feel free to fix :)

regards,

Koen



