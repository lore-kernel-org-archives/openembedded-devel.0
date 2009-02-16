Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LZBTt-0007Nn-88
	for openembedded-devel@openembedded.org; Mon, 16 Feb 2009 22:58:25 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LZBS3-0003WE-82
	for openembedded-devel@openembedded.org; Mon, 16 Feb 2009 21:56:31 +0000
Received: from p5483a559.dip0.t-ipconnect.de ([84.131.165.89])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 16 Feb 2009 21:56:31 +0000
Received: from vjensen by p5483a559.dip0.t-ipconnect.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 16 Feb 2009 21:56:31 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Vitus Jensen <vjensen@gmx.de>
Date: Mon, 16 Feb 2009 21:56:22 +0000 (UTC)
Message-ID: <gncne6$i0f$1@ger.gmane.org>
References: <1234795059.5643.2.camel@EPBYMINW0568>
	<87ljs6fgjx.fsf@neumann.lab.ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5483a559.dip0.t-ipconnect.de
User-Agent: Pan/0.133 (House of Butterflies)
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] neon: bump version to 0.28.3
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
X-List-Received-Date: Mon, 16 Feb 2009 21:58:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am Mon, 16 Feb 2009 14:16:34 -0300 schrieb Otavio Salvador:

> Ihar Hrachyshka <ihar.hrachyshka@gmail.com> writes:
> 
>> Seems that current neon versions doesn't work with gnutls 2.x
> 
> In this case I belive it could be droped; what others think?

Bad idea as "Please note: The neon API is subject to backwards-
incompatible change over minor versions (0.24.x -> 0.25.x) but is stable 
across patch releases (0.24.0 -> 0.24.x)." (http://www.webdav.org/neon/) 
and current recipes may rely on a specific minor version.  As least 
subversion and devfs2 tests neon versions.  I haven't checked the others.

Bye,
   Vitus

-- 
Vitus Jensen, Hannover, Germany, Earth, Milky Way, Universe (current)



